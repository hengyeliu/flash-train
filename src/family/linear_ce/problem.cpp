// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <string>
#include <utility>
#include <vector>

#include "flash_train/error.hpp"
#include "flash_train/family/linear_ce/problem.hpp"

namespace ftrain {
namespace {

const StorageView& view(const Tensor& tensor) noexcept { return tensor.getStorageView(); }

void requireRank(const Tensor& tensor, std::size_t rank, const char* name) {
    if (view(tensor).getDims().size() != rank) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE %s must have rank %zu", name, rank);
    }
}

void requireType(const Tensor& tensor, FTrainNumericType type, const char* name) {
    if (view(tensor).getNumericType() != type) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE %s has numeric type %u, expected %u", name,
                        static_cast<unsigned int>(view(tensor).getNumericType()), static_cast<unsigned int>(type));
    }
}

void requireDevice(const Tensor& tensor, const char* name) {
    if (view(tensor).isHostMemory()) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE %s must be in device memory", name);
    }
}

void requireScalar(const Tensor& tensor, const char* name) { requireRank(tensor, 0, name); }

void requireDataAttributes(const LinearCEDataAttributes& attributes) {
    if (attributes.getHiddenType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        attributes.getWeightType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        attributes.getLabelType() != FTRAIN_NUMERIC_TYPE_INT64 ||
        attributes.getAccumulationType() != FTRAIN_NUMERIC_TYPE_FP32) {
        throw Exception(FTRAIN_STATUS_UNSUPPORTED,
                        "Linear CE Phase A supports hidden/weight BF16, labels INT64, accumulation FP32 only");
    }
    if (attributes.getIgnoreIndex() != -100) {
        throw Exception(FTRAIN_STATUS_UNSUPPORTED, "Linear CE Phase A supports ignore_index=-100 only");
    }
    if (attributes.getReduction() != FTRAIN_LINEAR_CE_REDUCTION_MEAN) {
        throw Exception(FTRAIN_STATUS_UNSUPPORTED, "Linear CE Phase A supports reduction='mean' only");
    }
}

void appendPortKey(std::vector<std::uint64_t>& key, FTrainNumericType numeric_type, FTrainIndexType index_type,
                   bool device_memory, std::size_t rank) {
    key.push_back(static_cast<std::uint64_t>(numeric_type));
    key.push_back(static_cast<std::uint64_t>(index_type));
    key.push_back(static_cast<std::uint64_t>(device_memory));
    key.push_back(static_cast<std::uint64_t>(rank));
}

void appendDataKey(std::vector<std::uint64_t>& key, FTrainNumericType hidden_type,
                   FTrainNumericType weight_type, FTrainNumericType label_type,
                   FTrainNumericType accumulation_type, std::int64_t ignore_index,
                   FTrainLinearCEReduction reduction) {
    key.push_back(static_cast<std::uint64_t>(hidden_type));
    key.push_back(static_cast<std::uint64_t>(weight_type));
    key.push_back(static_cast<std::uint64_t>(label_type));
    key.push_back(static_cast<std::uint64_t>(accumulation_type));
    key.push_back(static_cast<std::uint64_t>(ignore_index));
    key.push_back(static_cast<std::uint64_t>(reduction));
}

void requireForwardInputs(const Tensor& hidden, const Tensor& weight, const Tensor& labels,
                          const LinearCEDataAttributes& attributes) {
    requireDataAttributes(attributes);
    requireRank(hidden, 2, "hidden");
    requireRank(weight, 2, "weight");
    requireRank(labels, 1, "labels");
    requireType(hidden, attributes.getHiddenType(), "hidden");
    requireType(weight, attributes.getWeightType(), "weight");
    requireType(labels, attributes.getLabelType(), "labels");
    requireDevice(hidden, "hidden");
    requireDevice(weight, "weight");
    requireDevice(labels, "labels");
    if (view(hidden).getDims()[1] != view(weight).getDims()[1] ||
        view(hidden).getDims()[0] != view(labels).getDims()[0]) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT,
                        "Linear CE hidden/weight/labels dimensions are inconsistent");
    }
}

void requireVectorLike(const Tensor& tensor, std::int64_t size, FTrainNumericType type, const char* name) {
    requireRank(tensor, 1, name);
    requireType(tensor, type, name);
    requireDevice(tensor, name);
    if (view(tensor).getDims()[0] != size) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE %s length must be %lld", name,
                        static_cast<long long>(size));
    }
}

}  // namespace

LinearCEForwardPartialsProblem::LinearCEForwardPartialsProblem(
    Tensor hidden, Tensor weight, Tensor labels, Tensor lse_local, Tensor target_logit_local,
    LinearCEForwardPartialsAttributes attributes)
    : hidden_(std::move(hidden)), weight_(std::move(weight)), labels_(std::move(labels)),
      lse_local_(std::move(lse_local)), target_logit_local_(std::move(target_logit_local)), attributes_(attributes) {
    requireForwardInputs(hidden_, weight_, labels_, attributes_.getData());
    const std::int64_t num_tokens = view(hidden_).getDims()[0];
    requireVectorLike(lse_local_, num_tokens, attributes_.getData().getAccumulationType(), "lse_local");
    requireVectorLike(target_logit_local_, num_tokens, attributes_.getData().getAccumulationType(),
                      "target_logit_local");
}

std::vector<std::uint64_t> LinearCEForwardPartialsProblem::getProblemKey() const {
    std::vector<std::uint64_t> key;
    key.push_back(getN());
    key.push_back(getD());
    key.push_back(getV());
    appendPortKey(key, getHiddenNumericType(), getHiddenIndexType(), isHiddenDeviceMemory(), getHiddenRank());
    appendPortKey(key, getWeightNumericType(), getWeightIndexType(), isWeightDeviceMemory(), getWeightRank());
    appendPortKey(key, getLabelsNumericType(), getLabelsIndexType(), isLabelsDeviceMemory(), getLabelsRank());
    appendPortKey(key, getLseLocalNumericType(), getLseLocalIndexType(), isLseLocalDeviceMemory(),
                  getLseLocalRank());
    appendPortKey(key, getTargetLogitLocalNumericType(), getTargetLogitLocalIndexType(),
                  isTargetLogitLocalDeviceMemory(), getTargetLogitLocalRank());
    appendDataKey(key, getConfiguredHiddenType(), getConfiguredWeightType(), getConfiguredLabelType(),
                  getAccumulationType(), getIgnoreIndex(), getReduction());
    key.push_back(getShardVocabStart());
    return key;
}

LinearCEForwardFinalizeProblem::LinearCEForwardFinalizeProblem(
    Tensor lse, Tensor target_logit, Tensor labels, Tensor loss, Tensor maximum, Tensor saved_lse,
    Tensor num_valid_tokens, LinearCEForwardFinalizeAttributes attributes)
    : lse_(std::move(lse)), target_logit_(std::move(target_logit)), labels_(std::move(labels)),
      loss_(std::move(loss)), maximum_(std::move(maximum)), saved_lse_(std::move(saved_lse)),
      num_valid_tokens_(std::move(num_valid_tokens)), attributes_(attributes) {
    requireDataAttributes(attributes_.getData());
    requireRank(lse_, 1, "lse");
    requireRank(target_logit_, 1, "target_logit");
    requireRank(labels_, 1, "labels");
    requireType(lse_, attributes_.getData().getAccumulationType(), "lse");
    requireType(target_logit_, attributes_.getData().getAccumulationType(), "target_logit");
    requireType(labels_, attributes_.getData().getLabelType(), "labels");
    requireDevice(lse_, "lse");
    requireDevice(target_logit_, "target_logit");
    requireDevice(labels_, "labels");
    if (view(lse_).getDims() != view(target_logit_).getDims() ||
        view(lse_).getDims() != view(labels_).getDims()) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE finalize vectors must have equal length");
    }
    const std::int64_t num_tokens = view(labels_).getDims()[0];
    requireScalar(loss_, "loss");
    requireType(loss_, attributes_.getData().getAccumulationType(), "loss");
    requireDevice(loss_, "loss");
    requireVectorLike(maximum_, num_tokens, attributes_.getData().getAccumulationType(), "maximum");
    requireVectorLike(saved_lse_, num_tokens, attributes_.getData().getAccumulationType(), "saved_lse");
    requireScalar(num_valid_tokens_, "num_valid_tokens");
    requireType(num_valid_tokens_, attributes_.getData().getLabelType(), "num_valid_tokens");
    requireDevice(num_valid_tokens_, "num_valid_tokens");
}

std::vector<std::uint64_t> LinearCEForwardFinalizeProblem::getProblemKey() const {
    std::vector<std::uint64_t> key;
    key.push_back(getN());
    appendPortKey(key, getLseNumericType(), getLseIndexType(), isLseDeviceMemory(), getLseRank());
    appendPortKey(key, getTargetLogitNumericType(), getTargetLogitIndexType(), isTargetLogitDeviceMemory(),
                  getTargetLogitRank());
    appendPortKey(key, getLabelsNumericType(), getLabelsIndexType(), isLabelsDeviceMemory(), getLabelsRank());
    appendPortKey(key, getLossNumericType(), getLossIndexType(), isLossDeviceMemory(), getLossRank());
    appendPortKey(key, getMaximumNumericType(), getMaximumIndexType(), isMaximumDeviceMemory(), getMaximumRank());
    appendPortKey(key, getSavedLseNumericType(), getSavedLseIndexType(), isSavedLseDeviceMemory(),
                  getSavedLseRank());
    appendPortKey(key, getNumValidTokensNumericType(), getNumValidTokensIndexType(), isNumValidTokensDeviceMemory(),
                  getNumValidTokensRank());
    appendDataKey(key, getConfiguredHiddenType(), getConfiguredWeightType(), getConfiguredLabelType(),
                  getAccumulationType(), getIgnoreIndex(), getReduction());
    return key;
}

LinearCEBackwardProblem::LinearCEBackwardProblem(
    Tensor dloss, Tensor hidden, Tensor weight, Tensor labels, Tensor maximum, Tensor saved_lse,
    Tensor num_valid_tokens, Tensor main_grad, Tensor d_hidden, Tensor d_weight, LinearCEBackwardAttributes attributes)
    : dloss_(std::move(dloss)), hidden_(std::move(hidden)), weight_(std::move(weight)), labels_(std::move(labels)),
      maximum_(std::move(maximum)), saved_lse_(std::move(saved_lse)), num_valid_tokens_(std::move(num_valid_tokens)),
      main_grad_(std::move(main_grad)), d_hidden_(std::move(d_hidden)), d_weight_(std::move(d_weight)),
      attributes_(attributes) {
    requireDataAttributes(attributes_.getData());
    requireForwardInputs(hidden_, weight_, labels_, attributes_.getData());
    const std::int64_t num_tokens = view(hidden_).getDims()[0];
    requireScalar(dloss_, "dloss");
    requireType(dloss_, attributes_.getData().getAccumulationType(), "dloss");
    requireDevice(dloss_, "dloss");
    requireVectorLike(maximum_, num_tokens, attributes_.getData().getAccumulationType(), "maximum");
    requireVectorLike(saved_lse_, num_tokens, attributes_.getData().getAccumulationType(), "saved_lse");
    requireScalar(num_valid_tokens_, "num_valid_tokens");
    requireType(num_valid_tokens_, attributes_.getData().getLabelType(), "num_valid_tokens");
    requireDevice(num_valid_tokens_, "num_valid_tokens");
    requireRank(main_grad_, 2, "main_grad");
    requireType(main_grad_, attributes_.getMainGradType(), "main_grad");
    requireDevice(main_grad_, "main_grad");
    if (view(main_grad_).getDims() != view(weight_).getDims()) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE main_grad must match weight shape");
    }
    requireRank(d_hidden_, 2, "d_hidden");
    requireRank(d_weight_, 2, "d_weight");
    requireType(d_hidden_, attributes_.getData().getHiddenType(), "d_hidden");
    requireType(d_weight_, attributes_.getData().getWeightType(), "d_weight");
    requireDevice(d_hidden_, "d_hidden");
    requireDevice(d_weight_, "d_weight");
    if (view(d_hidden_).getDims() != view(hidden_).getDims() || view(d_weight_).getDims() != view(weight_).getDims()) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE gradient outputs must match their input shapes");
    }
    if (attributes_.getMainGradMode() == FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_INVALID ||
        attributes_.getMainGradMode() >= FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_COUNT) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "Linear CE main_grad mode is invalid");
    }
}

std::vector<std::uint64_t> LinearCEBackwardProblem::getProblemKey() const {
    std::vector<std::uint64_t> key;
    key.push_back(getN());
    key.push_back(getD());
    key.push_back(getV());
    appendPortKey(key, getDlossNumericType(), getDlossIndexType(), isDlossDeviceMemory(), getDlossRank());
    appendPortKey(key, getHiddenNumericType(), getHiddenIndexType(), isHiddenDeviceMemory(), getHiddenRank());
    appendPortKey(key, getWeightNumericType(), getWeightIndexType(), isWeightDeviceMemory(), getWeightRank());
    appendPortKey(key, getLabelsNumericType(), getLabelsIndexType(), isLabelsDeviceMemory(), getLabelsRank());
    appendPortKey(key, getMaximumNumericType(), getMaximumIndexType(), isMaximumDeviceMemory(), getMaximumRank());
    appendPortKey(key, getSavedLseNumericType(), getSavedLseIndexType(), isSavedLseDeviceMemory(),
                  getSavedLseRank());
    appendPortKey(key, getNumValidTokensNumericType(), getNumValidTokensIndexType(), isNumValidTokensDeviceMemory(),
                  getNumValidTokensRank());
    appendPortKey(key, getMainGradNumericType(), getMainGradIndexType(), isMainGradDeviceMemory(), getMainGradRank());
    appendPortKey(key, getDHiddenNumericType(), getDHiddenIndexType(), isDHiddenDeviceMemory(), getDHiddenRank());
    appendPortKey(key, getDWeightNumericType(), getDWeightIndexType(), isDWeightDeviceMemory(), getDWeightRank());
    appendDataKey(key, getConfiguredHiddenType(), getConfiguredWeightType(), getConfiguredLabelType(),
                  getAccumulationType(), getIgnoreIndex(), getReduction());
    key.push_back(getMainGradType());
    key.push_back(getMainGradMode());
    key.push_back(getShardVocabStart());
    return key;
}

}  // namespace ftrain
