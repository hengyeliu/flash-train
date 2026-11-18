// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_FAMILY_MROPE_FAMILY_HPP_
#define FTRAIN_FAMILY_MROPE_FAMILY_HPP_
#include <memory>
#include <vector>
#include "flash_train/family/mrope/problem.hpp"
#include "flash_train/ops_args.hpp"
#include "flash_train/primitive.hpp"

namespace ftrain {
struct MropeForwardFamily {
    using Problem = MropeForwardProblem;
    struct Roles {
        Pattern pattern;
        FTrainTensorId input;
        FTrainTensorId raw_freqs;
        FTrainTensorId output;
        FTrainMropeForwardOpId mrope;
    };
    static const Roles& makeRoles() {
        static const Roles roles = [] {
            PatternBuilder builder;
            auto input     = builder.addOperand<OperandKind::kTensor>();
            auto raw_freqs = builder.addOperand<OperandKind::kTensor>();
            auto output    = builder.addOperand<OperandKind::kTensor>();
            auto op        = builder.addOperation<OperationKind::kMropeForward>(input, raw_freqs, output);
            return Roles{builder.buildPattern(), input, raw_freqs, output, op};
        }();
        return roles;
    }
    static Pattern makePattern() { return makeRoles().pattern; }
    static std::vector<std::shared_ptr<const Primitive<Problem>>> makeRecords();
    static Problem makeProblem(const Args& args) {
        const auto& roles = makeRoles();
        return Problem{std::get<Tensor>(
                           *args.getOperand(OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.input))),
                       std::get<Tensor>(*args.getOperand(
                           OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.raw_freqs))),
                       std::get<Tensor>(
                           *args.getOperand(OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.output))),
                       std::get<MropeAttributes>(*args.getOpArgument(
                           OperationTraits<OperationKind::kMropeForward>::createPatternOperationId(roles.mrope)))};
    }
};
struct MropeBackwardFamily {
    using Problem = MropeBackwardProblem;
    struct Roles {
        Pattern pattern;
        FTrainTensorId grad_output;
        FTrainTensorId raw_freqs;
        FTrainTensorId grad_input;
        FTrainMropeBackwardOpId mrope;
    };
    static const Roles& makeRoles() {
        static const Roles roles = [] {
            PatternBuilder builder;
            auto grad_output = builder.addOperand<OperandKind::kTensor>();
            auto raw_freqs   = builder.addOperand<OperandKind::kTensor>();
            auto grad_input  = builder.addOperand<OperandKind::kTensor>();
            auto op          = builder.addOperation<OperationKind::kMropeBackward>(grad_output, raw_freqs, grad_input);
            return Roles{builder.buildPattern(), grad_output, raw_freqs, grad_input, op};
        }();
        return roles;
    }
    static Pattern makePattern() { return makeRoles().pattern; }
    static std::vector<std::shared_ptr<const Primitive<Problem>>> makeRecords();
    static Problem makeProblem(const Args& args) {
        const auto& roles = makeRoles();
        return Problem{
            std::get<Tensor>(
                *args.getOperand(OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.grad_output))),
            std::get<Tensor>(
                *args.getOperand(OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.raw_freqs))),
            std::get<Tensor>(
                *args.getOperand(OperandTraits<OperandKind::kTensor>::createPatternOperandId(roles.grad_input))),
            std::get<MropeAttributes>(*args.getOpArgument(
                OperationTraits<OperationKind::kMropeBackward>::createPatternOperationId(roles.mrope)))};
    }
};
}  // namespace ftrain
#endif
