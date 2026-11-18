// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <cstring>
#include <string>
#include <hip/hip_runtime.h>
#include "flash_train/primitive/hygon/mrope/mrope.hpp"
namespace ftrain {
namespace {
Result checkDeviceAndLaunch(const MropeProblemBase& p, const Constraints& constraints) {
    hipDeviceProp_t properties{};
    const auto status = hipGetDeviceProperties(&properties, constraints.getDeviceId());
    if (status != hipSuccess) { return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE cannot query execution device"); }
    std::string arch           = properties.gcnArchName;
    arch                       = arch.substr(0, arch.find(':'));
    const std::string compiled = "," FTRAIN_MROPE_COMPILED_ARCHS ",";
    if (compiled.find("," + arch + ",") == std::string::npos) {
        return Result(FTRAIN_STATUS_UNSUPPORTED,
                      "mRoPE library has no configured code object for this device architecture");
    }
    if (p.getLaunchTokens() > static_cast<std::uint64_t>(properties.maxGridSize[0]) ||
        p.getLaunchHeadTiles() > static_cast<std::uint64_t>(properties.maxGridSize[1]) ||
        p.getLaunchThreads() > static_cast<std::uint64_t>(properties.maxThreadsPerBlock)) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE launch exceeds device grid/block limits");
    }
    return Result{};
}
MropeLaunch commonLaunch(const MropeProblemBase& p) {
    MropeLaunch launch;
    launch.raw_freqs  = static_cast<const float*>(p.getRawFreqsAddress());
    launch.seq        = p.getSequenceLength();
    launch.batch      = p.getBatchSize();
    launch.heads      = p.getNumHeads();
    launch.head_dim   = p.getHeadDim();
    launch.rotary_dim = p.getRotaryDim();
    for (std::size_t i = 0; i < 3; ++i) { launch.section[i] = static_cast<int>(p.getSection()[i]); }
    launch.interleaved  = p.isInterleaved();
    launch.inverse      = p.isInverse();
    launch.fp32_compute = p.usesFp32Compute();
    launch.packed_tail  = p.usesPackedTail();
    launch.tokens       = p.getLaunchTokens();
    launch.head_tiles   = p.getLaunchHeadTiles();
    launch.threads      = p.getLaunchThreads();
    return launch;
}
}  // namespace
Result MropeForward::isApplicable(const MropeForwardProblem& p, const Constraints& constraints) const {
    const auto dtype = p.getInputNumericType();
    if ((dtype != FTRAIN_NUMERIC_TYPE_FP32 && dtype != FTRAIN_NUMERIC_TYPE_FP16 && dtype != FTRAIN_NUMERIC_TYPE_BF16) ||
        p.getOutputNumericType() != dtype || p.getRawFreqsNumericType() != FTRAIN_NUMERIC_TYPE_FP32) {
        return Result(FTRAIN_STATUS_UNSUPPORTED,
                      "mRoPE requires matching BF16/FP16/FP32 activation ports and FP32 raw frequencies");
    }
    if (p.getInputIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS ||
        p.getOutputIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS ||
        p.getRawFreqsIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE 02_packed_tail requires continuous SBHD and raw frequencies");
    }
    if (p.isInputHostMemory() || p.isOutputHostMemory() || p.isRawFreqsHostMemory()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE ports must be device memory");
    }
    if (!p.getInputAddress() || !p.getOutputAddress() || !p.getRawFreqsAddress()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE requires non-null ports");
    }
    if (p.getInputAlignmentOffset() || p.getOutputAlignmentOffset() || p.getRawFreqsAlignmentOffset()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE ports must be 16-byte aligned");
    }
    if (p.hasOutputOverlap()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE output must not overlap an input or raw frequencies");
    }
    return checkDeviceAndLaunch(p, constraints);
}
void MropeForward::configure(const MropeForwardProblem& p) {
    launch_        = commonLaunch(p);
    launch_.input  = p.getInputAddress();
    launch_.output = p.getOutputAddress();
    launch_.dtype  = p.getInputNumericType();
}
Result MropeBackward::isApplicable(const MropeBackwardProblem& p, const Constraints& constraints) const {
    const auto dtype = p.getGradOutputNumericType();
    if ((dtype != FTRAIN_NUMERIC_TYPE_FP32 && dtype != FTRAIN_NUMERIC_TYPE_FP16 && dtype != FTRAIN_NUMERIC_TYPE_BF16) ||
        p.getGradInputNumericType() != dtype || p.getRawFreqsNumericType() != FTRAIN_NUMERIC_TYPE_FP32) {
        return Result(FTRAIN_STATUS_UNSUPPORTED,
                      "mRoPE requires matching BF16/FP16/FP32 activation ports and FP32 raw frequencies");
    }
    if (p.getGradOutputIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS ||
        p.getGradInputIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS ||
        p.getRawFreqsIndexType() != FTRAIN_INDEX_TYPE_CONTINUOUS) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE 02_packed_tail requires continuous SBHD and raw frequencies");
    }
    if (p.isGradOutputHostMemory() || p.isGradInputHostMemory() || p.isRawFreqsHostMemory()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE ports must be device memory");
    }
    if (!p.getGradOutputAddress() || !p.getGradInputAddress() || !p.getRawFreqsAddress()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE requires non-null ports");
    }
    if (p.getGradOutputAlignmentOffset() || p.getGradInputAlignmentOffset() || p.getRawFreqsAlignmentOffset()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE ports must be 16-byte aligned");
    }
    if (p.hasOutputOverlap()) {
        return Result(FTRAIN_STATUS_UNSUPPORTED, "mRoPE output must not overlap an input or raw frequencies");
    }
    return checkDeviceAndLaunch(p, constraints);
}
void MropeBackward::configure(const MropeBackwardProblem& p) {
    launch_        = commonLaunch(p);
    launch_.input  = p.getGradOutputAddress();
    launch_.output = p.getGradInputAddress();
    launch_.dtype  = p.getGradOutputNumericType();
}
}  // namespace ftrain
