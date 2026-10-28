// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_STUB_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_STUB_HPP_

#include <cstdint>
#include <memory>

#include "flash_train/primitive.hpp"

namespace ftrain {

// Phase A registers the Linear CE execution slots without enabling a kernel
// implementation. This fail-closed Primitive makes incomplete migration
// visible as FTRAIN_STATUS_UNSUPPORTED instead of silently running a fallback.
template<typename Problem>
class LinearCEPhaseAStub final : public Primitive<Problem> {
  public:
    const char* getName() const noexcept override { return "LinearCEPhaseAStub"; }

    std::unique_ptr<PrimitiveBase> clone() const override {
        return std::make_unique<LinearCEPhaseAStub<Problem>>(*this);
    }

    Result isApplicable(const Problem&, const Constraints&) const override {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "Linear CE execution is not enabled before Phase B");
    }

    std::uint64_t getRequiredWorkspaceBytes() const noexcept override { return 0; }

    void configure(const Problem&) override {}

  private:
    void executeImpl(const Resources&) override {
        throw Exception(FTRAIN_STATUS_UNSUPPORTED, "Linear CE execution is not enabled before Phase B");
    }
};

}  // namespace ftrain

#endif
