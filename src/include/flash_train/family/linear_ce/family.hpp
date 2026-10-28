// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_FAMILY_LINEAR_CE_FAMILY_HPP_
#define FTRAIN_FAMILY_LINEAR_CE_FAMILY_HPP_

#include <memory>
#include <vector>

#include "flash_train/family/linear_ce/problem.hpp"
#include "flash_train/ops_args.hpp"
#include "flash_train/pattern.hpp"
#include "flash_train/primitive.hpp"

namespace ftrain {

struct LinearCEForwardPartialsFamily {
    using Problem = LinearCEForwardPartialsProblem;

    struct Roles {
        Pattern pattern;
        FTrainTensorId hidden;
        FTrainTensorId weight;
        FTrainTensorId labels;
        FTrainTensorId lse_local;
        FTrainTensorId target_logit_local;
        FTrainLinearCEForwardPartialsOpId op;
    };

    static const Roles& makeRoles();
    static Pattern makePattern() { return makeRoles().pattern; }
    static std::vector<std::shared_ptr<const Primitive<Problem>>> makeRecords();
    static Problem makeProblem(const Args& args);
};

struct LinearCEForwardFinalizeFamily {
    using Problem = LinearCEForwardFinalizeProblem;

    struct Roles {
        Pattern pattern;
        FTrainTensorId lse;
        FTrainTensorId target_logit;
        FTrainTensorId labels;
        FTrainTensorId loss;
        FTrainTensorId maximum;
        FTrainTensorId saved_lse;
        FTrainTensorId num_valid_tokens;
        FTrainLinearCEForwardFinalizeOpId op;
    };

    static const Roles& makeRoles();
    static Pattern makePattern() { return makeRoles().pattern; }
    static std::vector<std::shared_ptr<const Primitive<Problem>>> makeRecords();
    static Problem makeProblem(const Args& args);
};

struct LinearCEBackwardFamily {
    using Problem = LinearCEBackwardProblem;

    struct Roles {
        Pattern pattern;
        FTrainTensorId dloss;
        FTrainTensorId hidden;
        FTrainTensorId weight;
        FTrainTensorId labels;
        FTrainTensorId maximum;
        FTrainTensorId saved_lse;
        FTrainTensorId num_valid_tokens;
        FTrainTensorId main_grad;
        FTrainTensorId d_hidden;
        FTrainTensorId d_weight;
        FTrainLinearCEBackwardOpId op;
    };

    static const Roles& makeRoles();
    static Pattern makePattern() { return makeRoles().pattern; }
    static std::vector<std::shared_ptr<const Primitive<Problem>>> makeRecords();
    static Problem makeProblem(const Args& args);
};

}  // namespace ftrain

#endif
