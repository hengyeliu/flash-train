// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_FINALIZE_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_FINALIZE_HPP_

#include <cstdint>
#include <memory>

#include <hip/hip_runtime_api.h>

#include "flash_train/family/linear_ce/problem.hpp"
#include "flash_train/primitive.hpp"

namespace ftrain {

class LinearCEForwardFinalizeHip final : public Primitive<LinearCEForwardFinalizeProblem> {
  public:
    LinearCEForwardFinalizeHip() noexcept = default;

    const char* getName() const noexcept override;
    std::unique_ptr<PrimitiveBase> clone() const override;
    Result isApplicable(const LinearCEForwardFinalizeProblem& problem,
                        const Constraints& constraints) const override;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept override;
    void configure(const LinearCEForwardFinalizeProblem& problem) override;

  private:
    void executeImpl(const Resources& resources) override;

    const float* lse_ = nullptr;
    const float* target_logit_ = nullptr;
    const std::int64_t* labels_ = nullptr;
    float* loss_ = nullptr;
    float* maximum_ = nullptr;
    float* saved_lse_ = nullptr;
    std::int64_t* num_valid_tokens_ = nullptr;
    std::uint32_t n_ = 0;
    std::uint64_t workspace_bytes_ = 0;
};

}  // namespace ftrain

#endif
