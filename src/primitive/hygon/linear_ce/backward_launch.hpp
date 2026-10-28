// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_BACKWARD_LAUNCH_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_BACKWARD_LAUNCH_HPP_

#include <cstdint>

#include <rocblas.h>

#include "flash_train/common.h"

namespace ftrain {

void launchLinearCEBackward(rocblas_handle handle, const float* dloss, const void* hidden, const void* weight,
                            const std::int64_t* labels, const float* saved_lse,
                            const std::int64_t* num_valid_tokens, void* main_grad, void* d_hidden, void* d_weight,
                            std::uint32_t n, std::uint32_t d, std::uint32_t v, std::uint32_t chunk_v,
                            std::uint64_t shard_vocab_start,
                            FTrainNumericType main_grad_type, FTrainLinearCEMainGradMode main_grad_mode,
                            void* workspace, FTrainStream stream);

}  // namespace ftrain

#endif
