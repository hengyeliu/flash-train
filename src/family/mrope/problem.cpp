// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <algorithm>
#include <limits>

#include "flash_train/error.hpp"
#include "flash_train/family/mrope/problem.hpp"

namespace ftrain {
namespace {
std::uint64_t multiply(std::uint64_t a, std::uint64_t b) {
    if (b && a > std::numeric_limits<std::uint64_t>::max() / b) {
        throw Exception(FTRAIN_STATUS_OVERFLOW, "mRoPE storage size overflows uint64_t");
    }
    return a * b;
}
std::uint64_t elementBytes(FTrainNumericType type) {
    if (type == FTRAIN_NUMERIC_TYPE_FP32) { return 4; }
    if (type == FTRAIN_NUMERIC_TYPE_BF16 || type == FTRAIN_NUMERIC_TYPE_FP16) { return 2; }
    // Unsupported numeric types are rejected by the Primitive before use.
    return 1;
}
bool overlaps(const void* a, std::uint64_t a_bytes, const void* b, std::uint64_t b_bytes) {
    if (!a || !b) { return false; }
    const auto left  = reinterpret_cast<std::uintptr_t>(a);
    const auto right = reinterpret_cast<std::uintptr_t>(b);
    return left <= right ? right - left < a_bytes : left - right < b_bytes;
}
}  // namespace

MropeProblemBase::MropeProblemBase(Tensor source, Tensor raw_freqs, Tensor destination, MropeAttributes attributes,
                                   bool inverse)
    : source_(std::move(source)), raw_freqs_(std::move(raw_freqs)), destination_(std::move(destination)),
      attributes_(attributes), inverse_(inverse) {
    const auto& dims      = source_.getStorageView().getDims();
    const auto& freq_dims = getRawFreqsDims();
    if (dims.size() != 4 || destination_.getStorageView().getDims() != dims || freq_dims.size() != 4) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT,
                        "mRoPE requires matching rank-four SBHD source/output and rank-four raw frequencies");
    }
    for (auto dim : dims) {
        if (dim <= 0) { throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE S, B, H and D must all be positive"); }
        if (dim > std::numeric_limits<int>::max()) {
            throw Exception(FTRAIN_STATUS_OVERFLOW, "mRoPE dimension exceeds int launch indexing");
        }
    }
    if (dims[3] > 1024 || freq_dims[0] != 3 || freq_dims[1] != dims[1] || freq_dims[2] != dims[0] ||
        freq_dims[3] <= 0 || freq_dims[3] > dims[3] / 2) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT,
                        "mRoPE requires D <= 1024 and raw_freqs [3,B,S,R/2] with 0 < R <= D");
    }
    const auto half    = freq_dims[3];
    const auto section = getSection();
    for (auto value : section) {
        if (value < 0 || value > half) {
            throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE section is outside [0,R/2]");
        }
    }
    if (section[0] + section[1] + section[2] != half) {
        throw Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE section must sum to R/2");
    }
    if (isInterleaved() && section != std::array<std::int64_t, 3>{(half + 2) / 3, (half + 1) / 3, half / 3}) {
        throw Exception(FTRAIN_STATUS_UNSUPPORTED, "mRoPE 02_packed_tail requires balanced interleaved sections");
    }
    const auto tokens = multiply(dims[0], dims[1]);
    if (tokens > std::numeric_limits<int>::max()) {
        throw Exception(FTRAIN_STATUS_OVERFLOW, "mRoPE S*B exceeds int launch indexing");
    }
    const auto elements = multiply(multiply(tokens, dims[2]), dims[3]);
    source_bytes_       = multiply(elements, elementBytes(source_.getStorageView().getNumericType()));
    destination_bytes_  = multiply(elements, elementBytes(destination_.getStorageView().getNumericType()));
    frequency_bytes_    = multiply(multiply(multiply(3, tokens), half), 4);
}

std::uint32_t MropeProblemBase::getLaunchTokens() const noexcept { return getSequenceLength() * getBatchSize(); }
std::uint32_t MropeProblemBase::getLaunchHeadTiles() const noexcept {
    return (static_cast<std::uint64_t>(getNumHeads()) + 3) / 4;
}
bool MropeProblemBase::usesPackedTail() const noexcept {
    return source_.getStorageView().getNumericType() == FTRAIN_NUMERIC_TYPE_BF16 && getHeadDim() == 256 &&
           getRotaryDim() == 64 && static_cast<std::uint64_t>(getLaunchTokens()) * getLaunchHeadTiles() >= 2048;
}
std::uint32_t MropeProblemBase::getLaunchThreads() const noexcept {
    const auto lanes      = getRotaryDim() / 2 + (getHeadDim() - getRotaryDim()) / (usesPackedTail() ? 8 : 1);
    std::uint32_t threads = 1;
    while (threads < static_cast<std::uint32_t>(lanes)) { threads *= 2; }
    return threads;
}
bool MropeProblemBase::hasOutputOverlap() const noexcept {
    return overlaps(source_.getStorageView().getMemory(), source_bytes_, destination_.getStorageView().getMemory(),
                    destination_bytes_) ||
           overlaps(getRawFreqsAddress(), frequency_bytes_, destination_.getStorageView().getMemory(),
                    destination_bytes_);
}
std::vector<std::uint64_t> MropeProblemBase::getProblemKey() const {
    std::vector<std::uint64_t> key;
    for (const auto* view : {&source_.getStorageView(), &raw_freqs_.getStorageView(), &destination_.getStorageView()}) {
        key.insert(key.end(),
                   {view->getNumericType(), view->getIndexType(), static_cast<std::uint64_t>(view->isHostMemory()),
                    static_cast<std::uint64_t>(view->getMemory() != nullptr),
                    reinterpret_cast<std::uintptr_t>(view->getMemory()) % 16, view->getDims().size()});
        for (auto d : view->getDims()) { key.push_back(d); }
        key.push_back(view->getStrides().size());
        for (auto s : view->getStrides()) { key.push_back(s); }
    }
    for (auto s : getSection()) { key.push_back(s); }
    key.insert(key.end(), {isInterleaved(), usesFp32Compute(), isInverse(), hasOutputOverlap()});
    return key;
}
}  // namespace ftrain
