// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include "flash_train/family/gdn/family.hpp"
#if FTRAIN_HAS_GDN_GFX936
#include "flash_train/primitive/hygon/gdn/fused_forward.hpp"
#include "flash_train/primitive/hygon/gdn/four_forward.hpp"
#include "flash_train/primitive/hygon/gdn/chunk_backward.hpp"
#endif
#if FTRAIN_HAS_GDN2_GFX936
#include "flash_train/primitive/hygon/gdn2/chunk_forward.hpp"
#include "flash_train/primitive/hygon/gdn2/chunk_backward.hpp"
#endif

namespace ftrain {

std::vector<std::shared_ptr<const Primitive<GdnForwardProblem>>> GdnForwardFamily::makeRecords() {
#if FTRAIN_HAS_GDN_GFX936
    return {std::make_shared<GdnFourForward>(),
            std::make_shared<GdnFusedForward>(FTRAIN_NUMERIC_TYPE_BF16),
            std::make_shared<GdnFusedForward>(FTRAIN_NUMERIC_TYPE_FP32)};
#else
    return {};
#endif
}

std::vector<std::shared_ptr<const Primitive<GdnBackwardProblem>>> GdnBackwardFamily::makeRecords() {
#if FTRAIN_HAS_GDN_GFX936
    return {std::make_shared<GdnChunkBackward>()};
#else
    return {};
#endif
}

std::vector<std::shared_ptr<const Primitive<Gdn2ForwardProblem>>> Gdn2ForwardFamily::makeRecords() {
#if FTRAIN_HAS_GDN2_GFX936
    return {std::make_shared<Gdn2ChunkForward>()};
#else
    return {};
#endif
}

std::vector<std::shared_ptr<const Primitive<Gdn2BackwardProblem>>> Gdn2BackwardFamily::makeRecords() {
#if FTRAIN_HAS_GDN2_GFX936
    return {std::make_shared<Gdn2ChunkBackward>()};
#else
    return {};
#endif
}

}  // namespace ftrain
