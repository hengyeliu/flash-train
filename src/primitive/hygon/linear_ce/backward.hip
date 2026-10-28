// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <algorithm>
#include <cstdint>

#include <hip/hip_runtime.h>
#include <rocblas.h>

#include "flash_train/error.hpp"
#include "backward_launch.hpp"

namespace ftrain {
namespace {

__device__ float bf16ToFloat(std::uint16_t value) {
    return __uint_as_float(static_cast<std::uint32_t>(value) << 16);
}

__device__ std::uint16_t floatToBf16(float value) {
    std::uint32_t bits = __float_as_uint(value);
    bits += 0x7fffU + ((bits >> 16) & 1U);
    return static_cast<std::uint16_t>(bits >> 16);
}

__global__ void logitsToDlogits(std::uint16_t* scratch, std::uint32_t chunk_v, std::uint32_t vocab_start,
                                std::uint64_t shard_vocab_start,
                                const float* saved_lse, const std::int64_t* labels, const std::int64_t* valid_count,
                                const float* upstream_grad, std::uint32_t n) {
    const std::uint32_t token = blockIdx.x;
    if (token >= n) { return; }
    const std::int64_t target = labels[token];
    const std::int64_t count = valid_count[0];
    const bool active = count != 0 && target != -100;
    const float scale = active ? upstream_grad[0] / static_cast<float>(count) : 0.0F;
    for (std::uint32_t local = threadIdx.x; local < chunk_v; local += blockDim.x) {
        const std::uint64_t index = static_cast<std::uint64_t>(token) * chunk_v + local;
        float gradient = 0.0F;
        if (active) {
            gradient = (expf(bf16ToFloat(scratch[index]) - saved_lse[token]) -
                        (shard_vocab_start + static_cast<std::uint64_t>(vocab_start) + local ==
                                 static_cast<std::uint64_t>(target)
                             ? 1.0F
                             : 0.0F)) *
                       scale;
        }
        scratch[index] = floatToBf16(gradient);
    }
}

__global__ void accumulateMainGradBf16(const std::uint16_t* gradient, std::uint16_t* main_grad,
                                       std::uint64_t elements) {
    const std::uint64_t index = static_cast<std::uint64_t>(blockIdx.x) * blockDim.x + threadIdx.x;
    if (index < elements) {
        main_grad[index] = floatToBf16(bf16ToFloat(main_grad[index]) + bf16ToFloat(gradient[index]));
    }
}

__global__ void accumulateMainGradFp32(const std::uint16_t* gradient, float* main_grad, std::uint64_t elements) {
    const std::uint64_t index = static_cast<std::uint64_t>(blockIdx.x) * blockDim.x + threadIdx.x;
    if (index < elements) { main_grad[index] += bf16ToFloat(gradient[index]); }
}

void checkHip(hipError_t status, const char* operation) {
    if (status != hipSuccess) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "%s failed: %s", operation, hipGetErrorString(status));
    }
}

void checkRocblas(rocblas_status status, const char* operation) {
    if (status != rocblas_status_success) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "%s failed with rocBLAS status %d", operation,
                        static_cast<int>(status));
    }
}

void launchGemm(rocblas_handle handle, rocblas_operation trans_a, rocblas_operation trans_b, std::uint32_t m,
                std::uint32_t n, std::uint32_t k, std::uint32_t lda, std::uint32_t ldb, std::uint32_t ldc,
                const void* a, std::uint64_t a_elements, const void* b, std::uint64_t b_elements, void* d,
                std::uint64_t d_elements, float beta) {
    const float alpha = 1.0F;
    checkRocblas(rocblas_gemm_strided_batched_ex(
                     handle, trans_a, trans_b, static_cast<rocblas_int>(m), static_cast<rocblas_int>(n),
                     static_cast<rocblas_int>(k), &alpha, a, rocblas_datatype_bf16_r,
                     static_cast<rocblas_int>(lda), static_cast<rocblas_stride>(a_elements), b,
                     rocblas_datatype_bf16_r, static_cast<rocblas_int>(ldb), static_cast<rocblas_stride>(b_elements),
                     &beta, d, rocblas_datatype_bf16_r, static_cast<rocblas_int>(ldc),
                     static_cast<rocblas_stride>(d_elements), d, rocblas_datatype_bf16_r,
                     static_cast<rocblas_int>(ldc), static_cast<rocblas_stride>(d_elements), 1,
                     rocblas_datatype_f32_r, rocblas_gemm_algo_standard, 0, 0),
                 "Linear CE backward rocBLAS GEMM");
}

}  // namespace

void launchLinearCEBackward(rocblas_handle handle, const float* dloss, const void* hidden, const void* weight,
                            const std::int64_t* labels, const float* saved_lse,
                            const std::int64_t* num_valid_tokens, void* main_grad, void* d_hidden, void* d_weight,
                            std::uint32_t n, std::uint32_t d, std::uint32_t v, std::uint32_t chunk_v,
                            std::uint64_t shard_vocab_start,
                            FTrainNumericType main_grad_type, FTrainLinearCEMainGradMode main_grad_mode,
                            void* workspace, FTrainStream stream) {
    auto* scratch = static_cast<std::uint16_t*>(workspace);
    const std::uint32_t chunks = (v + chunk_v - 1) / chunk_v;
    for (std::uint32_t chunk = 0; chunk < chunks; ++chunk) {
        const std::uint32_t vocab_start = chunk * chunk_v;
        const std::uint32_t actual_chunk_v = std::min(chunk_v, v - vocab_start);
        const auto* weight_chunk =
            static_cast<const std::uint16_t*>(weight) + static_cast<std::uint64_t>(vocab_start) * d;
        auto* d_weight_chunk =
            static_cast<std::uint16_t*>(d_weight) + static_cast<std::uint64_t>(vocab_start) * d;

        launchGemm(handle, rocblas_operation_transpose, rocblas_operation_none, actual_chunk_v, n, d, d, d,
                   actual_chunk_v, weight_chunk, static_cast<std::uint64_t>(actual_chunk_v) * d, hidden,
                   static_cast<std::uint64_t>(d) * n, scratch, static_cast<std::uint64_t>(actual_chunk_v) * n, 0.0F);
        hipLaunchKernelGGL(logitsToDlogits, dim3(n), dim3(256), 0, stream, scratch, actual_chunk_v, vocab_start,
                           shard_vocab_start, saved_lse, labels, num_valid_tokens, dloss, n);
        checkHip(hipGetLastError(), "Linear CE dlogits launch");

        launchGemm(handle, rocblas_operation_none, rocblas_operation_none, d, n, actual_chunk_v, d, actual_chunk_v,
                   d, weight_chunk, static_cast<std::uint64_t>(d) * actual_chunk_v, scratch,
                   static_cast<std::uint64_t>(actual_chunk_v) * n, d_hidden, static_cast<std::uint64_t>(d) * n,
                   chunk == 0 ? 0.0F : 1.0F);
        launchGemm(handle, rocblas_operation_none, rocblas_operation_transpose, d, actual_chunk_v, n, d,
                   actual_chunk_v, d, hidden, static_cast<std::uint64_t>(d) * n, scratch,
                   static_cast<std::uint64_t>(actual_chunk_v) * n, d_weight_chunk,
                   static_cast<std::uint64_t>(d) * actual_chunk_v, 0.0F);

        if (main_grad_mode == FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_ACCUMULATE) {
            const std::uint64_t elements = static_cast<std::uint64_t>(actual_chunk_v) * d;
            const std::uint32_t blocks = static_cast<std::uint32_t>((elements + 255) / 256);
            if (main_grad_type == FTRAIN_NUMERIC_TYPE_BF16) {
                hipLaunchKernelGGL(accumulateMainGradBf16, dim3(blocks), dim3(256), 0, stream, d_weight_chunk,
                                   static_cast<std::uint16_t*>(main_grad) +
                                       static_cast<std::uint64_t>(vocab_start) * d,
                                   elements);
            } else {
                hipLaunchKernelGGL(accumulateMainGradFp32, dim3(blocks), dim3(256), 0, stream, d_weight_chunk,
                                   static_cast<float*>(main_grad) + static_cast<std::uint64_t>(vocab_start) * d,
                                   elements);
            }
            checkHip(hipGetLastError(), "Linear CE main_grad accumulation launch");
        }
    }
}

}  // namespace ftrain
