// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_LAUNCH_FINALIZE_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_LAUNCH_FINALIZE_HPP_

#include <cstdint>

#include "flash_train/common.h"

namespace ftrain {

void launchLinearCEForwardFinalize(const float* lse, const float* target_logit, const std::int64_t* labels,
                                   float* loss, float* maximum, float* saved_lse, std::int64_t* num_valid_tokens,
                                   std::uint32_t n, void* workspace, FTrainStream stream);

}  // namespace ftrain

#endif
