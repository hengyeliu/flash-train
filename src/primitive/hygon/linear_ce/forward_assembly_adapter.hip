// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <hip/hip_runtime.h>

#include "launch.hpp"

#if !defined(FTRAIN_LINEAR_CE_FORWARD_FAMILY_A)
#error "Select the Linear CE forward assembly family"
#endif

#define FTRAIN_LINEAR_CE_KERNEL_PARAMETERS                                      \
    std::uint64_t size_c, std::uint64_t size_a, std::uint64_t size_b, void* d, \
        void* c, const void* a, const void* b, float alpha, float beta,       \
        std::uint32_t stride_d0, std::uint32_t stride_d1,                     \
        std::uint32_t stride_c0, std::uint32_t stride_c1,                     \
        std::uint32_t stride_a0, std::uint32_t stride_a1,                     \
        std::uint32_t stride_b0, std::uint32_t stride_b1,                     \
        std::uint32_t sizes_free0, std::uint32_t sizes_free1,                 \
        std::uint32_t sizes_free2, std::uint32_t sizes_sum0,                 \
        std::int32_t orig_stagger_u_iter, std::uint32_t num_workgroups0,      \
        std::uint32_t num_workgroups1, std::uint32_t num_full_blocks,         \
        std::uint32_t wgm_remainder1,                                         \
        std::uint32_t magic_number_wgm_remainder1,                             \
        std::uint32_t offset_d, std::uint32_t offset_c,                       \
        std::uint32_t offset_a, std::uint32_t offset_b, std::uint32_t padding

extern "C" __global__ void hcu_linear_ce_forward_bf16_tn_family_a(
    FTRAIN_LINEAR_CE_KERNEL_PARAMETERS)
#if defined(__HIP_DEVICE_COMPILE__)
    ;
#else
    {}
#endif

extern "C" hipError_t launchLinearCEForwardAssembly(const ftrain::LinearCEForwardTensileArgs* args, dim3 grid,
                                                     dim3 block, hipStream_t stream) {
    hipLaunchKernelGGL(hcu_linear_ce_forward_bf16_tn_family_a, grid, block, 0, stream, args->size_c, args->size_a,
                       args->size_b, args->d, args->c, args->a, args->b, args->alpha, args->beta, args->stride_d0,
                       args->stride_d1, args->stride_c0, args->stride_c1, args->stride_a0, args->stride_a1,
                       args->stride_b0, args->stride_b1, args->sizes_free0, args->sizes_free1, args->sizes_free2,
                       args->sizes_sum0, args->orig_stagger_u_iter, args->num_workgroups0, args->num_workgroups1,
                       args->num_full_blocks, args->wgm_remainder1, args->magic_number_wgm_remainder1,
                       args->offset_d, args->offset_c, args->offset_a, args->offset_b, args->padding);
    return hipGetLastError();
}
