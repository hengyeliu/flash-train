// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_FAMILY_MROPE_PROBLEM_HPP_
#define FTRAIN_FAMILY_MROPE_PROBLEM_HPP_

#include <array>
#include <cstdint>
#include <vector>

#include "flash_train/operation/mrope.hpp"
#include "flash_train/tensor.hpp"

namespace ftrain {

// Shared metadata validation, not a public positional-port interface. The two
// concrete Problems below expose the distinct forward/backward port meanings.
class MropeProblemBase {
  public:
    int getSequenceLength() const noexcept { return static_cast<int>(source_.getStorageView().getDims()[0]); }
    int getBatchSize() const noexcept { return static_cast<int>(source_.getStorageView().getDims()[1]); }
    int getNumHeads() const noexcept { return static_cast<int>(source_.getStorageView().getDims()[2]); }
    int getHeadDim() const noexcept { return static_cast<int>(source_.getStorageView().getDims()[3]); }
    int getRotaryDim() const noexcept { return static_cast<int>(raw_freqs_.getStorageView().getDims()[3] * 2); }
    const std::array<std::int64_t, 3>& getSection() const noexcept { return attributes_.getSection(); }
    bool isInterleaved() const noexcept { return attributes_.isInterleaved(); }
    bool usesFp32Compute() const noexcept { return attributes_.usesFp32Compute(); }
    bool isInverse() const noexcept { return inverse_; }
    bool usesPackedTail() const noexcept;
    std::uint32_t getLaunchTokens() const noexcept;
    std::uint32_t getLaunchHeadTiles() const noexcept;
    std::uint32_t getLaunchThreads() const noexcept;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept { return 0; }
    bool hasOutputOverlap() const noexcept;
    void* getRawFreqsAddress() const noexcept { return raw_freqs_.getStorageView().getMemory(); }
    FTrainNumericType getRawFreqsNumericType() const noexcept { return raw_freqs_.getStorageView().getNumericType(); }
    FTrainIndexType getRawFreqsIndexType() const noexcept { return raw_freqs_.getStorageView().getIndexType(); }
    const std::vector<std::int64_t>& getRawFreqsDims() const noexcept { return raw_freqs_.getStorageView().getDims(); }
    const std::vector<std::int64_t>& getRawFreqsStrides() const noexcept {
        return raw_freqs_.getStorageView().getStrides();
    }
    bool isRawFreqsHostMemory() const noexcept { return raw_freqs_.getStorageView().isHostMemory(); }
    std::uintptr_t getRawFreqsAlignmentOffset() const noexcept {
        return reinterpret_cast<std::uintptr_t>(getRawFreqsAddress()) % 16;
    }

    // Equal keys must give equal applicability. Include null, alignment,
    // overlap, all layouts/types/dimensions and execution modes, not addresses.
    // The Engine adds Constraints' device identity; cache hits rebind pointers.
    std::vector<std::uint64_t> getProblemKey() const;

  protected:
    MropeProblemBase(Tensor source, Tensor raw_freqs, Tensor destination, MropeAttributes attributes, bool inverse);
    Tensor source_;
    Tensor raw_freqs_;
    Tensor destination_;

  private:
    MropeAttributes attributes_;
    bool inverse_;
    std::uint64_t source_bytes_      = 0;
    std::uint64_t destination_bytes_ = 0;
    std::uint64_t frequency_bytes_   = 0;
};

class MropeForwardProblem final : public MropeProblemBase {
  public:
    MropeForwardProblem(Tensor input, Tensor raw_freqs, Tensor output, MropeAttributes attributes)
        : MropeProblemBase(std::move(input), std::move(raw_freqs), std::move(output), attributes, false) {}
    void* getInputAddress() const noexcept { return source_.getStorageView().getMemory(); }
    FTrainNumericType getInputNumericType() const noexcept { return source_.getStorageView().getNumericType(); }
    FTrainIndexType getInputIndexType() const noexcept { return source_.getStorageView().getIndexType(); }
    const std::vector<std::int64_t>& getInputDims() const noexcept { return source_.getStorageView().getDims(); }
    const std::vector<std::int64_t>& getInputStrides() const noexcept { return source_.getStorageView().getStrides(); }
    bool isInputHostMemory() const noexcept { return source_.getStorageView().isHostMemory(); }
    std::uintptr_t getInputAlignmentOffset() const noexcept {
        return reinterpret_cast<std::uintptr_t>(getInputAddress()) % 16;
    }
    void* getOutputAddress() const noexcept { return destination_.getStorageView().getMemory(); }
    FTrainNumericType getOutputNumericType() const noexcept { return destination_.getStorageView().getNumericType(); }
    FTrainIndexType getOutputIndexType() const noexcept { return destination_.getStorageView().getIndexType(); }
    const std::vector<std::int64_t>& getOutputDims() const noexcept { return destination_.getStorageView().getDims(); }
    const std::vector<std::int64_t>& getOutputStrides() const noexcept {
        return destination_.getStorageView().getStrides();
    }
    bool isOutputHostMemory() const noexcept { return destination_.getStorageView().isHostMemory(); }
    std::uintptr_t getOutputAlignmentOffset() const noexcept {
        return reinterpret_cast<std::uintptr_t>(getOutputAddress()) % 16;
    }
};

class MropeBackwardProblem final : public MropeProblemBase {
  public:
    MropeBackwardProblem(Tensor grad_output, Tensor raw_freqs, Tensor grad_input, MropeAttributes attributes)
        : MropeProblemBase(std::move(grad_output), std::move(raw_freqs), std::move(grad_input), attributes, true) {}
    void* getGradOutputAddress() const noexcept { return source_.getStorageView().getMemory(); }
    FTrainNumericType getGradOutputNumericType() const noexcept { return source_.getStorageView().getNumericType(); }
    FTrainIndexType getGradOutputIndexType() const noexcept { return source_.getStorageView().getIndexType(); }
    const std::vector<std::int64_t>& getGradOutputDims() const noexcept { return source_.getStorageView().getDims(); }
    const std::vector<std::int64_t>& getGradOutputStrides() const noexcept {
        return source_.getStorageView().getStrides();
    }
    bool isGradOutputHostMemory() const noexcept { return source_.getStorageView().isHostMemory(); }
    std::uintptr_t getGradOutputAlignmentOffset() const noexcept {
        return reinterpret_cast<std::uintptr_t>(getGradOutputAddress()) % 16;
    }
    void* getGradInputAddress() const noexcept { return destination_.getStorageView().getMemory(); }
    FTrainNumericType getGradInputNumericType() const noexcept {
        return destination_.getStorageView().getNumericType();
    }
    FTrainIndexType getGradInputIndexType() const noexcept { return destination_.getStorageView().getIndexType(); }
    const std::vector<std::int64_t>& getGradInputDims() const noexcept {
        return destination_.getStorageView().getDims();
    }
    const std::vector<std::int64_t>& getGradInputStrides() const noexcept {
        return destination_.getStorageView().getStrides();
    }
    bool isGradInputHostMemory() const noexcept { return destination_.getStorageView().isHostMemory(); }
    std::uintptr_t getGradInputAlignmentOffset() const noexcept {
        return reinterpret_cast<std::uintptr_t>(getGradInputAddress()) % 16;
    }
};

}  // namespace ftrain

#endif
