// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_PARTIALS_LAUNCH_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_PARTIALS_LAUNCH_HPP_

#include <cstdint>

#include <hip/hip_runtime_api.h>

#include "flash_train/common.h"

namespace ftrain {

struct alignas(8) LinearCEForwardTensileArgs {
    std::uint64_t size_c;
    std::uint64_t size_a;
    std::uint64_t size_b;
    void* d;
    void* c;
    const void* a;
    const void* b;
    float alpha;
    float beta;
    std::uint32_t stride_d0;
    std::uint32_t stride_d1;
    std::uint32_t stride_c0;
    std::uint32_t stride_c1;
    std::uint32_t stride_a0;
    std::uint32_t stride_a1;
    std::uint32_t stride_b0;
    std::uint32_t stride_b1;
    std::uint32_t sizes_free0;
    std::uint32_t sizes_free1;
    std::uint32_t sizes_free2;
    std::uint32_t sizes_sum0;
    std::int32_t orig_stagger_u_iter;
    std::uint32_t num_workgroups0;
    std::uint32_t num_workgroups1;
    std::uint32_t num_full_blocks;
    std::uint32_t wgm_remainder1;
    std::uint32_t magic_number_wgm_remainder1;
    std::uint32_t offset_d;
    std::uint32_t offset_c;
    std::uint32_t offset_a;
    std::uint32_t offset_b;
    std::uint32_t padding;
};
static_assert(sizeof(LinearCEForwardTensileArgs) == 160, "Linear CE Tensile ABI changed");

extern "C" hipError_t launchLinearCEForwardAssembly(const LinearCEForwardTensileArgs* args, dim3 grid, dim3 block,
                                                    hipStream_t stream);

void launchLinearCEForwardPartials(const void* hidden, const void* weight,
                                   const std::int64_t* labels, float* lse_local, float* target_logit_local,
                                   std::uint32_t n, std::uint32_t d, std::uint32_t v,
                                   std::int64_t shard_vocab_start, void* workspace, FTrainStream stream);

}  // namespace ftrain

#endif
