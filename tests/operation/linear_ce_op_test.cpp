// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstddef>
#include <string>
#include <type_traits>
#include <vector>

#include <gtest/gtest.h>

#include "flash_train/family/linear_ce/finder.hpp"
#include "flash_train/family/linear_ce/family.hpp"
#include "flash_train/operation/operation.hpp"

namespace ftrain {
namespace {

StorageView makeDeviceView(void* memory, const std::int64_t* dims, std::uint8_t rank, FTrainNumericType type) {
    return StorageView(
        FTrainStorageView{memory, dims, nullptr, rank, type, FTRAIN_INDEX_TYPE_CONTINUOUS, false});
}

LinearCEDataAttributes makeDataAttributes() {
    return LinearCEDataAttributes{FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_INT64,
                                  FTRAIN_NUMERIC_TYPE_FP32, -100, FTRAIN_LINEAR_CE_REDUCTION_MEAN};
}

LinearCEForwardPartialsProblem makeForwardPartialsProblem() {
    static const std::int64_t matrix_dims[]{256, 256};
    static const std::int64_t vector_dims[]{256};
    return LinearCEForwardPartialsProblem{
        Tensor(makeDeviceView(reinterpret_cast<void*>(1), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(2), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(3), vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(4), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(5), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        LinearCEForwardPartialsAttributes{makeDataAttributes(), 0}};
}

LinearCEForwardFinalizeProblem makeForwardFinalizeProblem() {
    static const std::int64_t vector_dims[]{256};
    return LinearCEForwardFinalizeProblem{
        Tensor(makeDeviceView(reinterpret_cast<void*>(1), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(2), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(3), vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(4), nullptr, 0, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(5), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(6), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(7), nullptr, 0, FTRAIN_NUMERIC_TYPE_INT64)),
        LinearCEForwardFinalizeAttributes{makeDataAttributes()}};
}

LinearCEBackwardProblem makeBackwardProblem() {
    static const std::int64_t matrix_dims[]{256, 256};
    static const std::int64_t vector_dims[]{256};
    return LinearCEBackwardProblem{
        Tensor(makeDeviceView(reinterpret_cast<void*>(1), nullptr, 0, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(2), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(3), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(4), vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(5), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(6), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(7), nullptr, 0, FTRAIN_NUMERIC_TYPE_INT64)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(8), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(9), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        Tensor(makeDeviceView(reinterpret_cast<void*>(10), matrix_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
        LinearCEBackwardAttributes{makeDataAttributes(), FTRAIN_NUMERIC_TYPE_BF16,
                                    FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_ACCUMULATE, 0}};
}

static_assert(std::is_same_v<OperationTraits<OperationKind::kLinearCEForwardPartials>::Id,
                             FTrainLinearCEForwardPartialsOpId>);
static_assert(std::is_same_v<OperationTraits<OperationKind::kLinearCEForwardFinalize>::Id,
                             FTrainLinearCEForwardFinalizeOpId>);
static_assert(std::is_same_v<OperationTraits<OperationKind::kLinearCEBackward>::Id, FTrainLinearCEBackwardOpId>);
static_assert(std::is_constructible_v<OperationValue, LinearCEForwardPartialsAttributes>);
static_assert(std::is_constructible_v<OperationValue, LinearCEForwardFinalizeAttributes>);
static_assert(std::is_constructible_v<OperationValue, LinearCEBackwardAttributes>);

TEST(LinearCEOperationTest, ForwardPartialsSchemaHasThreeInputsAndTwoOutputs) {
    const auto& roles = LinearCEForwardPartialsFamily::makeRoles();
    ASSERT_EQ(roles.pattern.getNumOps(), 1U);
    const PatternOperationNode& node = roles.pattern.getOpNode(PatternOperationId{roles.op.opaque});
    EXPECT_EQ(node.getKind(), OperationKind::kLinearCEForwardPartials);
    EXPECT_EQ(node.getInputs().size(), 3U);
    EXPECT_EQ(node.getOutputs().size(), 2U);
}

TEST(LinearCEOperationTest, ForwardFinalizeSchemaHasThreeInputsAndFourOutputs) {
    const auto& roles = LinearCEForwardFinalizeFamily::makeRoles();
    ASSERT_EQ(roles.pattern.getNumOps(), 1U);
    const PatternOperationNode& node = roles.pattern.getOpNode(PatternOperationId{roles.op.opaque});
    EXPECT_EQ(node.getKind(), OperationKind::kLinearCEForwardFinalize);
    EXPECT_EQ(node.getInputs().size(), 3U);
    EXPECT_EQ(node.getOutputs().size(), 4U);
}

TEST(LinearCEOperationTest, BackwardSchemaCarriesMainGradAsAnExplicitInput) {
    const auto& roles = LinearCEBackwardFamily::makeRoles();
    ASSERT_EQ(roles.pattern.getNumOps(), 1U);
    const PatternOperationNode& node = roles.pattern.getOpNode(PatternOperationId{roles.op.opaque});
    EXPECT_EQ(node.getKind(), OperationKind::kLinearCEBackward);
    EXPECT_EQ(node.getInputs().size(), 8U);
    EXPECT_EQ(node.getOutputs().size(), 2U);
    EXPECT_EQ(node.getInputs()[7], PatternOperandId{roles.main_grad.opaque});
}

TEST(LinearCEOperationTest, RegistersRealForwardPartialsAndFinalizePrimitives) {
    const auto partials = LinearCEForwardPartialsFamily::makeRecords();
    const auto finalize = LinearCEForwardFinalizeFamily::makeRecords();
    ASSERT_EQ(partials.size(), 1U);
    ASSERT_EQ(finalize.size(), 1U);
    EXPECT_STREQ(partials.front()->getName(), "LinearCEForwardPartialsAssembly");
    EXPECT_STREQ(finalize.front()->getName(), "LinearCEForwardFinalizeHip");
}

TEST(LinearCEOperationTest, RegistersRocblasBackwardPrimitive) {
    const auto backward = LinearCEBackwardFamily::makeRecords();
    ASSERT_EQ(backward.size(), 1U);
    EXPECT_STREQ(backward.front()->getName(), "LinearCEBackwardRocblas");
}

TEST(LinearCEOperationTest, FindersReturnRegisteredPrimitiveNames) {
    const auto partials = LinearCERegistrationOrderFinder<LinearCEForwardPartialsProblem>::findCandidates(
        makeForwardPartialsProblem(), Constraints{0});
    const auto finalize = LinearCERegistrationOrderFinder<LinearCEForwardFinalizeProblem>::findCandidates(
        makeForwardFinalizeProblem(), Constraints{0});
    const auto backward =
        LinearCERegistrationOrderFinder<LinearCEBackwardProblem>::findCandidates(makeBackwardProblem(), Constraints{0});

    ASSERT_EQ(partials, (std::vector<std::string>{"LinearCEForwardPartialsAssembly"}));
    ASSERT_EQ(finalize, (std::vector<std::string>{"LinearCEForwardFinalizeHip"}));
    ASSERT_EQ(backward, (std::vector<std::string>{"LinearCEBackwardRocblas"}));
}

TEST(LinearCEOperationTest, ProblemsExposeFlattenedApplicabilityChecklist) {
    const auto partials = makeForwardPartialsProblem();
    EXPECT_EQ(partials.getN(), 256U);
    EXPECT_EQ(partials.getD(), 256U);
    EXPECT_EQ(partials.getV(), 256U);
    EXPECT_EQ(partials.getHiddenRank(), 2U);
    EXPECT_EQ(partials.getLabelsRank(), 1U);
    EXPECT_EQ(partials.getConfiguredHiddenType(), FTRAIN_NUMERIC_TYPE_BF16);
    EXPECT_EQ(partials.getAccumulationType(), FTRAIN_NUMERIC_TYPE_FP32);
    EXPECT_EQ(partials.getShardVocabStart(), 0U);
    EXPECT_TRUE(partials.isHiddenDeviceMemory());
    EXPECT_NE(partials.getHiddenAddress(), nullptr);

    const auto finalize = makeForwardFinalizeProblem();
    EXPECT_EQ(finalize.getN(), 256U);
    EXPECT_EQ(finalize.getLossRank(), 0U);
    EXPECT_EQ(finalize.getNumValidTokensRank(), 0U);
    EXPECT_TRUE(finalize.isLossDeviceMemory());

    const auto backward = makeBackwardProblem();
    EXPECT_EQ(backward.getN(), 256U);
    EXPECT_EQ(backward.getD(), 256U);
    EXPECT_EQ(backward.getV(), 256U);
    EXPECT_EQ(backward.getMainGradType(), FTRAIN_NUMERIC_TYPE_BF16);
    EXPECT_EQ(backward.getMainGradMode(), FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_ACCUMULATE);
    EXPECT_EQ(backward.getDWeightRows(), 256U);
    EXPECT_EQ(backward.getDWeightCols(), 256U);
}

}  // namespace
}  // namespace ftrain
