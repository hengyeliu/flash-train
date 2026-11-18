// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_FAMILY_MROPE_FINDER_HPP_
#define FTRAIN_FAMILY_MROPE_FINDER_HPP_
#include <string>
#include <vector>
#include "flash_train/constraints.hpp"
#include "flash_train/family/mrope/problem.hpp"
namespace ftrain {
// Explicit direction-specific candidates; Engine checks their applicability.
// This is deterministic selection, not online autotune or disk persistence.
struct MropeRegistrationOrderFinder {
    static const char* getName() { return "MropeRegistrationOrder"; }
    static std::vector<std::string> findCandidates(const MropeForwardProblem&, const Constraints&) {
        return {"HygonMropeForward02PackedTail"};
    }
    static std::vector<std::string> findCandidates(const MropeBackwardProblem&, const Constraints&) {
        return {"HygonMropeBackward02PackedTail"};
    }
};
}  // namespace ftrain
#endif
