// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <limits>
#include <memory>

#include "flash_train/error.hpp"
#include "flash_train/primitive/hygon/linear_ce/forward_finalize.hpp"
#include "launch_finalize.hpp"

namespace ftrain {
namespace {

constexpr std::uint32_t kTile = 256;

std::uint64_t workspaceBytes(std::uint32_t n) {
    return static_cast<std::uint64_t>(n) * (sizeof(float) + sizeof(std::uint32_t)) + sizeof(std::uint32_t);
}

Result unsupported(const char* message) { return Result(FTRAIN_STATUS_UNSUPPORTED, message); }

bool isContiguous(FTrainIndexType index_type) { return index_type == FTRAIN_INDEX_TYPE_CONTINUOUS; }

}  // namespace

const char* LinearCEForwardFinalizeHip::getName() const noexcept {
    return "LinearCEForwardFinalizeHip";
}

std::unique_ptr<PrimitiveBase> LinearCEForwardFinalizeHip::clone() const {
    return std::make_unique<LinearCEForwardFinalizeHip>(*this);
}

Result LinearCEForwardFinalizeHip::isApplicable(const LinearCEForwardFinalizeProblem& problem,
                                                const Constraints&) const {
    if (problem.getConfiguredHiddenType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredWeightType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredLabelType() != FTRAIN_NUMERIC_TYPE_INT64 ||
        problem.getAccumulationType() != FTRAIN_NUMERIC_TYPE_FP32 ||
        problem.getIgnoreIndex() != -100 || problem.getReduction() != FTRAIN_LINEAR_CE_REDUCTION_MEAN) {
        return unsupported("finalize supports BF16/BF16/INT64 with FP32 mean and ignore_index=-100 only");
    }
    if (problem.getLseRank() != 1 || problem.getTargetLogitRank() != 1 || problem.getLabelsRank() != 1 ||
        problem.getMaximumRank() != 1 || problem.getSavedLseRank() != 1 || problem.getLossRank() != 0 ||
        problem.getNumValidTokensRank() != 0) {
        return unsupported("finalize requires vector inputs/outputs and scalar loss/count");
    }
    const std::uint64_t n = problem.getN();
    if (n == 0 || n > std::numeric_limits<std::uint32_t>::max() || problem.getLseLength() != n ||
        problem.getTargetLogitLength() != n || problem.getLabelsLength() != n ||
        problem.getMaximumLength() != n || problem.getSavedLseLength() != n) {
        return unsupported("finalize input and output dimensions are inconsistent");
    }
    if (!problem.isLseDeviceMemory() || !isContiguous(problem.getLseIndexType()) ||
        problem.getLseAddress() == nullptr || !problem.isTargetLogitDeviceMemory() ||
        !isContiguous(problem.getTargetLogitIndexType()) || problem.getTargetLogitAddress() == nullptr ||
        !problem.isLabelsDeviceMemory() || !isContiguous(problem.getLabelsIndexType()) ||
        problem.getLabelsAddress() == nullptr || !problem.isLossDeviceMemory() ||
        !isContiguous(problem.getLossIndexType()) || problem.getLossAddress() == nullptr ||
        !problem.isMaximumDeviceMemory() || !isContiguous(problem.getMaximumIndexType()) ||
        problem.getMaximumAddress() == nullptr || !problem.isSavedLseDeviceMemory() ||
        !isContiguous(problem.getSavedLseIndexType()) || problem.getSavedLseAddress() == nullptr ||
        !problem.isNumValidTokensDeviceMemory() || !isContiguous(problem.getNumValidTokensIndexType()) ||
        problem.getNumValidTokensAddress() == nullptr) {
        return unsupported("finalize requires contiguous device tensors with non-null addresses");
    }
    return Result{};
}

std::uint64_t LinearCEForwardFinalizeHip::getRequiredWorkspaceBytes() const noexcept {
    return workspace_bytes_;
}

void LinearCEForwardFinalizeHip::configure(const LinearCEForwardFinalizeProblem& problem) {
    const Result result = isApplicable(problem, Constraints{0});
    if (!result.isSuccess()) { throw Exception(result.getStatus(), "%s", result.getMessage()); }

    n_ = static_cast<std::uint32_t>(problem.getN());
    lse_ = static_cast<const float*>(problem.getLseAddress());
    target_logit_ = static_cast<const float*>(problem.getTargetLogitAddress());
    labels_ = static_cast<const std::int64_t*>(problem.getLabelsAddress());
    loss_ = static_cast<float*>(problem.getLossAddress());
    maximum_ = static_cast<float*>(problem.getMaximumAddress());
    saved_lse_ = static_cast<float*>(problem.getSavedLseAddress());
    num_valid_tokens_ = static_cast<std::int64_t*>(problem.getNumValidTokensAddress());
    workspace_bytes_ = workspaceBytes(n_);
}

void LinearCEForwardFinalizeHip::executeImpl(const Resources& resources) {
    launchLinearCEForwardFinalize(lse_, target_logit_, labels_, loss_, maximum_, saved_lse_, num_valid_tokens_, n_,
                                   resources.getWorkspace(), resources.getStream());
}

}  // namespace ftrain
