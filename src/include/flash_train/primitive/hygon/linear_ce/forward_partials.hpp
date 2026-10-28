// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_PARTIALS_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_FORWARD_PARTIALS_HPP_

#include <cstdint>
#include <memory>

#include "flash_train/family/linear_ce/problem.hpp"
#include "flash_train/primitive.hpp"

namespace ftrain {

// Runtime bridge for the exact-shape Linear CE forward assembly embedded in
// the FlashTrain library on gfx936.
class LinearCEForwardPartialsAssembly final : public Primitive<LinearCEForwardPartialsProblem> {
  public:
    LinearCEForwardPartialsAssembly() noexcept = default;

    const char* getName() const noexcept override;
    std::unique_ptr<PrimitiveBase> clone() const override;
    Result isApplicable(const LinearCEForwardPartialsProblem& problem,
                        const Constraints& constraints) const override;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept override;
    void configure(const LinearCEForwardPartialsProblem& problem) override;

    LinearCEForwardPartialsAssembly(const LinearCEForwardPartialsAssembly&) noexcept;
    LinearCEForwardPartialsAssembly& operator=(const LinearCEForwardPartialsAssembly&) = delete;

    ~LinearCEForwardPartialsAssembly() override;

  private:
    void executeImpl(const Resources& resources) override;

    const void* hidden_ = nullptr;
    const void* weight_ = nullptr;
    const std::int64_t* labels_ = nullptr;
    float* lse_local_ = nullptr;
    float* target_logit_local_ = nullptr;
    std::uint32_t n_ = 0;
    std::uint32_t d_ = 0;
    std::uint32_t v_ = 0;
    std::int64_t shard_vocab_start_ = 0;
    std::uint64_t workspace_bytes_ = 0;
};

}  // namespace ftrain

#endif
