// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_OPERATION_LINEAR_CE_HPP_
#define FTRAIN_OPERATION_LINEAR_CE_HPP_

#include <cstdint>
#include <vector>

#include "flash_train/common.h"
#include "flash_train/operation/base.hpp"

namespace ftrain {

class LinearCEDataAttributes final {
  public:
    constexpr LinearCEDataAttributes(FTrainNumericType hidden_type, FTrainNumericType weight_type,
                                     FTrainNumericType label_type, FTrainNumericType accumulation_type,
                                     std::int64_t ignore_index, FTrainLinearCEReduction reduction) noexcept
        : hidden_type_(hidden_type), weight_type_(weight_type), label_type_(label_type),
          accumulation_type_(accumulation_type), ignore_index_(ignore_index), reduction_(reduction) {}

    constexpr FTrainNumericType getHiddenType() const noexcept { return hidden_type_; }
    constexpr FTrainNumericType getWeightType() const noexcept { return weight_type_; }
    constexpr FTrainNumericType getLabelType() const noexcept { return label_type_; }
    constexpr FTrainNumericType getAccumulationType() const noexcept { return accumulation_type_; }
    constexpr std::int64_t getIgnoreIndex() const noexcept { return ignore_index_; }
    constexpr FTrainLinearCEReduction getReduction() const noexcept { return reduction_; }

  private:
    FTrainNumericType hidden_type_;
    FTrainNumericType weight_type_;
    FTrainNumericType label_type_;
    FTrainNumericType accumulation_type_;
    std::int64_t ignore_index_;
    FTrainLinearCEReduction reduction_;
};

class LinearCEForwardPartialsAttributes final {
  public:
    constexpr LinearCEForwardPartialsAttributes(LinearCEDataAttributes data, std::uint64_t shard_vocab_start) noexcept
        : data_(data), shard_vocab_start_(shard_vocab_start) {}

    constexpr const LinearCEDataAttributes& getData() const noexcept { return data_; }
    constexpr std::uint64_t getShardVocabStart() const noexcept { return shard_vocab_start_; }

  private:
    LinearCEDataAttributes data_;
    std::uint64_t shard_vocab_start_;
};

class LinearCEForwardFinalizeAttributes final {
  public:
    constexpr explicit LinearCEForwardFinalizeAttributes(LinearCEDataAttributes data) noexcept : data_(data) {}

    constexpr const LinearCEDataAttributes& getData() const noexcept { return data_; }

  private:
    LinearCEDataAttributes data_;
};

class LinearCEBackwardAttributes final {
  public:
    constexpr LinearCEBackwardAttributes(LinearCEDataAttributes data, FTrainNumericType main_grad_type,
                                         FTrainLinearCEMainGradMode main_grad_mode,
                                         std::uint64_t shard_vocab_start) noexcept
        : data_(data), main_grad_type_(main_grad_type), main_grad_mode_(main_grad_mode),
          shard_vocab_start_(shard_vocab_start) {}

    constexpr const LinearCEDataAttributes& getData() const noexcept { return data_; }
    constexpr FTrainNumericType getMainGradType() const noexcept { return main_grad_type_; }
    constexpr FTrainLinearCEMainGradMode getMainGradMode() const noexcept { return main_grad_mode_; }
    constexpr std::uint64_t getShardVocabStart() const noexcept { return shard_vocab_start_; }

  private:
    LinearCEDataAttributes data_;
    FTrainNumericType main_grad_type_;
    FTrainLinearCEMainGradMode main_grad_mode_;
    std::uint64_t shard_vocab_start_;
};

template<>
class OperationTraits<OperationKind::kLinearCEForwardPartials> {
  public:
    using Id   = FTrainLinearCEForwardPartialsOpId;
    using Type = LinearCEForwardPartialsAttributes;

    static constexpr PatternOperationId createPatternOperationId(Id id) noexcept {
        return PatternOperationId{id.opaque};
    }

    static PatternOperationNode createPatternOperationNode(FTrainTensorId hidden, FTrainTensorId weight,
                                                           FTrainTensorId labels, FTrainTensorId lse_local,
                                                           FTrainTensorId target_logit_local) {
        return PatternOperationNode{
            OperationKind::kLinearCEForwardPartials,
            {PatternOperandId{hidden.opaque}, PatternOperandId{weight.opaque}, PatternOperandId{labels.opaque}},
            {PatternOperandId{lse_local.opaque}, PatternOperandId{target_logit_local.opaque}}};
    }
};

template<>
class OperationTraits<OperationKind::kLinearCEForwardFinalize> {
  public:
    using Id   = FTrainLinearCEForwardFinalizeOpId;
    using Type = LinearCEForwardFinalizeAttributes;

    static constexpr PatternOperationId createPatternOperationId(Id id) noexcept {
        return PatternOperationId{id.opaque};
    }

    static PatternOperationNode createPatternOperationNode(FTrainTensorId lse, FTrainTensorId target_logit,
                                                           FTrainTensorId labels, FTrainTensorId loss,
                                                           FTrainTensorId maximum, FTrainTensorId saved_lse,
                                                           FTrainTensorId num_valid_tokens) {
        return PatternOperationNode{
            OperationKind::kLinearCEForwardFinalize,
            {PatternOperandId{lse.opaque}, PatternOperandId{target_logit.opaque}, PatternOperandId{labels.opaque}},
            {PatternOperandId{loss.opaque}, PatternOperandId{maximum.opaque}, PatternOperandId{saved_lse.opaque},
             PatternOperandId{num_valid_tokens.opaque}}};
    }
};

template<>
class OperationTraits<OperationKind::kLinearCEBackward> {
  public:
    using Id   = FTrainLinearCEBackwardOpId;
    using Type = LinearCEBackwardAttributes;

    static constexpr PatternOperationId createPatternOperationId(Id id) noexcept {
        return PatternOperationId{id.opaque};
    }

    static PatternOperationNode createPatternOperationNode(
        FTrainTensorId dloss, FTrainTensorId hidden, FTrainTensorId weight, FTrainTensorId labels,
        FTrainTensorId maximum, FTrainTensorId saved_lse, FTrainTensorId num_valid_tokens, FTrainTensorId main_grad,
        FTrainTensorId d_hidden, FTrainTensorId d_weight) {
        return PatternOperationNode{
            OperationKind::kLinearCEBackward,
            {PatternOperandId{dloss.opaque}, PatternOperandId{hidden.opaque}, PatternOperandId{weight.opaque},
             PatternOperandId{labels.opaque}, PatternOperandId{maximum.opaque}, PatternOperandId{saved_lse.opaque},
             PatternOperandId{num_valid_tokens.opaque}, PatternOperandId{main_grad.opaque}},
            {PatternOperandId{d_hidden.opaque}, PatternOperandId{d_weight.opaque}}};
    }
};

}  // namespace ftrain

#endif
