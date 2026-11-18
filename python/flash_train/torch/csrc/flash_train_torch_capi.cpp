// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <cstdint>
#include <string>

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

std::string callMrope(const void* input, const std::int64_t* dims, const void* freqs, const std::int64_t* freq_dims,
                      void* output, int dtype, const std::int64_t* section, bool interleaved, bool fp32_compute,
                      bool inverse, void* stream) {
    const FTrainNumericType type = dtype == 0   ? FTRAIN_NUMERIC_TYPE_FP32
                                   : dtype == 1 ? FTRAIN_NUMERIC_TYPE_FP16
                                                : FTRAIN_NUMERIC_TYPE_BF16;
    const FTrainStorageView source{const_cast<void*>(input),     dims, nullptr, 4, type,
                                   FTRAIN_INDEX_TYPE_CONTINUOUS, false};
    const FTrainStorageView raw{const_cast<void*>(freqs),     freq_dims, nullptr, 4, FTRAIN_NUMERIC_TYPE_FP32,
                                FTRAIN_INDEX_TYPE_CONTINUOUS, false};
    const FTrainStorageView destination{output, dims, nullptr, 4, type, FTRAIN_INDEX_TYPE_CONTINUOUS, false};
    const auto function = inverse ? ftrainMropeBackward : ftrainMropeForward;
    const auto status   = function(source, raw, destination, section, interleaved, fp32_compute, nullptr, 0,
                                   static_cast<FTrainStream>(stream));
    return status == FTRAIN_STATUS_SUCCESS ? std::string{} : std::string(ftrainGetLastMessage());
}

}  // namespace flash_train_torch
