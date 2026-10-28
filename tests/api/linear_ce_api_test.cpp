// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <vector>

#include <hip/hip_runtime.h>
#include <gtest/gtest.h>

#include "flash_train/common.h"

namespace {

FTrainStorageView makeView(void* memory, const std::int64_t* dims, std::uint8_t rank, FTrainNumericType type) {
    return FTrainStorageView{memory, dims, nullptr, rank, type, FTRAIN_INDEX_TYPE_CONTINUOUS, false};
}

std::uint16_t floatToBf16(float value) {
    std::uint32_t bits = 0;
    std::memcpy(&bits, &value, sizeof(bits));
    bits += 0x7fffU + ((bits >> 16) & 1U);
    return static_cast<std::uint16_t>(bits >> 16);
}

float bf16ToFloat(std::uint16_t value) {
    const std::uint32_t bits = static_cast<std::uint32_t>(value) << 16;
    float result = 0.0F;
    std::memcpy(&result, &bits, sizeof(result));
    return result;
}

TEST(LinearCEApiTest, RegistersForwardPartialsPatternAndFailsClosedWhenArtifactIsUnavailable) {
    FTrainPattern pattern = nullptr;
    ASSERT_EQ(ftrainPatternCreate(&pattern), FTRAIN_STATUS_SUCCESS);

    FTrainTensorId hidden{};
    FTrainTensorId weight{};
    FTrainTensorId labels{};
    FTrainTensorId lse_local{};
    FTrainTensorId target_logit_local{};
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &hidden), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &weight), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &labels), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &lse_local), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &target_logit_local), FTRAIN_STATUS_SUCCESS);

    FTrainLinearCEForwardPartialsOpId op{};
    ASSERT_EQ(ftrainPatternAddLinearCEForwardPartials(pattern, &op, hidden, weight, labels, lse_local,
                                                      target_logit_local),
              FTRAIN_STATUS_SUCCESS);

    FTrainOps ops = nullptr;
    ASSERT_EQ(ftrainOpsCreate(&ops, pattern), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternDestroy(pattern), FTRAIN_STATUS_SUCCESS);

    FTrainArgs args = nullptr;
    ASSERT_EQ(ftrainArgsCreate(&args, ops), FTRAIN_STATUS_SUCCESS);

    std::uint16_t hidden_memory[8]{};
    std::uint16_t weight_memory[16]{};
    std::int64_t labels_memory[4]{};
    float lse_memory[4]{};
    float target_memory[4]{};
    const std::int64_t hidden_dims[]{4, 2};
    const std::int64_t weight_dims[]{8, 2};
    const std::int64_t vector_dims[]{4};

    ASSERT_EQ(ftrainArgsSetTensor(args, hidden, makeView(hidden_memory, hidden_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, weight, makeView(weight_memory, weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, labels, makeView(labels_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, lse_local, makeView(lse_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, target_logit_local,
                                  makeView(target_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetLinearCEForwardPartials(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                                   FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100, 0,
                                                   FTRAIN_LINEAR_CE_REDUCTION_MEAN),
              FTRAIN_STATUS_SUCCESS);

    FTrainPlan plan = nullptr;
    EXPECT_EQ(ftrainPlanCreate(&plan, args), FTRAIN_STATUS_UNSUPPORTED);
    EXPECT_EQ(plan, nullptr);
    EXPECT_NE(ftrainGetLastMessage(), nullptr);

    ASSERT_EQ(ftrainArgsDestroy(args), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainOpsDestroy(ops), FTRAIN_STATUS_SUCCESS);
}

TEST(LinearCEApiTest, RejectsInvalidReductionBeforeArgsMutation) {
    FTrainArgs args = nullptr;
    EXPECT_EQ(ftrainArgsSetLinearCEForwardPartials(
                  args, FTrainLinearCEForwardPartialsOpId{0}, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                  FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100, 0, FTRAIN_LINEAR_CE_REDUCTION_INVALID),
              FTRAIN_STATUS_INVALID_ARGUMENT);
}

TEST(LinearCEApiTest, ExecutesForwardPartialsAssemblyWhenArtifactIsConfigured) {
    const char* artifact = std::getenv("FTRAIN_LINEAR_CE_FORWARD_CODE_OBJECT");
    if (artifact == nullptr || *artifact == '\0') {
        GTEST_SKIP() << "FTRAIN_LINEAR_CE_FORWARD_CODE_OBJECT is not configured";
    }

    // The checked-in legacy artifact is an exact-shape kernel. Keep this
    // smoke test aligned with the available n1024_d4096_v32000 artifact.
    constexpr std::int64_t n = 1024;
    constexpr std::int64_t d = 4096;
    constexpr std::int64_t v = 32000;
    std::uint16_t* hidden_memory = nullptr;
    std::uint16_t* weight_memory = nullptr;
    std::int64_t* labels_memory = nullptr;
    float* lse_memory = nullptr;
    float* target_memory = nullptr;
    void* workspace = nullptr;
    hipStream_t stream = nullptr;
    ASSERT_EQ(hipMalloc(&hidden_memory, n * d * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&weight_memory, v * d * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&labels_memory, n * sizeof(std::int64_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&lse_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&target_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMemset(hidden_memory, 0, n * d * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMemset(weight_memory, 0, v * d * sizeof(std::uint16_t)), hipSuccess);
    const std::int64_t labels_host[n]{};
    ASSERT_EQ(hipMemcpy(labels_memory, labels_host, n * sizeof(std::int64_t), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipStreamCreate(&stream), hipSuccess);

    FTrainPattern pattern = nullptr;
    ASSERT_EQ(ftrainPatternCreate(&pattern), FTRAIN_STATUS_SUCCESS);
    FTrainTensorId hidden{};
    FTrainTensorId weight{};
    FTrainTensorId labels{};
    FTrainTensorId lse_local{};
    FTrainTensorId target_logit_local{};
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &hidden), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &weight), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &labels), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &lse_local), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &target_logit_local), FTRAIN_STATUS_SUCCESS);
    FTrainLinearCEForwardPartialsOpId op{};
    ASSERT_EQ(ftrainPatternAddLinearCEForwardPartials(pattern, &op, hidden, weight, labels, lse_local,
                                                      target_logit_local),
              FTRAIN_STATUS_SUCCESS);
    FTrainOps ops = nullptr;
    ASSERT_EQ(ftrainOpsCreate(&ops, pattern), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternDestroy(pattern), FTRAIN_STATUS_SUCCESS);
    FTrainArgs args = nullptr;
    ASSERT_EQ(ftrainArgsCreate(&args, ops), FTRAIN_STATUS_SUCCESS);
    const std::int64_t hidden_dims[]{n, d};
    const std::int64_t weight_dims[]{v, d};
    const std::int64_t vector_dims[]{n};
    const auto device_view = [](void* memory, const std::int64_t* dims, std::uint8_t rank, FTrainNumericType type) {
        return FTrainStorageView{memory, dims, nullptr, rank, type, FTRAIN_INDEX_TYPE_CONTINUOUS, false};
    };
    ASSERT_EQ(ftrainArgsSetTensor(args, hidden, device_view(hidden_memory, hidden_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, weight, device_view(weight_memory, weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, labels, device_view(labels_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, lse_local, device_view(lse_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, target_logit_local,
                                  device_view(target_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetLinearCEForwardPartials(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                                   FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100, 0,
                                                   FTRAIN_LINEAR_CE_REDUCTION_MEAN),
              FTRAIN_STATUS_SUCCESS);

    FTrainPlan plan = nullptr;
    ASSERT_EQ(ftrainPlanCreate(&plan, args), FTRAIN_STATUS_SUCCESS) << ftrainGetLastMessage();
    const char* primitive_name = nullptr;
    ASSERT_EQ(ftrainPlanGetPrimitiveName(plan, 0, &primitive_name), FTRAIN_STATUS_SUCCESS);
    EXPECT_STREQ(primitive_name, "LinearCEForwardPartialsAssembly");
    std::uint64_t workspace_bytes = 0;
    ASSERT_EQ(ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &workspace_bytes), FTRAIN_STATUS_SUCCESS);
    ASSERT_GT(workspace_bytes, 0U);
    ASSERT_EQ(hipMalloc(&workspace, workspace_bytes), hipSuccess);
    ASSERT_EQ(ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes, stream), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipStreamSynchronize(stream), hipSuccess);

    std::vector<float> lse_host(n);
    std::vector<float> target_host(n);
    ASSERT_EQ(hipMemcpy(lse_host.data(), lse_memory, n * sizeof(float), hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(target_host.data(), target_memory, n * sizeof(float), hipMemcpyDeviceToHost), hipSuccess);
    for (std::int64_t index = 0; index < n; ++index) {
        EXPECT_NEAR(lse_host[index], std::log(static_cast<float>(v)), 1.0e-3F);
        EXPECT_NEAR(target_host[index], 0.0F, 1.0e-6F);
    }

    ASSERT_EQ(ftrainPlanDestroy(plan), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsDestroy(args), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainOpsDestroy(ops), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipFree(workspace), hipSuccess);
    ASSERT_EQ(hipStreamDestroy(stream), hipSuccess);
    ASSERT_EQ(hipFree(target_memory), hipSuccess);
    ASSERT_EQ(hipFree(lse_memory), hipSuccess);
    ASSERT_EQ(hipFree(labels_memory), hipSuccess);
    ASSERT_EQ(hipFree(weight_memory), hipSuccess);
    ASSERT_EQ(hipFree(hidden_memory), hipSuccess);
}

TEST(LinearCEApiTest, ExecutesForwardFinalizeHip) {
    constexpr std::int64_t n = 1024;
    const std::int64_t vector_dims[]{n};
    const std::int64_t* scalar_dims = nullptr;
    std::vector<float> lse_host(n);
    std::vector<float> target_host(n);
    std::vector<std::int64_t> labels_host(n);
    std::int64_t valid_count = 0;
    float expected_loss = 0.0F;
    for (std::int64_t index = 0; index < n; ++index) {
        lse_host[index] = 2.0F + static_cast<float>(index % 17) * 0.25F;
        target_host[index] = 0.5F + static_cast<float>(index % 7) * 0.125F;
        labels_host[index] = index % 11 == 0 ? -100 : 0;
        if (labels_host[index] != -100) {
            expected_loss += lse_host[index] - target_host[index];
            ++valid_count;
        }
    }
    expected_loss /= static_cast<float>(valid_count);

    float* lse_memory = nullptr;
    float* target_memory = nullptr;
    std::int64_t* labels_memory = nullptr;
    float* loss_memory = nullptr;
    float* maximum_memory = nullptr;
    float* saved_lse_memory = nullptr;
    std::int64_t* count_memory = nullptr;
    void* workspace = nullptr;
    hipStream_t stream = nullptr;
    ASSERT_EQ(hipMalloc(&lse_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&target_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&labels_memory, n * sizeof(std::int64_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&loss_memory, sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&maximum_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&saved_lse_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&count_memory, sizeof(std::int64_t)), hipSuccess);
    ASSERT_EQ(hipMemcpy(lse_memory, lse_host.data(), n * sizeof(float), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemcpy(target_memory, target_host.data(), n * sizeof(float), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemcpy(labels_memory, labels_host.data(), n * sizeof(std::int64_t), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipStreamCreate(&stream), hipSuccess);

    FTrainPattern pattern = nullptr;
    ASSERT_EQ(ftrainPatternCreate(&pattern), FTRAIN_STATUS_SUCCESS);
    FTrainTensorId lse{};
    FTrainTensorId target_logit{};
    FTrainTensorId labels{};
    FTrainTensorId loss{};
    FTrainTensorId maximum{};
    FTrainTensorId saved_lse{};
    FTrainTensorId num_valid_tokens{};
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &lse), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &target_logit), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &labels), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &loss), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &maximum), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &saved_lse), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &num_valid_tokens), FTRAIN_STATUS_SUCCESS);
    FTrainLinearCEForwardFinalizeOpId op{};
    ASSERT_EQ(ftrainPatternAddLinearCEForwardFinalize(pattern, &op, lse, target_logit, labels, loss, maximum, saved_lse,
                                                      num_valid_tokens),
              FTRAIN_STATUS_SUCCESS);
    FTrainOps ops = nullptr;
    ASSERT_EQ(ftrainOpsCreate(&ops, pattern), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternDestroy(pattern), FTRAIN_STATUS_SUCCESS);
    FTrainArgs args = nullptr;
    ASSERT_EQ(ftrainArgsCreate(&args, ops), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, lse, makeView(lse_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, target_logit, makeView(target_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, labels, makeView(labels_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, loss, makeView(loss_memory, scalar_dims, 0, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, maximum, makeView(maximum_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, saved_lse, makeView(saved_lse_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, num_valid_tokens,
                                  makeView(count_memory, scalar_dims, 0, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetLinearCEForwardFinalize(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                                   FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100,
                                                   FTRAIN_LINEAR_CE_REDUCTION_MEAN),
              FTRAIN_STATUS_SUCCESS);

    FTrainPlan plan = nullptr;
    ASSERT_EQ(ftrainPlanCreate(&plan, args), FTRAIN_STATUS_SUCCESS) << ftrainGetLastMessage();
    std::uint64_t workspace_bytes = 0;
    ASSERT_EQ(ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &workspace_bytes), FTRAIN_STATUS_SUCCESS);
    ASSERT_GT(workspace_bytes, 0U);
    ASSERT_EQ(hipMalloc(&workspace, workspace_bytes), hipSuccess);
    ASSERT_EQ(ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes, stream), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipStreamSynchronize(stream), hipSuccess);

    float loss_result = 0.0F;
    std::int64_t count_result = 0;
    std::vector<float> maximum_result(n);
    std::vector<float> saved_lse_result(n);
    ASSERT_EQ(hipMemcpy(&loss_result, loss_memory, sizeof(float), hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(&count_result, count_memory, sizeof(std::int64_t), hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(maximum_result.data(), maximum_memory, n * sizeof(float), hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(saved_lse_result.data(), saved_lse_memory, n * sizeof(float), hipMemcpyDeviceToHost),
              hipSuccess);
    EXPECT_NEAR(loss_result, expected_loss, 1.0e-6F);
    EXPECT_EQ(count_result, valid_count);
    for (std::int64_t index = 0; index < n; ++index) {
        EXPECT_FLOAT_EQ(saved_lse_result[index], lse_host[index]);
        EXPECT_FLOAT_EQ(maximum_result[index], 0.0F);
    }

    ASSERT_EQ(ftrainPlanDestroy(plan), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsDestroy(args), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainOpsDestroy(ops), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipFree(workspace), hipSuccess);
    ASSERT_EQ(hipStreamDestroy(stream), hipSuccess);
    ASSERT_EQ(hipFree(count_memory), hipSuccess);
    ASSERT_EQ(hipFree(saved_lse_memory), hipSuccess);
    ASSERT_EQ(hipFree(maximum_memory), hipSuccess);
    ASSERT_EQ(hipFree(loss_memory), hipSuccess);
    ASSERT_EQ(hipFree(labels_memory), hipSuccess);
    ASSERT_EQ(hipFree(target_memory), hipSuccess);
    ASSERT_EQ(hipFree(lse_memory), hipSuccess);
}

TEST(LinearCEApiTest, ExecutesBackwardRocblasAndAccumulatesMainGrad) {
    constexpr std::int64_t n = 4;
    constexpr std::int64_t d = 4;
    constexpr std::int64_t v = 5000;
    const std::int64_t matrix_hidden_dims[]{n, d};
    const std::int64_t matrix_weight_dims[]{v, d};
    const std::int64_t vector_dims[]{n};
    const std::int64_t* scalar_dims = nullptr;

    std::vector<std::uint16_t> hidden_host(n * d);
    std::vector<std::uint16_t> weight_host(v * d);
    for (std::int64_t index = 0; index < n * d; ++index) {
        hidden_host[index] = floatToBf16(0.10F + static_cast<float>(index % d) * 0.07F);
    }
    for (std::int64_t index = 0; index < v * d; ++index) {
        weight_host[index] = floatToBf16(-0.20F + static_cast<float>(index % d) * 0.05F +
                                         static_cast<float>(index / d) * 0.03F);
    }
    const std::int64_t labels_host[]{0, 4097, -100, 4999};
    const std::int64_t valid_count_host = 3;
    const float dloss_host = 1.25F;
    std::vector<float> saved_lse_host(n, 0.0F);
    for (std::int64_t token = 0; token < n; ++token) {
        float sum_exp = 0.0F;
        for (std::int64_t vocab = 0; vocab < v; ++vocab) {
            float logit = 0.0F;
            for (std::int64_t depth = 0; depth < d; ++depth) {
                logit += bf16ToFloat(hidden_host[token * d + depth]) *
                         bf16ToFloat(weight_host[vocab * d + depth]);
            }
            logit = bf16ToFloat(floatToBf16(logit));
            sum_exp += std::exp(logit);
        }
        saved_lse_host[token] = std::log(sum_exp);
    }

    std::uint16_t* hidden_memory = nullptr;
    std::uint16_t* weight_memory = nullptr;
    std::int64_t* labels_memory = nullptr;
    float* dloss_memory = nullptr;
    float* maximum_memory = nullptr;
    float* saved_lse_memory = nullptr;
    std::int64_t* count_memory = nullptr;
    std::uint16_t* main_grad_memory = nullptr;
    std::uint16_t* d_hidden_memory = nullptr;
    std::uint16_t* d_weight_memory = nullptr;
    hipStream_t stream = nullptr;
    ASSERT_EQ(hipMalloc(&hidden_memory, hidden_host.size() * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&weight_memory, weight_host.size() * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&labels_memory, n * sizeof(std::int64_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&dloss_memory, sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&maximum_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&saved_lse_memory, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMalloc(&count_memory, sizeof(std::int64_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&main_grad_memory, weight_host.size() * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&d_hidden_memory, hidden_host.size() * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMalloc(&d_weight_memory, weight_host.size() * sizeof(std::uint16_t)), hipSuccess);
    ASSERT_EQ(hipMemcpy(hidden_memory, hidden_host.data(), hidden_host.size() * sizeof(std::uint16_t),
                        hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemcpy(weight_memory, weight_host.data(), weight_host.size() * sizeof(std::uint16_t),
                        hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemcpy(labels_memory, labels_host, n * sizeof(std::int64_t), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemcpy(dloss_memory, &dloss_host, sizeof(float), hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipMemset(maximum_memory, 0, n * sizeof(float)), hipSuccess);
    ASSERT_EQ(hipMemcpy(saved_lse_memory, saved_lse_host.data(), n * sizeof(float), hipMemcpyHostToDevice),
              hipSuccess);
    ASSERT_EQ(hipMemcpy(count_memory, &valid_count_host, sizeof(std::int64_t), hipMemcpyHostToDevice), hipSuccess);
    std::vector<std::uint16_t> main_grad_host(weight_host.size(), floatToBf16(0.5F));
    ASSERT_EQ(hipMemcpy(main_grad_memory, main_grad_host.data(), main_grad_host.size() * sizeof(std::uint16_t),
                        hipMemcpyHostToDevice), hipSuccess);
    ASSERT_EQ(hipStreamCreate(&stream), hipSuccess);

    FTrainPattern pattern = nullptr;
    ASSERT_EQ(ftrainPatternCreate(&pattern), FTRAIN_STATUS_SUCCESS);
    FTrainTensorId dloss{}, hidden{}, weight{}, labels{}, maximum{}, saved_lse{}, num_valid_tokens{}, main_grad{},
        d_hidden{}, d_weight{};
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &dloss), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &hidden), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &weight), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &labels), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &maximum), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &saved_lse), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &num_valid_tokens), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &main_grad), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &d_hidden), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternAddTensor(pattern, &d_weight), FTRAIN_STATUS_SUCCESS);
    FTrainLinearCEBackwardOpId op{};
    ASSERT_EQ(ftrainPatternAddLinearCEBackward(pattern, &op, dloss, hidden, weight, labels, maximum, saved_lse,
                                               num_valid_tokens, main_grad, d_hidden, d_weight),
              FTRAIN_STATUS_SUCCESS);
    FTrainOps ops = nullptr;
    ASSERT_EQ(ftrainOpsCreate(&ops, pattern), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainPatternDestroy(pattern), FTRAIN_STATUS_SUCCESS);
    FTrainArgs args = nullptr;
    ASSERT_EQ(ftrainArgsCreate(&args, ops), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, dloss, makeView(dloss_memory, scalar_dims, 0, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, hidden, makeView(hidden_memory, matrix_hidden_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, weight, makeView(weight_memory, matrix_weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, labels, makeView(labels_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, maximum, makeView(maximum_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, saved_lse, makeView(saved_lse_memory, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, num_valid_tokens,
                                  makeView(count_memory, scalar_dims, 0, FTRAIN_NUMERIC_TYPE_INT64)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, main_grad,
                                  makeView(main_grad_memory, matrix_weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, d_hidden,
                                  makeView(d_hidden_memory, matrix_hidden_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetTensor(args, d_weight,
                                  makeView(d_weight_memory, matrix_weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16)),
              FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsSetLinearCEBackward(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                            FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32,
                                            FTRAIN_NUMERIC_TYPE_BF16, -100, 0, FTRAIN_LINEAR_CE_REDUCTION_MEAN,
                                            FTRAIN_LINEAR_CE_MAIN_GRAD_MODE_ACCUMULATE),
              FTRAIN_STATUS_SUCCESS);

    FTrainPlan plan = nullptr;
    ASSERT_EQ(ftrainPlanCreate(&plan, args), FTRAIN_STATUS_SUCCESS) << ftrainGetLastMessage();
    const char* primitive_name = nullptr;
    ASSERT_EQ(ftrainPlanGetPrimitiveName(plan, 0, &primitive_name), FTRAIN_STATUS_SUCCESS);
    EXPECT_STREQ(primitive_name, "LinearCEBackwardRocblas");
    std::uint64_t workspace_bytes = 0;
    ASSERT_EQ(ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &workspace_bytes), FTRAIN_STATUS_SUCCESS);
    void* workspace = nullptr;
    ASSERT_EQ(hipMalloc(&workspace, workspace_bytes), hipSuccess);
    ASSERT_EQ(ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes, stream), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipStreamSynchronize(stream), hipSuccess);

    std::vector<std::uint16_t> main_grad_result(main_grad_host.size());
    std::vector<std::uint16_t> d_hidden_result(hidden_host.size());
    std::vector<std::uint16_t> d_weight_result(weight_host.size());
    ASSERT_EQ(hipMemcpy(main_grad_result.data(), main_grad_memory, main_grad_result.size() * sizeof(std::uint16_t),
                        hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(d_hidden_result.data(), d_hidden_memory, d_hidden_result.size() * sizeof(std::uint16_t),
                        hipMemcpyDeviceToHost), hipSuccess);
    ASSERT_EQ(hipMemcpy(d_weight_result.data(), d_weight_memory, d_weight_result.size() * sizeof(std::uint16_t),
                        hipMemcpyDeviceToHost), hipSuccess);
    bool saw_nonzero_hidden = false;
    bool saw_nonzero_weight = false;
    for (std::size_t index = 0; index < d_hidden_result.size(); ++index) {
        saw_nonzero_hidden = saw_nonzero_hidden || std::abs(bf16ToFloat(d_hidden_result[index])) > 1.0e-5F;
    }
    for (std::size_t index = 0; index < d_weight_result.size(); ++index) {
        saw_nonzero_weight = saw_nonzero_weight || std::abs(bf16ToFloat(d_weight_result[index])) > 1.0e-5F;
        EXPECT_NEAR(bf16ToFloat(main_grad_result[index]),
                    bf16ToFloat(main_grad_host[index]) + bf16ToFloat(d_weight_result[index]), 0.02F);
    }
    EXPECT_TRUE(saw_nonzero_hidden);
    EXPECT_TRUE(saw_nonzero_weight);

    ASSERT_EQ(ftrainPlanDestroy(plan), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainArgsDestroy(args), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(ftrainOpsDestroy(ops), FTRAIN_STATUS_SUCCESS);
    ASSERT_EQ(hipFree(workspace), hipSuccess);
    ASSERT_EQ(hipStreamDestroy(stream), hipSuccess);
    ASSERT_EQ(hipFree(d_weight_memory), hipSuccess);
    ASSERT_EQ(hipFree(d_hidden_memory), hipSuccess);
    ASSERT_EQ(hipFree(main_grad_memory), hipSuccess);
    ASSERT_EQ(hipFree(count_memory), hipSuccess);
    ASSERT_EQ(hipFree(saved_lse_memory), hipSuccess);
    ASSERT_EQ(hipFree(maximum_memory), hipSuccess);
    ASSERT_EQ(hipFree(dloss_memory), hipSuccess);
    ASSERT_EQ(hipFree(labels_memory), hipSuccess);
    ASSERT_EQ(hipFree(weight_memory), hipSuccess);
    ASSERT_EQ(hipFree(hidden_memory), hipSuccess);
}

}  // namespace
