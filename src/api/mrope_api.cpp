// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <array>
#include "flash_train/flash_train.h"
#include "flash_train/trace.hpp"
#include "flash_train/api.hpp"

extern "C" FTrainStatus ftrainPatternAddMropeForward(FTrainPattern pattern, FTrainMropeForwardOpId* op,
                                                     FTrainTensorId input, FTrainTensorId raw_freqs,
                                                     FTrainTensorId output) {
    return ftrain::invokeApi([&] {
        if (!pattern || !op) {
            throw ftrain::Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE pattern/op must not be null");
        }
        *op = pattern->builder.addOperation<ftrain::OperationKind::kMropeForward>(input, raw_freqs, output);
    });
}
extern "C" FTrainStatus ftrainArgsSetMropeForward(FTrainArgs args, FTrainMropeForwardOpId op, const int64_t section[3],
                                                  bool interleaved_mrope, bool fp32_compute) {
    return ftrain::invokeApi([&] {
        if (!args || !section) {
            throw ftrain::Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE args/section must not be null");
        }
        args->args.setOperation<ftrain::OperationKind::kMropeForward>(
            ftrain::PatternOperationId{op.opaque},
            ftrain::MropeAttributes({section[0], section[1], section[2]}, interleaved_mrope, fp32_compute));
    });
}
extern "C" FTrainStatus ftrainMropeForward(FTrainStorageView input, FTrainStorageView raw_freqs,
                                           FTrainStorageView output, const int64_t section[3], bool interleaved_mrope,
                                           bool fp32_compute, void* workspace, uint64_t workspace_bytes,
                                           FTrainStream stream) {
    ftrain::ScopedTraceRange trace{"ftrainMropeForward"};
    return ftrain::invokeApi([&] {
        struct Entry {
            FTrainOps ops = nullptr;
            FTrainTensorId source{}, freqs{}, destination{};
            FTrainMropeForwardOpId op{};
            Entry() {
                FTrainPattern p = nullptr;
                auto checked    = [](FTrainStatus status) {
                    if (status != FTRAIN_STATUS_SUCCESS) {
                        throw ftrain::Exception(status, "%s", ftrainGetLastMessage());
                    }
                };
                checked(ftrainPatternCreate(&p));
                try {
                    checked(ftrainPatternAddTensor(p, &source));
                    checked(ftrainPatternAddTensor(p, &freqs));
                    checked(ftrainPatternAddTensor(p, &destination));
                    checked(ftrainPatternAddMropeForward(p, &op, source, freqs, destination));
                    checked(ftrainOpsCreate(&ops, p));
                }
                catch (...) {
                    ftrainPatternDestroy(p);
                    throw;
                }
                ftrainPatternDestroy(p);
            }
        };
        static const Entry entry;
        FTrainArgs args = nullptr;
        FTrainPlan plan = nullptr;
        auto checked    = [](FTrainStatus status) {
            if (status != FTRAIN_STATUS_SUCCESS) { throw ftrain::Exception(status, "%s", ftrainGetLastMessage()); }
        };
        try {
            checked(ftrainArgsCreate(&args, entry.ops));
            checked(ftrainArgsSetTensor(args, entry.source, input));
            checked(ftrainArgsSetTensor(args, entry.freqs, raw_freqs));
            checked(ftrainArgsSetTensor(args, entry.destination, output));
            checked(ftrainArgsSetMropeForward(args, entry.op, section, interleaved_mrope, fp32_compute));
            checked(ftrainPlanCreate(&plan, args));
            checked(ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes, stream));
        }
        catch (...) {
            if (plan) { ftrainPlanDestroy(plan); }
            if (args) { ftrainArgsDestroy(args); }
            throw;
        }
        ftrainPlanDestroy(plan);
        ftrainArgsDestroy(args);
    });
}
extern "C" FTrainStatus ftrainPatternAddMropeBackward(FTrainPattern pattern, FTrainMropeBackwardOpId* op,
                                                      FTrainTensorId grad_output, FTrainTensorId raw_freqs,
                                                      FTrainTensorId grad_input) {
    return ftrain::invokeApi([&] {
        if (!pattern || !op) {
            throw ftrain::Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE pattern/op must not be null");
        }
        *op = pattern->builder.addOperation<ftrain::OperationKind::kMropeBackward>(grad_output, raw_freqs, grad_input);
    });
}
extern "C" FTrainStatus ftrainArgsSetMropeBackward(FTrainArgs args, FTrainMropeBackwardOpId op,
                                                   const int64_t section[3], bool interleaved_mrope,
                                                   bool fp32_compute) {
    return ftrain::invokeApi([&] {
        if (!args || !section) {
            throw ftrain::Exception(FTRAIN_STATUS_INVALID_ARGUMENT, "mRoPE args/section must not be null");
        }
        args->args.setOperation<ftrain::OperationKind::kMropeBackward>(
            ftrain::PatternOperationId{op.opaque},
            ftrain::MropeAttributes({section[0], section[1], section[2]}, interleaved_mrope, fp32_compute));
    });
}
extern "C" FTrainStatus ftrainMropeBackward(FTrainStorageView grad_output, FTrainStorageView raw_freqs,
                                            FTrainStorageView grad_input, const int64_t section[3],
                                            bool interleaved_mrope, bool fp32_compute, void* workspace,
                                            uint64_t workspace_bytes, FTrainStream stream) {
    ftrain::ScopedTraceRange trace{"ftrainMropeBackward"};
    return ftrain::invokeApi([&] {
        struct Entry {
            FTrainOps ops = nullptr;
            FTrainTensorId source{}, freqs{}, destination{};
            FTrainMropeBackwardOpId op{};
            Entry() {
                FTrainPattern p = nullptr;
                auto checked    = [](FTrainStatus status) {
                    if (status != FTRAIN_STATUS_SUCCESS) {
                        throw ftrain::Exception(status, "%s", ftrainGetLastMessage());
                    }
                };
                checked(ftrainPatternCreate(&p));
                try {
                    checked(ftrainPatternAddTensor(p, &source));
                    checked(ftrainPatternAddTensor(p, &freqs));
                    checked(ftrainPatternAddTensor(p, &destination));
                    checked(ftrainPatternAddMropeBackward(p, &op, source, freqs, destination));
                    checked(ftrainOpsCreate(&ops, p));
                }
                catch (...) {
                    ftrainPatternDestroy(p);
                    throw;
                }
                ftrainPatternDestroy(p);
            }
        };
        static const Entry entry;
        FTrainArgs args = nullptr;
        FTrainPlan plan = nullptr;
        auto checked    = [](FTrainStatus status) {
            if (status != FTRAIN_STATUS_SUCCESS) { throw ftrain::Exception(status, "%s", ftrainGetLastMessage()); }
        };
        try {
            checked(ftrainArgsCreate(&args, entry.ops));
            checked(ftrainArgsSetTensor(args, entry.source, grad_output));
            checked(ftrainArgsSetTensor(args, entry.freqs, raw_freqs));
            checked(ftrainArgsSetTensor(args, entry.destination, grad_input));
            checked(ftrainArgsSetMropeBackward(args, entry.op, section, interleaved_mrope, fp32_compute));
            checked(ftrainPlanCreate(&plan, args));
            checked(ftrainPlanExecutePrimitive(plan, 0, workspace, workspace_bytes, stream));
        }
        catch (...) {
            if (plan) { ftrainPlanDestroy(plan); }
            if (args) { ftrainArgsDestroy(args); }
            throw;
        }
        ftrainPlanDestroy(plan);
        ftrainArgsDestroy(args);
    });
}
