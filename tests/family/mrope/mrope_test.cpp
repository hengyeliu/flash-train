// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <gtest/gtest.h>
#include <array>
#include <limits>
#include "flash_train/family/mrope/family.hpp"
#include "flash_train/family/mrope/finder.hpp"
#include "flash_train/primitive/hygon/mrope/mrope.hpp"

namespace ftrain {
namespace {
Tensor tensor(std::uintptr_t pointer, const std::array<std::int64_t, 4>& dims,
              FTrainNumericType type = FTRAIN_NUMERIC_TYPE_BF16, const std::int64_t* strides = nullptr,
              bool host = false) {
    return Tensor(
        StorageView(FTrainStorageView{reinterpret_cast<void*>(pointer), dims.data(), strides, 4, type,
                                      strides ? FTRAIN_INDEX_TYPE_INVALID : FTRAIN_INDEX_TYPE_CONTINUOUS, host}));
}
constexpr std::array<std::int64_t, 4> shape{17, 2, 5, 256};
constexpr std::array<std::int64_t, 4> freqs{3, 2, 17, 32};
MropeAttributes attrs({11, 11, 10}, true, false);

TEST(MropeProblemTest, DirectionSpecificPortsAndMetadata) {
    MropeForwardProblem f(tensor(0x100000, shape), tensor(0x200000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                          tensor(0x300000, shape), attrs);
    MropeBackwardProblem b(tensor(0x400000, shape), tensor(0x200000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                           tensor(0x500000, shape), attrs);
    EXPECT_EQ(f.getInputAddress(), reinterpret_cast<void*>(0x100000));
    EXPECT_EQ(f.getOutputAddress(), reinterpret_cast<void*>(0x300000));
    EXPECT_EQ(b.getGradOutputAddress(), reinterpret_cast<void*>(0x400000));
    EXPECT_EQ(b.getGradInputAddress(), reinterpret_cast<void*>(0x500000));
    EXPECT_EQ(b.getRawFreqsAddress(), f.getRawFreqsAddress());
    EXPECT_FALSE(f.isInverse());
    EXPECT_TRUE(b.isInverse());
    EXPECT_NE(f.getProblemKey(), b.getProblemKey());
    EXPECT_EQ(f.getSequenceLength(), 17);
    EXPECT_EQ(f.getBatchSize(), 2);
    EXPECT_EQ(f.getNumHeads(), 5);
    EXPECT_EQ(f.getHeadDim(), 256);
    EXPECT_EQ(f.getRotaryDim(), 64);
    EXPECT_EQ(f.getRequiredWorkspaceBytes(), 0U);
}

TEST(MropeProblemTest, IndependentPortsAffectApplicabilityAndKey) {
    const Constraints device(0);
    const MropeForward forward;
    const MropeBackward backward;
    const std::int64_t strides[]{2560, 1280, 256, 1};
    for (int port = 0; port < 3; ++port) {
        for (int fault = 0; fault < 5; ++fault) {
            auto view = [&](int i) {
                auto type = i == 1 ? FTRAIN_NUMERIC_TYPE_FP32 : FTRAIN_NUMERIC_TYPE_BF16;
                if (port == i && fault == 0) { type = FTRAIN_NUMERIC_TYPE_FP16; }
                std::uintptr_t address = 0x100000 * (i + 1);
                if (port == i && fault == 2) { address += 2; }
                if (port == i && fault == 3) { address = 0; }
                return tensor(address, i == 1 ? freqs : shape, type, port == i && fault == 1 ? strides : nullptr,
                              port == i && fault == 4);
            };
            MropeForwardProblem f(view(0), view(1), view(2), attrs);
            MropeBackwardProblem b(view(0), view(1), view(2), attrs);
            EXPECT_FALSE(forward.isApplicable(f, device).isSuccess()) << port << ":" << fault;
            EXPECT_FALSE(backward.isApplicable(b, device).isSuccess()) << port << ":" << fault;
            MropeForwardProblem good(tensor(0x100000, shape), tensor(0x200000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                                     tensor(0x300000, shape), attrs);
            EXPECT_NE(f.getProblemKey(), good.getProblemKey());
        }
    }
}

TEST(MropeProblemTest, OverlapAndPointerRebinding) {
    auto make = [](std::uintptr_t input, std::uintptr_t output) {
        return MropeForwardProblem(tensor(input, shape), tensor(0x800000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                                   tensor(output, shape), attrs);
    };
    auto original = make(0x100000, 0x200000);
    auto rebound  = make(0x300000, 0x400000);
    EXPECT_EQ(original.getProblemKey(), rebound.getProblemKey());
    auto overlap = make(0x100000, 0x100010);
    EXPECT_TRUE(overlap.hasOutputOverlap());
    EXPECT_NE(original.getProblemKey(), overlap.getProblemKey());
    EXPECT_FALSE(MropeForward().isApplicable(overlap, Constraints(0)).isSuccess());
    auto freq_overlap = make(0x100000, 0x800010);
    EXPECT_TRUE(freq_overlap.hasOutputOverlap());
}

TEST(MropeProblemTest, PackedThresholdAndShapeFailures) {
    for (int tokens : {2047, 2048, 2049}) {
        MropeForwardProblem p(tensor(0x10000000, {tokens, 1, 4, 256}),
                              tensor(0x20000000, {3, 1, tokens, 32}, FTRAIN_NUMERIC_TYPE_FP32),
                              tensor(0x30000000, {tokens, 1, 4, 256}), attrs);
        EXPECT_EQ(p.usesPackedTail(), tokens >= 2048);
        EXPECT_EQ(p.getLaunchThreads(), tokens >= 2048 ? 64U : 256U);
    }
    EXPECT_THROW(MropeForwardProblem(tensor(1, {0, 2, 5, 256}), tensor(2, freqs), tensor(3, shape), attrs), Exception);
    EXPECT_THROW(MropeForwardProblem(tensor(1, shape), tensor(2, freqs), tensor(3, shape),
                                     MropeAttributes({24, 4, 4}, true, false)),
                 Exception);
    EXPECT_THROW(MropeForwardProblem(tensor(1, {65536, 32768, 1, 2}), tensor(2, {3, 32768, 65536, 1}),
                                     tensor(3, {65536, 32768, 1, 2}), MropeAttributes({1, 0, 0}, false, false)),
                 Exception);
}

TEST(MropeFamilyTest, DirectionPatternsAndRegistrationAreDistinct) {
    PatternBuilder builder;
    auto output = builder.addOperand<OperandKind::kTensor>();
    auto raw    = builder.addOperand<OperandKind::kTensor>();
    auto input  = builder.addOperand<OperandKind::kTensor>();
    builder.addOperation<OperationKind::kMropeForward>(input, raw, output);
    EXPECT_EQ(builder.buildPattern().getKey(), MropeForwardFamily::makePattern().getKey());
    EXPECT_NE(MropeBackwardFamily::makePattern().getKey(), MropeForwardFamily::makePattern().getKey());
    const auto f = MropeForwardFamily::makeRecords();
    const auto b = MropeBackwardFamily::makeRecords();
    ASSERT_EQ(f.size(), 1U);
    ASSERT_EQ(b.size(), 1U);
    EXPECT_STREQ(f.front()->getName(), "HygonMropeForward02PackedTail");
    EXPECT_STREQ(b.front()->getName(), "HygonMropeBackward02PackedTail");
}

TEST(MropeFinderTest, ExplicitCandidatesMatchDirectionRegistration) {
    const MropeForwardProblem f(tensor(0x100000, shape), tensor(0x200000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                                tensor(0x300000, shape), attrs);
    const MropeBackwardProblem b(tensor(0x400000, shape), tensor(0x200000, freqs, FTRAIN_NUMERIC_TYPE_FP32),
                                 tensor(0x500000, shape), attrs);
    std::vector<std::string> forward_names, backward_names;
    for (const auto& record : MropeForwardFamily::makeRecords()) { forward_names.emplace_back(record->getName()); }
    for (const auto& record : MropeBackwardFamily::makeRecords()) { backward_names.emplace_back(record->getName()); }
    const Constraints device(0);
    const auto forward = MropeRegistrationOrderFinder::findCandidates(f, device);
    const auto backward = MropeRegistrationOrderFinder::findCandidates(b, device);
    EXPECT_EQ(forward, forward_names);
    EXPECT_EQ(backward, backward_names);
    EXPECT_NE(forward, backward);
    EXPECT_EQ(MropeRegistrationOrderFinder::findCandidates(f, device), forward);
    EXPECT_EQ(MropeRegistrationOrderFinder::findCandidates(b, device), backward);
}
}  // namespace
}  // namespace ftrain
