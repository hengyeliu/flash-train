// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cmath>
#include <cstdint>

#include <hip/hip_runtime.h>

#include "flash_train/error.hpp"
#include "launch.hpp"

namespace ftrain {
namespace {

constexpr std::uint32_t kTile = 256;
constexpr std::uint32_t kBlockSize = 768;
constexpr std::uint32_t kWgm = 8;

__global__ void makeShardLabels(const std::int64_t* labels, std::int64_t* shard_labels, std::uint32_t n,
                                std::int64_t shard_vocab_start, std::int64_t v) {
    const std::uint32_t token = blockIdx.x * blockDim.x + threadIdx.x;
    if (token >= n) { return; }
    const std::int64_t local = labels[token] - shard_vocab_start;
    shard_labels[token] = local >= 0 && local < v ? local : v;
}

__global__ void reducePartials(const float* max_partial, const float* sum_partial, const float* target_logits,
                               float* lse_local, float* target_logit_local, std::uint32_t n, std::uint32_t v_tiles) {
    __shared__ float values[kTile];
    const std::uint32_t token = blockIdx.x;
    float maximum = -INFINITY;
    for (std::uint32_t tile = threadIdx.x; tile < v_tiles; tile += blockDim.x) {
        const std::uint64_t index = static_cast<std::uint64_t>(tile) * n + token;
        maximum = fmaxf(maximum, max_partial[index]);
    }
    values[threadIdx.x] = maximum;
    __syncthreads();
    for (std::uint32_t offset = kTile / 2; offset != 0; offset >>= 1) {
        if (threadIdx.x < offset) { values[threadIdx.x] = fmaxf(values[threadIdx.x], values[threadIdx.x + offset]); }
        __syncthreads();
    }
    const float global_max = values[0];
    float sum = 0.0F;
    for (std::uint32_t tile = threadIdx.x; tile < v_tiles; tile += blockDim.x) {
        const std::uint64_t index = static_cast<std::uint64_t>(tile) * n + token;
        sum += sum_partial[index] * expf(max_partial[index] - global_max);
    }
    values[threadIdx.x] = sum;
    __syncthreads();
    for (std::uint32_t offset = kTile / 2; offset != 0; offset >>= 1) {
        if (threadIdx.x < offset) { values[threadIdx.x] += values[threadIdx.x + offset]; }
        __syncthreads();
    }
    if (threadIdx.x == 0) {
        lse_local[token] = global_max + logf(values[0]);
        target_logit_local[token] = target_logits[token];
    }
}

std::uint32_t magicForDivisor(std::uint32_t divisor) {
    return static_cast<std::uint32_t>((std::uint64_t{1} << 31) / divisor + 1);
}

void checkHip(hipError_t status, const char* operation) {
    if (status != hipSuccess) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "%s failed: %s", operation, hipGetErrorString(status));
    }
}

}  // namespace

void launchLinearCEForwardPartials(const void* hidden, const void* weight,
                                   const std::int64_t* labels, float* lse_local, float* target_logit_local,
                                   std::uint32_t n, std::uint32_t d, std::uint32_t v,
                                   std::int64_t shard_vocab_start, void* workspace, FTrainStream stream) {
    const std::uint32_t v_tiles = v / kTile;
    const std::uint64_t partial_elements = static_cast<std::uint64_t>(v_tiles) * n;
    auto* bytes = static_cast<std::uint8_t*>(workspace);
    auto* max_partial = reinterpret_cast<float*>(bytes);
    auto* sum_partial = max_partial + partial_elements;
    auto* target_logits = sum_partial + partial_elements;
    auto* shard_labels = reinterpret_cast<std::int64_t*>(target_logits + n);

    checkHip(hipMemsetAsync(target_logits, 0, static_cast<std::size_t>(n) * sizeof(float), stream),
             "Linear CE target-logit initialization");
    hipLaunchKernelGGL(makeShardLabels, dim3((n + kTile - 1) / kTile), dim3(kTile), 0, stream, labels, shard_labels, n,
                       shard_vocab_start, static_cast<std::int64_t>(v));
    checkHip(hipGetLastError(), "Linear CE shard-label launch");

    LinearCEForwardTensileArgs args{};
    args.size_c = static_cast<std::uint64_t>(v) * n;
    args.size_a = static_cast<std::uint64_t>(v) * d;
    args.size_b = static_cast<std::uint64_t>(d) * n;
    args.d = bytes;
    args.c = shard_labels;
    args.a = weight;
    args.b = hidden;
    args.alpha = 1.0F;
    args.beta = 0.0F;
    // The assembly producer writes the compact [V/256, N] partial layout.
    // Legacy make_forward_args() therefore leaves D/C strides zero; using
    // full-logit GEMM strides here makes the exact-shape kernel fault.
    args.stride_d0 = 0;
    args.stride_d1 = 0;
    args.stride_c0 = 0;
    args.stride_c1 = 0;
    args.stride_a0 = d;
    args.stride_a1 = static_cast<std::uint32_t>(args.size_a);
    args.stride_b0 = d;
    args.stride_b1 = static_cast<std::uint32_t>(args.size_b);
    args.sizes_free0 = v;
    args.sizes_free1 = n;
    args.sizes_free2 = 1;
    args.sizes_sum0 = d;
    args.num_workgroups0 = v / kTile;
    args.num_workgroups1 = n / kTile;
    args.num_full_blocks = args.num_workgroups1 / kWgm;
    args.wgm_remainder1 = args.num_workgroups1 % kWgm;
    if (args.wgm_remainder1 == 0) { args.wgm_remainder1 = kWgm; }
    args.magic_number_wgm_remainder1 = magicForDivisor(args.wgm_remainder1);

    checkHip(launchLinearCEForwardAssembly(&args, dim3(args.num_workgroups0, args.num_workgroups1, 1),
                                          dim3(kBlockSize, 1, 1), stream),
             "Linear CE forward assembly launch");

    hipLaunchKernelGGL(reducePartials, dim3(n), dim3(kTile), 0, stream, max_partial, sum_partial, target_logits,
                       lse_local, target_logit_local, n, v_tiles);
    checkHip(hipGetLastError(), "Linear CE partial reduction launch");
}

}  // namespace ftrain
