// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_PRIMITIVE_HYGON_MROPE_HPP_
#define FTRAIN_PRIMITIVE_HYGON_MROPE_HPP_
#include <array>
#include "flash_train/family/mrope/problem.hpp"
#include "flash_train/primitive.hpp"
namespace ftrain {
struct MropeLaunch {
    const void* input      = nullptr;
    const float* raw_freqs = nullptr;
    void* output           = nullptr;
    int seq = 0, batch = 0, heads = 0, head_dim = 0, rotary_dim = 0;
    std::array<int, 3> section{};
    bool interleaved = false, inverse = false, fp32_compute = false, packed_tail = false;
    FTrainNumericType dtype = FTRAIN_NUMERIC_TYPE_INVALID;
    std::uint32_t tokens = 0, head_tiles = 0, threads = 0;
};
void launchMrope(const MropeLaunch& launch, FTrainStream stream);
class MropeForward final : public Primitive<MropeForwardProblem> {
  public:
    const char* getName() const noexcept override { return "HygonMropeForward02PackedTail"; }
    std::unique_ptr<PrimitiveBase> clone() const override { return std::make_unique<MropeForward>(*this); }
    Result isApplicable(const MropeForwardProblem& problem, const Constraints& constraints) const override;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept override { return 0; }
    void configure(const MropeForwardProblem& problem) override;

  private:
    void executeImpl(const Resources& resources) override { launchMrope(launch_, resources.getStream()); }
    MropeLaunch launch_;
};
class MropeBackward final : public Primitive<MropeBackwardProblem> {
  public:
    const char* getName() const noexcept override { return "HygonMropeBackward02PackedTail"; }
    std::unique_ptr<PrimitiveBase> clone() const override { return std::make_unique<MropeBackward>(*this); }
    Result isApplicable(const MropeBackwardProblem& problem, const Constraints& constraints) const override;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept override { return 0; }
    void configure(const MropeBackwardProblem& problem) override;

  private:
    void executeImpl(const Resources& resources) override { launchMrope(launch_, resources.getStream()); }
    MropeLaunch launch_;
};
}  // namespace ftrain
#endif
