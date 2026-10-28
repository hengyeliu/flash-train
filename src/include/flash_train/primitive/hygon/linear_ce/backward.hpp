// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#ifndef FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_BACKWARD_HPP_
#define FTRAIN_PRIMITIVE_HYGON_LINEAR_CE_BACKWARD_HPP_

#include <cstdint>
#include <memory>

#include <hip/hip_runtime_api.h>
#include <rocblas.h>

#include "flash_train/family/linear_ce/problem.hpp"
#include "flash_train/primitive.hpp"

namespace ftrain {

class LinearCEBackwardRocblas final : public Primitive<LinearCEBackwardProblem> {
  public:
    LinearCEBackwardRocblas() noexcept = default;
    LinearCEBackwardRocblas(const LinearCEBackwardRocblas& other) noexcept;
    LinearCEBackwardRocblas& operator=(const LinearCEBackwardRocblas&) = delete;
    ~LinearCEBackwardRocblas() override;

    const char* getName() const noexcept override;
    std::unique_ptr<PrimitiveBase> clone() const override;
    Result isApplicable(const LinearCEBackwardProblem& problem,
                        const Constraints& constraints) const override;
    std::uint64_t getRequiredWorkspaceBytes() const noexcept override;
    void configure(const LinearCEBackwardProblem& problem) override;

  private:
    void executeImpl(const Resources& resources) override;

    rocblas_handle handle_ = nullptr;
    const float* dloss_ = nullptr;
    const void* hidden_ = nullptr;
    const void* weight_ = nullptr;
    const std::int64_t* labels_ = nullptr;
    const float* saved_lse_ = nullptr;
    const std::int64_t* num_valid_tokens_ = nullptr;
    void* main_grad_ = nullptr;
    void* d_hidden_ = nullptr;
    void* d_weight_ = nullptr;
    std::uint32_t n_ = 0;
    std::uint32_t d_ = 0;
    std::uint32_t v_ = 0;
    std::uint32_t chunk_v_ = 0;
    std::uint64_t shard_vocab_start_ = 0;
    FTrainNumericType main_grad_type_ = FTRAIN_NUMERIC_TYPE_INVALID;
    FTrainLinearCEMainGradMode main_grad_mode_ = FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_INVALID;
    std::uint64_t workspace_bytes_ = 0;
};

}  // namespace ftrain

#endif
