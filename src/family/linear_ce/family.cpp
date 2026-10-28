// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <memory>
#include <utility>
#include <vector>

#include "flash_train/family/linear_ce/family.hpp"
#include "flash_train/primitive/hygon/linear_ce/backward.hpp"
#include "flash_train/primitive/hygon/linear_ce/forward_finalize.hpp"
#include "flash_train/primitive/hygon/linear_ce/forward_partials.hpp"

namespace ftrain {

const LinearCEForwardPartialsFamily::Roles& LinearCEForwardPartialsFamily::makeRoles() {
    static const Roles roles = [] {
        PatternBuilder pattern;
        const FTrainTensorId hidden           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId weight           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId labels           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId lse_local        = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId target_logit     = pattern.addOperand<OperandKind::kTensor>();
        const FTrainLinearCEForwardPartialsOpId op =
            pattern.addOperation<OperationKind::kLinearCEForwardPartials>(hidden, weight, labels, lse_local,
                                                                           target_logit);
        return Roles{pattern.buildPattern(), hidden, weight, labels, lse_local, target_logit, op};
    }();
    return roles;
}

std::vector<std::shared_ptr<const Primitive<LinearCEForwardPartialsProblem>>>
LinearCEForwardPartialsFamily::makeRecords() {
    return {std::make_shared<LinearCEForwardPartialsAssembly>()};
}

LinearCEForwardPartialsFamily::Problem LinearCEForwardPartialsFamily::makeProblem(const Args& args) {
    const Roles& roles = makeRoles();
    const auto tensor = [&](FTrainTensorId id) -> Tensor {
        return std::get<Tensor>(*args.getOperand(PatternOperandId{id.opaque}));
    };
    return Problem{
        tensor(roles.hidden), tensor(roles.weight), tensor(roles.labels), tensor(roles.lse_local),
        tensor(roles.target_logit_local),
        std::get<LinearCEForwardPartialsAttributes>(
            *args.getOpArgument(PatternOperationId{roles.op.opaque}))};
}

const LinearCEForwardFinalizeFamily::Roles& LinearCEForwardFinalizeFamily::makeRoles() {
    static const Roles roles = [] {
        PatternBuilder pattern;
        const FTrainTensorId lse             = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId target_logit    = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId labels          = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId loss            = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId maximum         = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId saved_lse       = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId num_valid_count = pattern.addOperand<OperandKind::kTensor>();
        const FTrainLinearCEForwardFinalizeOpId op =
            pattern.addOperation<OperationKind::kLinearCEForwardFinalize>(lse, target_logit, labels, loss, maximum,
                                                                          saved_lse, num_valid_count);
        return Roles{pattern.buildPattern(), lse, target_logit, labels, loss, maximum, saved_lse, num_valid_count, op};
    }();
    return roles;
}

std::vector<std::shared_ptr<const Primitive<LinearCEForwardFinalizeProblem>>>
LinearCEForwardFinalizeFamily::makeRecords() {
    return {std::make_shared<LinearCEForwardFinalizeHip>()};
}

LinearCEForwardFinalizeFamily::Problem LinearCEForwardFinalizeFamily::makeProblem(const Args& args) {
    const Roles& roles = makeRoles();
    const auto tensor = [&](FTrainTensorId id) -> Tensor {
        return std::get<Tensor>(*args.getOperand(PatternOperandId{id.opaque}));
    };
    return Problem{
        tensor(roles.lse), tensor(roles.target_logit), tensor(roles.labels), tensor(roles.loss), tensor(roles.maximum),
        tensor(roles.saved_lse), tensor(roles.num_valid_tokens),
        std::get<LinearCEForwardFinalizeAttributes>(
            *args.getOpArgument(PatternOperationId{roles.op.opaque}))};
}

const LinearCEBackwardFamily::Roles& LinearCEBackwardFamily::makeRoles() {
    static const Roles roles = [] {
        PatternBuilder pattern;
        const FTrainTensorId dloss            = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId hidden           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId weight           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId labels           = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId maximum          = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId saved_lse        = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId num_valid_tokens = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId main_grad        = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId d_hidden         = pattern.addOperand<OperandKind::kTensor>();
        const FTrainTensorId d_weight         = pattern.addOperand<OperandKind::kTensor>();
        const FTrainLinearCEBackwardOpId op =
            pattern.addOperation<OperationKind::kLinearCEBackward>(
                dloss, hidden, weight, labels, maximum, saved_lse, num_valid_tokens, main_grad, d_hidden, d_weight);
        return Roles{pattern.buildPattern(), dloss, hidden, weight, labels, maximum, saved_lse, num_valid_tokens,
                     main_grad, d_hidden, d_weight, op};
    }();
    return roles;
}

std::vector<std::shared_ptr<const Primitive<LinearCEBackwardProblem>>> LinearCEBackwardFamily::makeRecords() {
    return {std::make_shared<LinearCEBackwardRocblas>()};
}

LinearCEBackwardFamily::Problem LinearCEBackwardFamily::makeProblem(const Args& args) {
    const Roles& roles = makeRoles();
    const auto tensor = [&](FTrainTensorId id) -> Tensor {
        return std::get<Tensor>(*args.getOperand(PatternOperandId{id.opaque}));
    };
    return Problem{
        tensor(roles.dloss), tensor(roles.hidden), tensor(roles.weight), tensor(roles.labels), tensor(roles.maximum),
        tensor(roles.saved_lse), tensor(roles.num_valid_tokens), tensor(roles.main_grad), tensor(roles.d_hidden),
        tensor(roles.d_weight), std::get<LinearCEBackwardAttributes>(
                                    *args.getOpArgument(PatternOperationId{roles.op.opaque}))};
}

}  // namespace ftrain
