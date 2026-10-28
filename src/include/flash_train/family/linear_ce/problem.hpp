// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_FAMILY_LINEAR_CE_PROBLEM_HPP_
#define FTRAIN_FAMILY_LINEAR_CE_PROBLEM_HPP_

#include <cstddef>
#include <cstdint>
#include <vector>

#include "flash_train/operation/linear_ce.hpp"
#include "flash_train/tensor.hpp"

namespace ftrain {

class LinearCEForwardPartialsProblem final {
  public:
    LinearCEForwardPartialsProblem(Tensor hidden, Tensor weight, Tensor labels, Tensor lse_local,
                                   Tensor target_logit_local, LinearCEForwardPartialsAttributes attributes);

    // Raw accessors are retained for the transition period. Primitive
    // applicability checks should use the flattened checklist below.
    const Tensor& getHidden() const noexcept { return hidden_; }
    const Tensor& getWeight() const noexcept { return weight_; }
    const Tensor& getLabels() const noexcept { return labels_; }
    const Tensor& getLseLocal() const noexcept { return lse_local_; }
    const Tensor& getTargetLogitLocal() const noexcept { return target_logit_local_; }
    const LinearCEForwardPartialsAttributes& getAttributes() const noexcept { return attributes_; }

    std::uint64_t getN() const noexcept { return static_cast<std::uint64_t>(hidden_.getStorageView().getDims()[0]); }
    std::uint64_t getD() const noexcept { return static_cast<std::uint64_t>(hidden_.getStorageView().getDims()[1]); }
    std::uint64_t getV() const noexcept { return static_cast<std::uint64_t>(weight_.getStorageView().getDims()[0]); }
    std::uint64_t getWeightD() const noexcept {
        return static_cast<std::uint64_t>(weight_.getStorageView().getDims()[1]);
    }
    std::uint64_t getLabelsLength() const noexcept {
        return static_cast<std::uint64_t>(labels_.getStorageView().getDims()[0]);
    }
    std::uint64_t getLseLocalLength() const noexcept {
        return static_cast<std::uint64_t>(lse_local_.getStorageView().getDims()[0]);
    }
    std::uint64_t getTargetLogitLocalLength() const noexcept {
        return static_cast<std::uint64_t>(target_logit_local_.getStorageView().getDims()[0]);
    }

    FTrainNumericType getHiddenNumericType() const noexcept { return hidden_.getStorageView().getNumericType(); }
    FTrainNumericType getWeightNumericType() const noexcept { return weight_.getStorageView().getNumericType(); }
    FTrainNumericType getLabelsNumericType() const noexcept { return labels_.getStorageView().getNumericType(); }
    FTrainNumericType getLseLocalNumericType() const noexcept { return lse_local_.getStorageView().getNumericType(); }
    FTrainNumericType getTargetLogitLocalNumericType() const noexcept {
        return target_logit_local_.getStorageView().getNumericType();
    }

    std::size_t getHiddenRank() const noexcept { return hidden_.getStorageView().getDims().size(); }
    std::size_t getWeightRank() const noexcept { return weight_.getStorageView().getDims().size(); }
    std::size_t getLabelsRank() const noexcept { return labels_.getStorageView().getDims().size(); }
    std::size_t getLseLocalRank() const noexcept { return lse_local_.getStorageView().getDims().size(); }
    std::size_t getTargetLogitLocalRank() const noexcept {
        return target_logit_local_.getStorageView().getDims().size();
    }

    FTrainIndexType getHiddenIndexType() const noexcept { return hidden_.getStorageView().getIndexType(); }
    FTrainIndexType getWeightIndexType() const noexcept { return weight_.getStorageView().getIndexType(); }
    FTrainIndexType getLabelsIndexType() const noexcept { return labels_.getStorageView().getIndexType(); }
    FTrainIndexType getLseLocalIndexType() const noexcept { return lse_local_.getStorageView().getIndexType(); }
    FTrainIndexType getTargetLogitLocalIndexType() const noexcept {
        return target_logit_local_.getStorageView().getIndexType();
    }

    bool isHiddenDeviceMemory() const noexcept { return !hidden_.getStorageView().isHostMemory(); }
    bool isWeightDeviceMemory() const noexcept { return !weight_.getStorageView().isHostMemory(); }
    bool isLabelsDeviceMemory() const noexcept { return !labels_.getStorageView().isHostMemory(); }
    bool isLseLocalDeviceMemory() const noexcept { return !lse_local_.getStorageView().isHostMemory(); }
    bool isTargetLogitLocalDeviceMemory() const noexcept {
        return !target_logit_local_.getStorageView().isHostMemory();
    }

    void* getHiddenAddress() const noexcept { return hidden_.getStorageView().getMemory(); }
    void* getWeightAddress() const noexcept { return weight_.getStorageView().getMemory(); }
    void* getLabelsAddress() const noexcept { return labels_.getStorageView().getMemory(); }
    void* getLseLocalAddress() const noexcept { return lse_local_.getStorageView().getMemory(); }
    void* getTargetLogitLocalAddress() const noexcept { return target_logit_local_.getStorageView().getMemory(); }

    FTrainNumericType getConfiguredHiddenType() const noexcept {
        return attributes_.getData().getHiddenType();
    }
    FTrainNumericType getConfiguredWeightType() const noexcept {
        return attributes_.getData().getWeightType();
    }
    FTrainNumericType getConfiguredLabelType() const noexcept {
        return attributes_.getData().getLabelType();
    }
    FTrainNumericType getAccumulationType() const noexcept { return attributes_.getData().getAccumulationType(); }
    std::int64_t getIgnoreIndex() const noexcept { return attributes_.getData().getIgnoreIndex(); }
    FTrainLinearCEReduction getReduction() const noexcept { return attributes_.getData().getReduction(); }
    std::uint64_t getShardVocabStart() const noexcept { return attributes_.getShardVocabStart(); }

    std::vector<std::uint64_t> getProblemKey() const;

  private:
    Tensor hidden_;
    Tensor weight_;
    Tensor labels_;
    Tensor lse_local_;
    Tensor target_logit_local_;
    LinearCEForwardPartialsAttributes attributes_;
};

class LinearCEForwardFinalizeProblem final {
  public:
    LinearCEForwardFinalizeProblem(Tensor lse, Tensor target_logit, Tensor labels, Tensor loss, Tensor maximum,
                                   Tensor saved_lse, Tensor num_valid_tokens,
                                   LinearCEForwardFinalizeAttributes attributes);

    const Tensor& getLse() const noexcept { return lse_; }
    const Tensor& getTargetLogit() const noexcept { return target_logit_; }
    const Tensor& getLabels() const noexcept { return labels_; }
    const Tensor& getLoss() const noexcept { return loss_; }
    const Tensor& getMaximum() const noexcept { return maximum_; }
    const Tensor& getSavedLse() const noexcept { return saved_lse_; }
    const Tensor& getNumValidTokens() const noexcept { return num_valid_tokens_; }
    const LinearCEForwardFinalizeAttributes& getAttributes() const noexcept { return attributes_; }

    std::uint64_t getN() const noexcept { return static_cast<std::uint64_t>(labels_.getStorageView().getDims()[0]); }
    std::uint64_t getLseLength() const noexcept {
        return static_cast<std::uint64_t>(lse_.getStorageView().getDims()[0]);
    }
    std::uint64_t getTargetLogitLength() const noexcept {
        return static_cast<std::uint64_t>(target_logit_.getStorageView().getDims()[0]);
    }
    std::uint64_t getLabelsLength() const noexcept {
        return static_cast<std::uint64_t>(labels_.getStorageView().getDims()[0]);
    }
    std::uint64_t getMaximumLength() const noexcept {
        return static_cast<std::uint64_t>(maximum_.getStorageView().getDims()[0]);
    }
    std::uint64_t getSavedLseLength() const noexcept {
        return static_cast<std::uint64_t>(saved_lse_.getStorageView().getDims()[0]);
    }

    FTrainNumericType getLseNumericType() const noexcept { return lse_.getStorageView().getNumericType(); }
    FTrainNumericType getTargetLogitNumericType() const noexcept {
        return target_logit_.getStorageView().getNumericType();
    }
    FTrainNumericType getLabelsNumericType() const noexcept { return labels_.getStorageView().getNumericType(); }
    FTrainNumericType getLossNumericType() const noexcept { return loss_.getStorageView().getNumericType(); }
    FTrainNumericType getMaximumNumericType() const noexcept { return maximum_.getStorageView().getNumericType(); }
    FTrainNumericType getSavedLseNumericType() const noexcept { return saved_lse_.getStorageView().getNumericType(); }
    FTrainNumericType getNumValidTokensNumericType() const noexcept {
        return num_valid_tokens_.getStorageView().getNumericType();
    }

    std::size_t getLseRank() const noexcept { return lse_.getStorageView().getDims().size(); }
    std::size_t getTargetLogitRank() const noexcept { return target_logit_.getStorageView().getDims().size(); }
    std::size_t getLabelsRank() const noexcept { return labels_.getStorageView().getDims().size(); }
    std::size_t getLossRank() const noexcept { return loss_.getStorageView().getDims().size(); }
    std::size_t getMaximumRank() const noexcept { return maximum_.getStorageView().getDims().size(); }
    std::size_t getSavedLseRank() const noexcept { return saved_lse_.getStorageView().getDims().size(); }
    std::size_t getNumValidTokensRank() const noexcept {
        return num_valid_tokens_.getStorageView().getDims().size();
    }

    FTrainIndexType getLseIndexType() const noexcept { return lse_.getStorageView().getIndexType(); }
    FTrainIndexType getTargetLogitIndexType() const noexcept { return target_logit_.getStorageView().getIndexType(); }
    FTrainIndexType getLabelsIndexType() const noexcept { return labels_.getStorageView().getIndexType(); }
    FTrainIndexType getLossIndexType() const noexcept { return loss_.getStorageView().getIndexType(); }
    FTrainIndexType getMaximumIndexType() const noexcept { return maximum_.getStorageView().getIndexType(); }
    FTrainIndexType getSavedLseIndexType() const noexcept { return saved_lse_.getStorageView().getIndexType(); }
    FTrainIndexType getNumValidTokensIndexType() const noexcept {
        return num_valid_tokens_.getStorageView().getIndexType();
    }

    bool isLseDeviceMemory() const noexcept { return !lse_.getStorageView().isHostMemory(); }
    bool isTargetLogitDeviceMemory() const noexcept { return !target_logit_.getStorageView().isHostMemory(); }
    bool isLabelsDeviceMemory() const noexcept { return !labels_.getStorageView().isHostMemory(); }
    bool isLossDeviceMemory() const noexcept { return !loss_.getStorageView().isHostMemory(); }
    bool isMaximumDeviceMemory() const noexcept { return !maximum_.getStorageView().isHostMemory(); }
    bool isSavedLseDeviceMemory() const noexcept { return !saved_lse_.getStorageView().isHostMemory(); }
    bool isNumValidTokensDeviceMemory() const noexcept { return !num_valid_tokens_.getStorageView().isHostMemory(); }

    void* getLseAddress() const noexcept { return lse_.getStorageView().getMemory(); }
    void* getTargetLogitAddress() const noexcept { return target_logit_.getStorageView().getMemory(); }
    void* getLabelsAddress() const noexcept { return labels_.getStorageView().getMemory(); }
    void* getLossAddress() const noexcept { return loss_.getStorageView().getMemory(); }
    void* getMaximumAddress() const noexcept { return maximum_.getStorageView().getMemory(); }
    void* getSavedLseAddress() const noexcept { return saved_lse_.getStorageView().getMemory(); }
    void* getNumValidTokensAddress() const noexcept { return num_valid_tokens_.getStorageView().getMemory(); }

    FTrainNumericType getConfiguredHiddenType() const noexcept {
        return attributes_.getData().getHiddenType();
    }
    FTrainNumericType getConfiguredWeightType() const noexcept {
        return attributes_.getData().getWeightType();
    }
    FTrainNumericType getConfiguredLabelType() const noexcept {
        return attributes_.getData().getLabelType();
    }
    FTrainNumericType getAccumulationType() const noexcept { return attributes_.getData().getAccumulationType(); }
    std::int64_t getIgnoreIndex() const noexcept { return attributes_.getData().getIgnoreIndex(); }
    FTrainLinearCEReduction getReduction() const noexcept { return attributes_.getData().getReduction(); }

    std::vector<std::uint64_t> getProblemKey() const;

  private:
    Tensor lse_;
    Tensor target_logit_;
    Tensor labels_;
    Tensor loss_;
    Tensor maximum_;
    Tensor saved_lse_;
    Tensor num_valid_tokens_;
    LinearCEForwardFinalizeAttributes attributes_;
};

class LinearCEBackwardProblem final {
  public:
    LinearCEBackwardProblem(Tensor dloss, Tensor hidden, Tensor weight, Tensor labels, Tensor maximum, Tensor saved_lse,
                            Tensor num_valid_tokens, Tensor main_grad, Tensor d_hidden, Tensor d_weight,
                            LinearCEBackwardAttributes attributes);

    const Tensor& getDloss() const noexcept { return dloss_; }
    const Tensor& getHidden() const noexcept { return hidden_; }
    const Tensor& getWeight() const noexcept { return weight_; }
    const Tensor& getLabels() const noexcept { return labels_; }
    const Tensor& getMaximum() const noexcept { return maximum_; }
    const Tensor& getSavedLse() const noexcept { return saved_lse_; }
    const Tensor& getNumValidTokens() const noexcept { return num_valid_tokens_; }
    const Tensor& getMainGrad() const noexcept { return main_grad_; }
    const Tensor& getDHidden() const noexcept { return d_hidden_; }
    const Tensor& getDWeight() const noexcept { return d_weight_; }
    const LinearCEBackwardAttributes& getAttributes() const noexcept { return attributes_; }

    std::uint64_t getN() const noexcept { return static_cast<std::uint64_t>(hidden_.getStorageView().getDims()[0]); }
    std::uint64_t getD() const noexcept { return static_cast<std::uint64_t>(hidden_.getStorageView().getDims()[1]); }
    std::uint64_t getV() const noexcept { return static_cast<std::uint64_t>(weight_.getStorageView().getDims()[0]); }
    std::uint64_t getWeightD() const noexcept {
        return static_cast<std::uint64_t>(weight_.getStorageView().getDims()[1]);
    }
    std::uint64_t getLabelsLength() const noexcept {
        return static_cast<std::uint64_t>(labels_.getStorageView().getDims()[0]);
    }
    std::uint64_t getMaximumLength() const noexcept {
        return static_cast<std::uint64_t>(maximum_.getStorageView().getDims()[0]);
    }
    std::uint64_t getSavedLseLength() const noexcept {
        return static_cast<std::uint64_t>(saved_lse_.getStorageView().getDims()[0]);
    }
    std::uint64_t getMainGradRows() const noexcept {
        return static_cast<std::uint64_t>(main_grad_.getStorageView().getDims()[0]);
    }
    std::uint64_t getMainGradCols() const noexcept {
        return static_cast<std::uint64_t>(main_grad_.getStorageView().getDims()[1]);
    }
    std::uint64_t getDHiddenRows() const noexcept {
        return static_cast<std::uint64_t>(d_hidden_.getStorageView().getDims()[0]);
    }
    std::uint64_t getDHiddenCols() const noexcept {
        return static_cast<std::uint64_t>(d_hidden_.getStorageView().getDims()[1]);
    }
    std::uint64_t getDWeightRows() const noexcept {
        return static_cast<std::uint64_t>(d_weight_.getStorageView().getDims()[0]);
    }
    std::uint64_t getDWeightCols() const noexcept {
        return static_cast<std::uint64_t>(d_weight_.getStorageView().getDims()[1]);
    }

    FTrainNumericType getDlossNumericType() const noexcept { return dloss_.getStorageView().getNumericType(); }
    FTrainNumericType getHiddenNumericType() const noexcept { return hidden_.getStorageView().getNumericType(); }
    FTrainNumericType getWeightNumericType() const noexcept { return weight_.getStorageView().getNumericType(); }
    FTrainNumericType getLabelsNumericType() const noexcept { return labels_.getStorageView().getNumericType(); }
    FTrainNumericType getMaximumNumericType() const noexcept { return maximum_.getStorageView().getNumericType(); }
    FTrainNumericType getSavedLseNumericType() const noexcept { return saved_lse_.getStorageView().getNumericType(); }
    FTrainNumericType getNumValidTokensNumericType() const noexcept {
        return num_valid_tokens_.getStorageView().getNumericType();
    }
    FTrainNumericType getMainGradNumericType() const noexcept { return main_grad_.getStorageView().getNumericType(); }
    FTrainNumericType getDHiddenNumericType() const noexcept { return d_hidden_.getStorageView().getNumericType(); }
    FTrainNumericType getDWeightNumericType() const noexcept { return d_weight_.getStorageView().getNumericType(); }

    std::size_t getDlossRank() const noexcept { return dloss_.getStorageView().getDims().size(); }
    std::size_t getHiddenRank() const noexcept { return hidden_.getStorageView().getDims().size(); }
    std::size_t getWeightRank() const noexcept { return weight_.getStorageView().getDims().size(); }
    std::size_t getLabelsRank() const noexcept { return labels_.getStorageView().getDims().size(); }
    std::size_t getMaximumRank() const noexcept { return maximum_.getStorageView().getDims().size(); }
    std::size_t getSavedLseRank() const noexcept { return saved_lse_.getStorageView().getDims().size(); }
    std::size_t getNumValidTokensRank() const noexcept { return num_valid_tokens_.getStorageView().getDims().size(); }
    std::size_t getMainGradRank() const noexcept { return main_grad_.getStorageView().getDims().size(); }
    std::size_t getDHiddenRank() const noexcept { return d_hidden_.getStorageView().getDims().size(); }
    std::size_t getDWeightRank() const noexcept { return d_weight_.getStorageView().getDims().size(); }

    FTrainIndexType getDlossIndexType() const noexcept { return dloss_.getStorageView().getIndexType(); }
    FTrainIndexType getHiddenIndexType() const noexcept { return hidden_.getStorageView().getIndexType(); }
    FTrainIndexType getWeightIndexType() const noexcept { return weight_.getStorageView().getIndexType(); }
    FTrainIndexType getLabelsIndexType() const noexcept { return labels_.getStorageView().getIndexType(); }
    FTrainIndexType getMaximumIndexType() const noexcept { return maximum_.getStorageView().getIndexType(); }
    FTrainIndexType getSavedLseIndexType() const noexcept { return saved_lse_.getStorageView().getIndexType(); }
    FTrainIndexType getNumValidTokensIndexType() const noexcept {
        return num_valid_tokens_.getStorageView().getIndexType();
    }
    FTrainIndexType getMainGradIndexType() const noexcept { return main_grad_.getStorageView().getIndexType(); }
    FTrainIndexType getDHiddenIndexType() const noexcept { return d_hidden_.getStorageView().getIndexType(); }
    FTrainIndexType getDWeightIndexType() const noexcept { return d_weight_.getStorageView().getIndexType(); }

    bool isDlossDeviceMemory() const noexcept { return !dloss_.getStorageView().isHostMemory(); }
    bool isHiddenDeviceMemory() const noexcept { return !hidden_.getStorageView().isHostMemory(); }
    bool isWeightDeviceMemory() const noexcept { return !weight_.getStorageView().isHostMemory(); }
    bool isLabelsDeviceMemory() const noexcept { return !labels_.getStorageView().isHostMemory(); }
    bool isMaximumDeviceMemory() const noexcept { return !maximum_.getStorageView().isHostMemory(); }
    bool isSavedLseDeviceMemory() const noexcept { return !saved_lse_.getStorageView().isHostMemory(); }
    bool isNumValidTokensDeviceMemory() const noexcept { return !num_valid_tokens_.getStorageView().isHostMemory(); }
    bool isMainGradDeviceMemory() const noexcept { return !main_grad_.getStorageView().isHostMemory(); }
    bool isDHiddenDeviceMemory() const noexcept { return !d_hidden_.getStorageView().isHostMemory(); }
    bool isDWeightDeviceMemory() const noexcept { return !d_weight_.getStorageView().isHostMemory(); }

    void* getDlossAddress() const noexcept { return dloss_.getStorageView().getMemory(); }
    void* getHiddenAddress() const noexcept { return hidden_.getStorageView().getMemory(); }
    void* getWeightAddress() const noexcept { return weight_.getStorageView().getMemory(); }
    void* getLabelsAddress() const noexcept { return labels_.getStorageView().getMemory(); }
    void* getMaximumAddress() const noexcept { return maximum_.getStorageView().getMemory(); }
    void* getSavedLseAddress() const noexcept { return saved_lse_.getStorageView().getMemory(); }
    void* getNumValidTokensAddress() const noexcept { return num_valid_tokens_.getStorageView().getMemory(); }
    void* getMainGradAddress() const noexcept { return main_grad_.getStorageView().getMemory(); }
    void* getDHiddenAddress() const noexcept { return d_hidden_.getStorageView().getMemory(); }
    void* getDWeightAddress() const noexcept { return d_weight_.getStorageView().getMemory(); }

    FTrainNumericType getConfiguredHiddenType() const noexcept {
        return attributes_.getData().getHiddenType();
    }
    FTrainNumericType getConfiguredWeightType() const noexcept {
        return attributes_.getData().getWeightType();
    }
    FTrainNumericType getConfiguredLabelType() const noexcept {
        return attributes_.getData().getLabelType();
    }
    FTrainNumericType getAccumulationType() const noexcept { return attributes_.getData().getAccumulationType(); }
    std::int64_t getIgnoreIndex() const noexcept { return attributes_.getData().getIgnoreIndex(); }
    FTrainLinearCEReduction getReduction() const noexcept { return attributes_.getData().getReduction(); }
    FTrainNumericType getMainGradType() const noexcept { return attributes_.getMainGradType(); }
    FTrainLinearCEMainGradMode getMainGradMode() const noexcept { return attributes_.getMainGradMode(); }
    std::uint64_t getShardVocabStart() const noexcept { return attributes_.getShardVocabStart(); }

    std::vector<std::uint64_t> getProblemKey() const;

  private:
    Tensor dloss_;
    Tensor hidden_;
    Tensor weight_;
    Tensor labels_;
    Tensor maximum_;
    Tensor saved_lse_;
    Tensor num_valid_tokens_;
    Tensor main_grad_;
    Tensor d_hidden_;
    Tensor d_weight_;
    LinearCEBackwardAttributes attributes_;
};

}  // namespace ftrain

#endif
