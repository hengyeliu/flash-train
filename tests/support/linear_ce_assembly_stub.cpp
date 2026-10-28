// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <hip/hip_runtime_api.h>

#include <cstdint>

namespace ftrain {
struct alignas(8) LinearCEForwardTensileArgs {
    std::uint64_t fields[20];
};
}  // namespace ftrain

extern "C" hipError_t launchLinearCEForwardAssembly(const ftrain::LinearCEForwardTensileArgs*, dim3, dim3,
                                                     hipStream_t) {
    return hipErrorNotSupported;
}
