// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <cstddef>
#include <limits>
#include <memory>

#include <hip/hip_runtime_api.h>

#include "flash_train/error.hpp"
#include "flash_train/primitive/hygon/linear_ce/forward_partials.hpp"
#include "launch.hpp"

namespace ftrain {
namespace {

constexpr std::uint32_t kTile = 256;
constexpr std::uint32_t kBlockSize = 768;
constexpr std::uint32_t kWgm = 8;
constexpr std::uint64_t kTensileArgsBytes = 160;

static_assert(sizeof(LinearCEForwardTensileArgs) == kTensileArgsBytes, "Linear CE Tensile ABI changed");
static_assert(offsetof(LinearCEForwardTensileArgs, d) == 24, "Linear CE Tensile D offset changed");
static_assert(offsetof(LinearCEForwardTensileArgs, sizes_free0) == 96, "Linear CE Tensile SizesFree0 offset changed");

std::uint32_t magicForDivisor(std::uint32_t divisor) {
    return static_cast<std::uint32_t>((std::uint64_t{1} << 31) / divisor + 1);
}

std::uint64_t workspaceBytes(std::uint32_t n, std::uint32_t v) {
    const std::uint64_t tiles = v / kTile;
    return (2ULL * tiles * n + n) * sizeof(float) + static_cast<std::uint64_t>(n) * sizeof(std::int64_t);
}

bool isContiguous(FTrainIndexType index_type) { return index_type == FTRAIN_INDEX_TYPE_CONTINUOUS; }

bool hasAddress(void* address) { return address != nullptr; }

Result unsupported(const char* message) { return Result(FTRAIN_STATUS_UNSUPPORTED, message); }

}  // namespace

LinearCEForwardPartialsAssembly::LinearCEForwardPartialsAssembly(
    const LinearCEForwardPartialsAssembly&) noexcept {}

LinearCEForwardPartialsAssembly::~LinearCEForwardPartialsAssembly() = default;

const char* LinearCEForwardPartialsAssembly::getName() const noexcept {
    return "LinearCEForwardPartialsAssembly";
}

std::unique_ptr<PrimitiveBase> LinearCEForwardPartialsAssembly::clone() const {
    return std::unique_ptr<PrimitiveBase>(new LinearCEForwardPartialsAssembly(*this));
}

Result LinearCEForwardPartialsAssembly::isApplicable(const LinearCEForwardPartialsProblem& problem,
                                                      const Constraints&) const {
    if (problem.getConfiguredHiddenType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredWeightType() != FTRAIN_NUMERIC_TYPE_BF16 ||
        problem.getConfiguredLabelType() != FTRAIN_NUMERIC_TYPE_INT64 ||
        problem.getAccumulationType() != FTRAIN_NUMERIC_TYPE_FP32 ||
        problem.getIgnoreIndex() != -100 || problem.getReduction() != FTRAIN_LINEAR_CE_REDUCTION_MEAN) {
        return unsupported("assembly supports BF16/BF16/INT64 with FP32 mean and ignore_index=-100 only");
    }
    if (problem.getHiddenRank() != 2 || problem.getWeightRank() != 2 || problem.getLabelsRank() != 1 ||
        problem.getLseLocalRank() != 1 || problem.getTargetLogitLocalRank() != 1) {
        return unsupported("assembly requires hidden/weight rank two and vector labels/outputs");
    }
    const std::uint64_t n = problem.getN();
    const std::uint64_t d = problem.getD();
    const std::uint64_t v = problem.getV();
    if (n == 0 || d == 0 || v == 0 || problem.getWeightD() != d || problem.getLabelsLength() != n ||
        problem.getLseLocalLength() != n || problem.getTargetLogitLocalLength() != n) {
        return unsupported("assembly input and output dimensions are inconsistent");
    }
    if (n % kTile != 0 || d % kTile != 0 || v % kTile != 0 || d % 64 != 0) {
        return unsupported("assembly family requires N/D/V multiples of 256 and D multiple of 64");
    }
    if (n > std::numeric_limits<std::uint32_t>::max() || d > std::numeric_limits<std::uint32_t>::max() ||
        v > std::numeric_limits<std::uint32_t>::max() ||
        problem.getShardVocabStart() >
            static_cast<std::uint64_t>(std::numeric_limits<std::int64_t>::max()) - v) {
        return unsupported("assembly dimensions or shard vocabulary offset exceed the runtime ABI");
    }
    if (v * n > std::numeric_limits<std::uint32_t>::max() ||
        v * d > std::numeric_limits<std::uint32_t>::max() ||
        d * n > std::numeric_limits<std::uint32_t>::max()) {
        return unsupported("assembly matrix strides exceed the 32-bit Tensile ABI");
    }
    if (!problem.isHiddenDeviceMemory() || !isContiguous(problem.getHiddenIndexType()) ||
        !hasAddress(problem.getHiddenAddress()) || !problem.isWeightDeviceMemory() ||
        !isContiguous(problem.getWeightIndexType()) || !hasAddress(problem.getWeightAddress()) ||
        !problem.isLabelsDeviceMemory() || !isContiguous(problem.getLabelsIndexType()) ||
        !hasAddress(problem.getLabelsAddress()) || !problem.isLseLocalDeviceMemory() ||
        !isContiguous(problem.getLseLocalIndexType()) || !hasAddress(problem.getLseLocalAddress()) ||
        !problem.isTargetLogitLocalDeviceMemory() || !isContiguous(problem.getTargetLogitLocalIndexType()) ||
        !hasAddress(problem.getTargetLogitLocalAddress())) {
        return unsupported("assembly requires contiguous device tensors with non-null addresses");
    }
#if !defined(FTRAIN_LINEAR_CE_FORWARD_EMBEDDED)
    return unsupported("embedded Linear CE forward assembly is not available in this build");
#endif
    return Result{};
}

std::uint64_t LinearCEForwardPartialsAssembly::getRequiredWorkspaceBytes() const noexcept {
    return workspace_bytes_;
}

void LinearCEForwardPartialsAssembly::configure(const LinearCEForwardPartialsProblem& problem) {
    const Result result = isApplicable(problem, Constraints{0});
    if (!result.isSuccess()) { throw Exception(result.getStatus(), "%s", result.getMessage()); }

    n_ = static_cast<std::uint32_t>(problem.getN());
    d_ = static_cast<std::uint32_t>(problem.getD());
    v_ = static_cast<std::uint32_t>(problem.getV());
    hidden_ = problem.getHiddenAddress();
    weight_ = problem.getWeightAddress();
    labels_ = static_cast<const std::int64_t*>(problem.getLabelsAddress());
    lse_local_ = static_cast<float*>(problem.getLseLocalAddress());
    target_logit_local_ = static_cast<float*>(problem.getTargetLogitLocalAddress());
    shard_vocab_start_ = static_cast<std::int64_t>(problem.getShardVocabStart());
    workspace_bytes_ = workspaceBytes(n_, v_);

#if !defined(FTRAIN_LINEAR_CE_FORWARD_EMBEDDED)
    throw Exception(FTRAIN_STATUS_UNSUPPORTED, "embedded Linear CE forward assembly is not available in this build");
#endif
}

void LinearCEForwardPartialsAssembly::executeImpl(const Resources& resources) {
    launchLinearCEForwardPartials(hidden_, weight_, labels_, lse_local_, target_logit_local_, n_, d_, v_,
                                   shard_vocab_start_, resources.getWorkspace(), resources.getStream());
}

}  // namespace ftrain
