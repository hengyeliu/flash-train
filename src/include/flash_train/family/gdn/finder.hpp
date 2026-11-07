// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_FAMILY_GDN_FINDER_HPP_
#define FTRAIN_FAMILY_GDN_FINDER_HPP_

#include <string>
#include <vector>

#include "flash_train/constraints.hpp"
#include "flash_train/family/gdn/problem.hpp"

namespace ftrain {

template<OperationKind Kind>
struct GdnRegistrationOrderFinder {
    static const char* getName() { return "GdnCandidateOrder"; }
    static std::vector<std::string> findCandidates(const GdnProblem<Kind>& problem, const Constraints&) {
        if constexpr (Kind == OperationKind::kGdnForward) {
            const bool four_kernel_shape =
                !problem.hasH0() && !problem.hasHt() && problem.getS() >= 512 &&
                problem.getS() % 64 == 0 &&
                (problem.getK() == 64 || problem.getK() == 128) &&
                (problem.getV() == 64 || problem.getV() == 128);
            if (problem.getQNumericType() == FTRAIN_NUMERIC_TYPE_BF16) {
                if (four_kernel_shape) {
                    return {"GdnFourForwardBf16", "GdnFusedForwardBf16"};
                }
                return {"GdnFusedForwardBf16"};
            }
            return {"GdnFusedForwardFp32"};
        } else if constexpr (Kind == OperationKind::kGdnBackward) {
            return {"GdnChunkBackwardBf16"};
        } else if constexpr (Kind == OperationKind::kGdn2Forward) {
            return {"Gdn2ChunkForwardBf16"};
        } else {
            return {"Gdn2ChunkBackwardBf16"};
        }
    }
};

}  // namespace ftrain

#endif
