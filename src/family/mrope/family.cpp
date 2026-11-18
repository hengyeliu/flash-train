// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include "flash_train/primitive/hygon/mrope/mrope.hpp"
#include "flash_train/family/mrope/family.hpp"
namespace ftrain {
std::vector<std::shared_ptr<const Primitive<MropeForwardProblem>>> MropeForwardFamily::makeRecords() {
    return {std::make_shared<MropeForward>()};
}
std::vector<std::shared_ptr<const Primitive<MropeBackwardProblem>>> MropeBackwardFamily::makeRecords() {
    return {std::make_shared<MropeBackward>()};
}
}  // namespace ftrain
