// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#ifndef FTRAIN_FLASH_TRAIN_H_
#define FTRAIN_FLASH_TRAIN_H_

#include <flash_train/common.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Executes one GEMM with the recommended Primitive.
 *
 * Convenience wrapper over the staged API: it binds the six Tensor ports
 * and the Gemm attributes internally, creates the Plan through the
 * library's selection cache, and executes primitive 0 -- the recommended
 * default -- on stream. It is equivalent to building one Gemm Pattern,
 * creating Ops, filling Args, creating a Plan, and executing its first
 * Primitive.
 *
 * All staged-API rules apply unchanged: a, b, c, and d are rank-two device
 * Tensors with consistent shapes (c's memory may be null, which drops the
 * beta * c term); alpha and beta are host scalar Tensors; execution is
 * asynchronous on stream, and the referenced memory and workspace must
 * stay valid until the enqueued work completes. The workspace must be at
 * least the recommended Primitive's requirement -- null and zero are
 * accepted when it requires none.
 *
 * @param a Device m-by-k input Tensor.
 * @param b Device k-by-n input Tensor.
 * @param c Device m-by-n input Tensor; its memory may be null.
 * @param d Device m-by-n output Tensor.
 * @param alpha Host scalar Tensor scaling a @ b.
 * @param beta Host scalar Tensor scaling c.
 * @param compute_type Numeric type used for computation.
 * @param workspace Workspace address.
 * @param workspace_bytes Size of workspace in bytes.
 * @param stream Stream used for execution.
 * @return FTRAIN_STATUS_INVALID_ARGUMENT when a parameter is inconsistent
 * or the workspace is insufficient; FTRAIN_STATUS_UNSUPPORTED when no
 * implementation satisfies the parameters; otherwise, the status of the
 * operation.
 */
FTRAIN_API FTrainStatus ftrainGemm(FTrainStorageView a, FTrainStorageView b, FTrainStorageView c, FTrainStorageView d,
                                   FTrainStorageView alpha, FTrainStorageView beta, FTrainNumericType compute_type,
                                   void* workspace, uint64_t workspace_bytes, FTrainStream stream);

/** mRoPE uses contiguous, 16-byte-aligned, non-overlapping device ports.
 * Source/output are matching positive SBHD tensors (D <= 1024), BF16/FP16/FP32;
 * raw_freqs is FP32 [3,B,S,R/2], 0 < R <= D. Sections are non-negative and sum
 * to R/2; interleaved sections must be [(half+2)/3,(half+1)/3,half/3].
 * fp32_compute=false rounds intermediates to activation dtype; true rounds
 * only the output. The caller owns all buffers and selects their current HIP
 * device. Zero workspace is required. Execution is asynchronous on stream.
 * No parameter main_grad, frequency gradient or accumulation is performed.
 * Malformed shapes/sections return INVALID_ARGUMENT, index/storage overflow
 * returns OVERFLOW, and unsupported dtype/layout/alignment/alias/device returns
 * UNSUPPORTED. Device enqueue failures return INTERNAL_ERROR.
 */
FTRAIN_API FTrainStatus ftrainMropeForward(FTrainStorageView input, FTrainStorageView raw_freqs,
                                           FTrainStorageView output, const int64_t section[3], bool interleaved_mrope,
                                           bool fp32_compute, void* workspace, uint64_t workspace_bytes,
                                           FTrainStream stream);
FTRAIN_API FTrainStatus ftrainMropeBackward(FTrainStorageView grad_output, FTrainStorageView raw_freqs,
                                            FTrainStorageView grad_input, const int64_t section[3],
                                            bool interleaved_mrope, bool fp32_compute, void* workspace,
                                            uint64_t workspace_bytes, FTrainStream stream);

#ifdef __cplusplus
}
#endif

#endif
