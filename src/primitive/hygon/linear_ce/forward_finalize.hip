// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <cmath>

#include <hip/hip_runtime.h>

#include "flash_train/error.hpp"
#include "launch_finalize.hpp"

namespace ftrain {
namespace {

constexpr std::uint32_t kTile = 256;

__global__ void finalizeLoss(const float* lse, const float* target_logit, const std::int64_t* labels, float* token_losses,
                             std::uint32_t* valid_flags, float* saved_lse, std::uint32_t n) {
    const std::uint32_t token = blockIdx.x * blockDim.x + threadIdx.x;
    if (token >= n) { return; }
    saved_lse[token] = lse[token];
    const bool valid = labels[token] != -100;
    token_losses[token] = valid ? lse[token] - target_logit[token] : 0.0F;
    valid_flags[token] = valid ? 1U : 0U;
}

__global__ void meanLoss(const float* token_losses, const std::uint32_t* valid_flags, float* loss,
                         std::uint32_t* valid_count, std::uint32_t n) {
    __shared__ float sums[kTile];
    __shared__ std::uint32_t counts[kTile];
    float sum = 0.0F;
    std::uint32_t count = 0;
    for (std::uint32_t token = threadIdx.x; token < n; token += blockDim.x) {
        sum += token_losses[token];
        count += valid_flags[token];
    }
    sums[threadIdx.x] = sum;
    counts[threadIdx.x] = count;
    __syncthreads();
    for (std::uint32_t offset = kTile / 2; offset != 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            sums[threadIdx.x] += sums[threadIdx.x + offset];
            counts[threadIdx.x] += counts[threadIdx.x + offset];
        }
        __syncthreads();
    }
    if (threadIdx.x == 0) {
        valid_count[0] = counts[0];
        loss[0] = counts[0] == 0 ? NAN : sums[0] / static_cast<float>(counts[0]);
    }
}

__global__ void copyCount(const std::uint32_t* source, std::int64_t* destination) {
    if (blockIdx.x == 0 && threadIdx.x == 0) { destination[0] = static_cast<std::int64_t>(source[0]); }
}

void checkHip(hipError_t status, const char* operation) {
    if (status != hipSuccess) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "%s failed: %s", operation, hipGetErrorString(status));
    }
}

}  // namespace

void launchLinearCEForwardFinalize(const float* lse, const float* target_logit, const std::int64_t* labels,
                                   float* loss, float* maximum, float* saved_lse, std::int64_t* num_valid_tokens,
                                   std::uint32_t n, void* workspace, FTrainStream stream) {
    auto* bytes = static_cast<std::uint8_t*>(workspace);
    auto* token_losses = reinterpret_cast<float*>(bytes);
    auto* valid_flags = reinterpret_cast<std::uint32_t*>(token_losses + n);
    auto* valid_count = valid_flags + n;

    checkHip(hipMemsetAsync(maximum, 0, static_cast<std::size_t>(n) * sizeof(float), stream),
             "Linear CE maximum initialization");
    hipLaunchKernelGGL(finalizeLoss, dim3((n + kTile - 1) / kTile), dim3(kTile), 0, stream, lse, target_logit, labels,
                       token_losses, valid_flags, saved_lse, n);
    checkHip(hipGetLastError(), "Linear CE finalize-loss launch");
    hipLaunchKernelGGL(meanLoss, dim3(1), dim3(kTile), 0, stream, token_losses, valid_flags, loss, valid_count, n);
    checkHip(hipGetLastError(), "Linear CE mean-loss launch");
    hipLaunchKernelGGL(copyCount, dim3(1), dim3(1), 0, stream, valid_count, num_valid_tokens);
    checkHip(hipGetLastError(), "Linear CE valid-count launch");
}

}  // namespace ftrain
