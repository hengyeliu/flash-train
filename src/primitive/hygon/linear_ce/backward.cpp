// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <algorithm>
#include <cstdint>
#include <limits>
#include <memory>

#include <rocblas.h>

#include "flash_train/error.hpp"
#include "flash_train/primitive/hygon/linear_ce/backward.hpp"
#include "backward_launch.hpp"

namespace ftrain {
namespace {

constexpr std::uint32_t kDefaultChunkV = 4096;

Result unsupported(const char* message) { return Result(FTRAIN_STATUS_UNSUPPORTED, message); }

bool isContiguous(FTrainIndexType index_type) { return index_type == FTRAIN_INDEX_TYPE_CONTINUOUS; }

bool hasAddress(void* address) { return address != nullptr; }

bool fitsRocblasInt(std::uint64_t value) {
    return value > 0 && value <= static_cast<std::uint64_t>(std::numeric_limits<rocblas_int>::max());
}

std::uint64_t workspaceBytes(std::uint32_t n, std::uint32_t chunk_v) {
    return static_cast<std::uint64_t>(n) * chunk_v * sizeof(std::uint16_t);
}

}  // namespace

LinearCEBackwardRocblas::LinearCEBackwardRocblas(const LinearCEBackwardRocblas&) noexcept {}

LinearCEBackwardRocblas::~LinearCEBackwardRocblas() {
    if (handle_ != nullptr) { (void)rocblas_destroy_handle(handle_); }
}

const char* LinearCEBackwardRocblas::getName() const noexcept { return "LinearCEBackwardRocblas"; }

std::unique_ptr<PrimitiveBase> LinearCEBackwardRocblas::clone() const {
    return std::make_unique<LinearCEBackwardRocblas>(*this);
}

Result LinearCEBackwardRocblas::isApplicable(const LinearCEBackwardProblem& problem, const Constraints&) const {
    if (problem.getConfiguredHiddenType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredWeightType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredLabelType() != FTRAIN_NUMERIC_TYPE_INT64 ||
        problem.getAccumulationType() != FTRAIN_NUMERIC_TYPE_FP32 ||
        problem.getIgnoreIndex() != -100 || problem.getReduction() != FTRAIN_LINEAR_CE_REDUCTION_MEAN) {
        return unsupported("backward rocBLAS supports BF16/BF16/INT64 with FP32 mean and ignore_index=-100 only");
    }
    if (problem.getConfiguredHiddenType() != problem.getDHiddenNumericType() ||
        problem.getConfiguredWeightType() != problem.getDWeightNumericType()) {
        return unsupported("backward gradient outputs must match hidden and weight types");
    }
    if (problem.getMainGradType() != FTRAIN_NUMERIC_TYPE_BF16 &&
        problem.getMainGradType() != FTRAIN_NUMERIC_TYPE_FP32) {
        return unsupported("backward main_grad supports BF16 or FP32 only");
    }
    if (problem.getHiddenRank() != 2 || problem.getWeightRank() != 2 || problem.getLabelsRank() != 1 ||
        problem.getDlossRank() != 0 || problem.getMaximumRank() != 1 || problem.getSavedLseRank() != 1 ||
        problem.getNumValidTokensRank() != 0 || problem.getMainGradRank() != 2 ||
        problem.getDHiddenRank() != 2 || problem.getDWeightRank() != 2) {
        return unsupported("backward requires rank-two matrices, rank-one vectors, and scalar metadata");
    }
    const std::uint64_t n = problem.getN();
    const std::uint64_t d = problem.getD();
    const std::uint64_t v = problem.getV();
    if (!fitsRocblasInt(n) || !fitsRocblasInt(d) || !fitsRocblasInt(v) || problem.getWeightD() != d ||
        problem.getLabelsLength() != n || problem.getMaximumLength() != n || problem.getSavedLseLength() != n ||
        problem.getDHiddenRows() != n || problem.getDHiddenCols() != d || problem.getDWeightRows() != v ||
        problem.getDWeightCols() != d || problem.getMainGradRows() != v || problem.getMainGradCols() != d ||
        problem.getShardVocabStart() > std::numeric_limits<std::uint64_t>::max() - v) {
        return unsupported("backward input and output dimensions are inconsistent");
    }
    if (v > std::numeric_limits<std::uint64_t>::max() / n ||
        n * v > std::numeric_limits<std::uint32_t>::max() ||
        d > std::numeric_limits<std::uint64_t>::max() / v ||
        d * v > std::numeric_limits<std::uint64_t>::max() / sizeof(std::uint16_t)) {
        return unsupported("backward dimensions exceed the runtime arithmetic range");
    }
    if (!problem.isDlossDeviceMemory() || !isContiguous(problem.getDlossIndexType()) ||
        !hasAddress(problem.getDlossAddress()) || !problem.isHiddenDeviceMemory() ||
        !isContiguous(problem.getHiddenIndexType()) || !hasAddress(problem.getHiddenAddress()) ||
        !problem.isWeightDeviceMemory() || !isContiguous(problem.getWeightIndexType()) ||
        !hasAddress(problem.getWeightAddress()) || !problem.isLabelsDeviceMemory() ||
        !isContiguous(problem.getLabelsIndexType()) || !hasAddress(problem.getLabelsAddress()) ||
        !problem.isMaximumDeviceMemory() || !isContiguous(problem.getMaximumIndexType()) ||
        !hasAddress(problem.getMaximumAddress()) || !problem.isSavedLseDeviceMemory() ||
        !isContiguous(problem.getSavedLseIndexType()) || !hasAddress(problem.getSavedLseAddress()) ||
        !problem.isNumValidTokensDeviceMemory() || !isContiguous(problem.getNumValidTokensIndexType()) ||
        !hasAddress(problem.getNumValidTokensAddress()) || !problem.isMainGradDeviceMemory() ||
        !isContiguous(problem.getMainGradIndexType()) || !hasAddress(problem.getMainGradAddress()) ||
        !problem.isDHiddenDeviceMemory() || !isContiguous(problem.getDHiddenIndexType()) ||
        !hasAddress(problem.getDHiddenAddress()) || !problem.isDWeightDeviceMemory() ||
        !isContiguous(problem.getDWeightIndexType()) || !hasAddress(problem.getDWeightAddress())) {
        return unsupported("backward requires contiguous device tensors with non-null addresses");
    }
    return Result{};
}

std::uint64_t LinearCEBackwardRocblas::getRequiredWorkspaceBytes() const noexcept { return workspace_bytes_; }

void LinearCEBackwardRocblas::configure(const LinearCEBackwardProblem& problem) {
    const Result result = isApplicable(problem, Constraints{0});
    if (!result.isSuccess()) { throw Exception(result.getStatus(), "%s", result.getMessage()); }

    n_ = static_cast<std::uint32_t>(problem.getN());
    d_ = static_cast<std::uint32_t>(problem.getD());
    v_ = static_cast<std::uint32_t>(problem.getV());
    chunk_v_ = std::min(v_, kDefaultChunkV);
    shard_vocab_start_ = problem.getShardVocabStart();
    dloss_ = static_cast<const float*>(problem.getDlossAddress());
    hidden_ = problem.getHiddenAddress();
    weight_ = problem.getWeightAddress();
    labels_ = static_cast<const std::int64_t*>(problem.getLabelsAddress());
    saved_lse_ = static_cast<const float*>(problem.getSavedLseAddress());
    num_valid_tokens_ = static_cast<const std::int64_t*>(problem.getNumValidTokensAddress());
    main_grad_ = problem.getMainGradAddress();
    d_hidden_ = problem.getDHiddenAddress();
    d_weight_ = problem.getDWeightAddress();
    main_grad_type_ = problem.getMainGradType();
    main_grad_mode_ = problem.getMainGradMode();
    workspace_bytes_ = workspaceBytes(n_, chunk_v_);

    if (rocblas_create_handle(&handle_) != rocblas_status_success) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "cannot create rocBLAS handle for Linear CE backward");
    }
}

void LinearCEBackwardRocblas::executeImpl(const Resources& resources) {
    if (rocblas_set_stream(handle_, resources.getStream()) != rocblas_status_success) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "cannot set rocBLAS stream for Linear CE backward");
    }
    if (rocblas_set_pointer_mode(handle_, rocblas_pointer_mode_host) != rocblas_status_success) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "cannot set rocBLAS pointer mode for Linear CE backward");
    }
    launchLinearCEBackward(handle_, dloss_, hidden_, weight_, labels_, saved_lse_, num_valid_tokens_, main_grad_,
                           d_hidden_, d_weight_, n_, d_, v_, chunk_v_, shard_vocab_start_, main_grad_type_,
                           main_grad_mode_,
                           resources.getWorkspace(), resources.getStream());
}

}  // namespace ftrain
