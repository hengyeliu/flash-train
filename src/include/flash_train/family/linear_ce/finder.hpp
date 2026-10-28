// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_FAMILY_LINEAR_CE_FINDER_HPP_
#define FTRAIN_FAMILY_LINEAR_CE_FINDER_HPP_

#include <string>
#include <vector>

#include "flash_train/constraints.hpp"
#include "flash_train/family/linear_ce/problem.hpp"

namespace ftrain {

namespace detail {

template<typename Problem>
struct LinearCECandidateNames;

template<>
struct LinearCECandidateNames<LinearCEForwardPartialsProblem> {
    static std::vector<std::string> get(const Constraints&) {
        // Architecture-specific forward candidates are ordered here. The
        // current formal migration registers the gfx936 assembly primitive.
        return {"LinearCEForwardPartialsAssembly"};
    }
};

template<>
struct LinearCECandidateNames<LinearCEForwardFinalizeProblem> {
    static std::vector<std::string> get(const Constraints&) {
        return {"LinearCEForwardFinalizeHip"};
    }
};

template<>
struct LinearCECandidateNames<LinearCEBackwardProblem> {
    static std::vector<std::string> get(const Constraints&) {
        return {"LinearCEBackward"};
    }
};

}  // namespace detail

template<typename Problem>
struct LinearCERegistrationOrderFinder final {
    static const char* getName() { return "LinearCERegistrationOrder"; }

    static std::vector<std::string> findCandidates(const Problem&, const Constraints& constraints) {
        return detail::LinearCECandidateNames<Problem>::get(constraints);
    }
};

}  // namespace ftrain

#endif
