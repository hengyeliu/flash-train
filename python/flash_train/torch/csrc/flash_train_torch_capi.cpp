// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <cstdint>

#include <flash_train/flash_train.h>

namespace flash_train_torch {
namespace {

FTrainStorageView makeDeviceMatrixView(const void* memory, const std::int64_t* dims) {
    return FTrainStorageView{const_cast<void*>(memory),    dims, nullptr, 2, FTRAIN_NUMERIC_TYPE_FP32,
                             FTRAIN_INDEX_TYPE_CONTINUOUS, false};
}

FTrainStorageView makeHostScalarView(const void* value) {
    return FTrainStorageView{const_cast<void*>(value),     nullptr, nullptr, 0, FTRAIN_NUMERIC_TYPE_FP32,
                             FTRAIN_INDEX_TYPE_CONTINUOUS, true};
}

}  // namespace

// The HIP-flavored half of the binding: builds StorageViews from plain
// pointers and calls the staged C API. See flash_train_torch.cpp for why the
// two worlds stay in separate translation units.
unsigned char callFp32Gemm(const void* a, const std::int64_t* a_dims, const void* b, const std::int64_t* b_dims,
                           const void* c, const std::int64_t* c_dims, void* d, const std::int64_t* d_dims,
                           const void* alpha, const void* beta, void* stream) {
    return static_cast<unsigned char>(
        ftrainGemm(makeDeviceMatrixView(a, a_dims), makeDeviceMatrixView(b, b_dims), makeDeviceMatrixView(c, c_dims),
                   makeDeviceMatrixView(d, d_dims), makeHostScalarView(alpha), makeHostScalarView(beta),
                   FTRAIN_NUMERIC_TYPE_FP32, nullptr, 0, static_cast<FTrainStream>(stream)));
}

FTrainStorageView makeDeviceView(void* memory, const std::int64_t* dims, std::uint8_t rank, FTrainNumericType type) {
    return FTrainStorageView{memory, dims, nullptr, rank, type, FTRAIN_INDEX_TYPE_CONTINUOUS, false};
}

FTrainStatus cleanup(FTrainStatus status, FTrainPlan plan, FTrainArgs args, FTrainOps ops, FTrainPattern pattern) {
    if (plan != nullptr) { (void)ftrainPlanDestroy(plan); }
    if (args != nullptr) { (void)ftrainArgsDestroy(args); }
    if (ops != nullptr) { (void)ftrainOpsDestroy(ops); }
    if (pattern != nullptr) { (void)ftrainPatternDestroy(pattern); }
    return status;
}

unsigned char callLinearCEForwardPartials(const void* hidden, const void* weight, const void* labels, void* lse_local,
                                          void* target_logit_local, std::uint64_t n, std::uint64_t d,
                                          std::uint64_t v, std::uint64_t shard_vocab_start, void* workspace,
                                          std::uint64_t workspace_bytes, void* stream) {
    const std::int64_t matrix_hidden_dims[]{static_cast<std::int64_t>(n), static_cast<std::int64_t>(d)};
    const std::int64_t matrix_weight_dims[]{static_cast<std::int64_t>(v), static_cast<std::int64_t>(d)};
    const std::int64_t vector_dims[]{static_cast<std::int64_t>(n)};
    FTrainPattern pattern = nullptr;
    FTrainOps ops = nullptr;
    FTrainArgs args = nullptr;
    FTrainPlan plan = nullptr;
    FTrainTensorId hidden_id{}, weight_id{}, labels_id{}, lse_id{}, target_id{};
    FTrainLinearCEForwardPartialsOpId op{};
    FTrainStatus status = ftrainPatternCreate(&pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &hidden_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &weight_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &labels_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &lse_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &target_id);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainPatternAddLinearCEForwardPartials(pattern, &op, hidden_id, weight_id, labels_id, lse_id,
                                                         target_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainOpsCreate(&ops, pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainArgsCreate(&args, ops);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, hidden_id,
                                     makeDeviceView(const_cast<void*>(hidden), matrix_hidden_dims, 2,
                                                    FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, weight_id,
                                     makeDeviceView(const_cast<void*>(weight), matrix_weight_dims, 2,
                                                    FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, labels_id,
                                     makeDeviceView(const_cast<void*>(labels), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_INT64));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, lse_id,
                                     makeDeviceView(lse_local, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, target_id,
                                     makeDeviceView(target_logit_local, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetLinearCEForwardPartials(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                                      FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100,
                                                      shard_vocab_start, FTRAIN_LINEAR_CE_REDUCTION_MEAN);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPlanCreate(&plan, args);
    if (status == FTRAIN_STATUS_SUCCESS) {
        std::uint64_t required = 0;
        status = ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &required);
        if (status == FTRAIN_STATUS_SUCCESS && workspace_bytes < required) status = FTRAIN_STATUS_INVALID_ARGUMENT;
        if (status == FTRAIN_STATUS_SUCCESS)
            status = ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes,
                                                static_cast<FTrainStream>(stream));
    }
    return static_cast<unsigned char>(cleanup(status, plan, args, ops, pattern));
}

unsigned char callLinearCEForwardFinalize(const void* lse, const void* target_logit, const void* labels, void* loss,
                                          void* maximum, void* saved_lse, void* num_valid_tokens, std::uint64_t n,
                                          void* workspace, std::uint64_t workspace_bytes, void* stream) {
    const std::int64_t vector_dims[]{static_cast<std::int64_t>(n)};
    FTrainPattern pattern = nullptr;
    FTrainOps ops = nullptr;
    FTrainArgs args = nullptr;
    FTrainPlan plan = nullptr;
    FTrainTensorId lse_id{}, target_id{}, labels_id{}, loss_id{}, maximum_id{}, saved_id{}, count_id{};
    FTrainLinearCEForwardFinalizeOpId op{};
    FTrainStatus status = ftrainPatternCreate(&pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &lse_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &target_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &labels_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &loss_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &maximum_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &saved_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &count_id);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainPatternAddLinearCEForwardFinalize(pattern, &op, lse_id, target_id, labels_id, loss_id,
                                                         maximum_id, saved_id, count_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainOpsCreate(&ops, pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainArgsCreate(&args, ops);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, lse_id,
                                     makeDeviceView(const_cast<void*>(lse), vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, target_id,
                                     makeDeviceView(const_cast<void*>(target_logit), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, labels_id,
                                     makeDeviceView(const_cast<void*>(labels), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_INT64));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, loss_id,
                                     makeDeviceView(loss, nullptr, 0, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, maximum_id,
                                     makeDeviceView(maximum, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, saved_id,
                                     makeDeviceView(saved_lse, vector_dims, 1, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, count_id,
                                     makeDeviceView(num_valid_tokens, nullptr, 0, FTRAIN_NUMERIC_TYPE_INT64));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetLinearCEForwardFinalize(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                                      FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, -100,
                                                      FTRAIN_LINEAR_CE_REDUCTION_MEAN);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPlanCreate(&plan, args);
    if (status == FTRAIN_STATUS_SUCCESS) {
        std::uint64_t required = 0;
        status = ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &required);
        if (status == FTRAIN_STATUS_SUCCESS && workspace_bytes < required) status = FTRAIN_STATUS_INVALID_ARGUMENT;
        if (status == FTRAIN_STATUS_SUCCESS)
            status = ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes,
                                                static_cast<FTrainStream>(stream));
    }
    return static_cast<unsigned char>(cleanup(status, plan, args, ops, pattern));
}

unsigned char callLinearCEBackward(const void* dloss, const void* hidden, const void* weight, const void* labels,
                                   const void* maximum, const void* saved_lse, const void* num_valid_tokens,
                                   void* main_grad, void* d_hidden, void* d_weight, std::uint64_t n, std::uint64_t d,
                                   std::uint64_t v, std::uint64_t shard_vocab_start, unsigned char main_grad_type,
                                   unsigned char main_grad_mode, void* workspace, std::uint64_t workspace_bytes,
                                   void* stream) {
    const std::int64_t matrix_hidden_dims[]{static_cast<std::int64_t>(n), static_cast<std::int64_t>(d)};
    const std::int64_t matrix_weight_dims[]{static_cast<std::int64_t>(v), static_cast<std::int64_t>(d)};
    const std::int64_t vector_dims[]{static_cast<std::int64_t>(n)};
    FTrainPattern pattern = nullptr;
    FTrainOps ops = nullptr;
    FTrainArgs args = nullptr;
    FTrainPlan plan = nullptr;
    FTrainTensorId dloss_id{}, hidden_id{}, weight_id{}, labels_id{}, maximum_id{}, saved_id{}, count_id{}, main_id{},
        d_hidden_id{}, d_weight_id{};
    FTrainLinearCEBackwardOpId op{};
    FTrainStatus status = ftrainPatternCreate(&pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &dloss_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &hidden_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &weight_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &labels_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &maximum_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &saved_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &count_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &main_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &d_hidden_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPatternAddTensor(pattern, &d_weight_id);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainPatternAddLinearCEBackward(pattern, &op, dloss_id, hidden_id, weight_id, labels_id,
                                                  maximum_id, saved_id, count_id, main_id, d_hidden_id, d_weight_id);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainOpsCreate(&ops, pattern);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainArgsCreate(&args, ops);
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, dloss_id,
                                     makeDeviceView(const_cast<void*>(dloss), nullptr, 0, FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, hidden_id,
                                     makeDeviceView(const_cast<void*>(hidden), matrix_hidden_dims, 2,
                                                    FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, weight_id,
                                     makeDeviceView(const_cast<void*>(weight), matrix_weight_dims, 2,
                                                    FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, labels_id,
                                     makeDeviceView(const_cast<void*>(labels), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_INT64));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, maximum_id,
                                     makeDeviceView(const_cast<void*>(maximum), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, saved_id,
                                     makeDeviceView(const_cast<void*>(saved_lse), vector_dims, 1,
                                                    FTRAIN_NUMERIC_TYPE_FP32));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, count_id,
                                     makeDeviceView(const_cast<void*>(num_valid_tokens), nullptr, 0,
                                                    FTRAIN_NUMERIC_TYPE_INT64));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, main_id,
                                     makeDeviceView(main_grad, matrix_weight_dims, 2, main_grad_type));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, d_hidden_id,
                                     makeDeviceView(d_hidden, matrix_hidden_dims, 2, FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetTensor(args, d_weight_id,
                                     makeDeviceView(d_weight, matrix_weight_dims, 2, FTRAIN_NUMERIC_TYPE_BF16));
    if (status == FTRAIN_STATUS_SUCCESS)
        status = ftrainArgsSetLinearCEBackward(args, op, FTRAIN_NUMERIC_TYPE_BF16, FTRAIN_NUMERIC_TYPE_BF16,
                                               FTRAIN_NUMERIC_TYPE_INT64, FTRAIN_NUMERIC_TYPE_FP32, main_grad_type,
                                               -100, shard_vocab_start, FTRAIN_LINEAR_CE_REDUCTION_MEAN,
                                               main_grad_mode);
    if (status == FTRAIN_STATUS_SUCCESS) status = ftrainPlanCreate(&plan, args);
    if (status == FTRAIN_STATUS_SUCCESS) {
        std::uint64_t required = 0;
        status = ftrainPlanGetPrimitiveRequiredWorkspaceBytes(plan, 0, &required);
        if (status == FTRAIN_STATUS_SUCCESS && workspace_bytes < required) status = FTRAIN_STATUS_INVALID_ARGUMENT;
        if (status == FTRAIN_STATUS_SUCCESS)
            status = ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes,
                                                static_cast<FTrainStream>(stream));
    }
    return static_cast<unsigned char>(cleanup(status, plan, args, ops, pattern));
}

}  // namespace flash_train_torch
