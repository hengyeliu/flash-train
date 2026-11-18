// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_OPERATION_MROPE_HPP_
#define FTRAIN_OPERATION_MROPE_HPP_

#include <array>
#include <cstdint>
#include <vector>

#include "flash_train/operation/base.hpp"

namespace ftrain {

class MropeAttributes final {
  public:
    MropeAttributes(std::array<std::int64_t, 3> section, bool interleaved, bool fp32_compute) noexcept
        : section_(section), interleaved_(interleaved), fp32_compute_(fp32_compute) {}
    const std::array<std::int64_t, 3>& getSection() const noexcept { return section_; }
    bool isInterleaved() const noexcept { return interleaved_; }
    bool usesFp32Compute() const noexcept { return fp32_compute_; }

  private:
    std::array<std::int64_t, 3> section_;
    bool interleaved_;
    bool fp32_compute_;
};

template<>
class OperationTraits<OperationKind::kMropeForward> {
  public:
    using Id   = FTrainMropeForwardOpId;
    using Type = MropeAttributes;
    static constexpr PatternOperationId createPatternOperationId(Id id) noexcept {
        return PatternOperationId{id.opaque};
    }
    static PatternOperationNode createPatternOperationNode(FTrainTensorId input, FTrainTensorId raw_freqs,
                                                           FTrainTensorId output) {
        return PatternOperationNode{
            OperationKind::kMropeForward,
            {OperandTraits<OperandKind::kTensor>::createPatternOperandId(input),
                             OperandTraits<OperandKind::kTensor>::createPatternOperandId(raw_freqs)},
            {OperandTraits<OperandKind::kTensor>::createPatternOperandId(output)}
        };
    }
};

template<>
class OperationTraits<OperationKind::kMropeBackward> {
  public:
    using Id   = FTrainMropeBackwardOpId;
    using Type = MropeAttributes;
    static constexpr PatternOperationId createPatternOperationId(Id id) noexcept {
        return PatternOperationId{id.opaque};
    }
    static PatternOperationNode createPatternOperationNode(FTrainTensorId grad_output, FTrainTensorId raw_freqs,
                                                           FTrainTensorId grad_input) {
        return PatternOperationNode{
            OperationKind::kMropeBackward,
            {OperandTraits<OperandKind::kTensor>::createPatternOperandId(grad_output),
                              OperandTraits<OperandKind::kTensor>::createPatternOperandId(raw_freqs)},
            {OperandTraits<OperandKind::kTensor>::createPatternOperandId(grad_input)}
        };
    }
};

}  // namespace ftrain

#endif
