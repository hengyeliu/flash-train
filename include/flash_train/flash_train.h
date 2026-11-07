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

/** GDN forward. State views are [B,HV,K,V] fp32 when present, or rank-four
 * zero-element views when absent: any single dimension being zero is
 * sufficient to signal absence (the total element count is what is checked),
 * so the other three dimensions of an absent view carry no meaning and are
 * never read or validated -- callers may put any values there. No primitive
 * is registered in this skeleton; structurally valid arguments return
 * FTRAIN_STATUS_UNSUPPORTED. */
FTRAIN_API FTrainStatus ftrainGdnForward(FTrainStorageView q, FTrainStorageView k, FTrainStorageView v,
                                        FTrainStorageView g, FTrainStorageView beta, FTrainStorageView h0,
                                        FTrainStorageView out, FTrainStorageView ht, float scale, void* workspace,
                                        uint64_t workspace_bytes, FTrainStream stream);
/** GDN backward. h0, dht and dh0 follow the same external state layout. */
FTRAIN_API FTrainStatus ftrainGdnBackward(FTrainStorageView q, FTrainStorageView k, FTrainStorageView v,
                                         FTrainStorageView g, FTrainStorageView beta, FTrainStorageView do_,
                                         FTrainStorageView h0, FTrainStorageView dht, FTrainStorageView dq,
                                         FTrainStorageView dk, FTrainStorageView dv, FTrainStorageView dg,
                                         FTrainStorageView dbeta, FTrainStorageView dh0, float scale, void* workspace,
                                         uint64_t workspace_bytes, FTrainStream stream);
/** GDN2 forward, without state ports. The public chunk length is fixed to 64. */
FTRAIN_API FTrainStatus ftrainGdn2Forward(FTrainStorageView q, FTrainStorageView k, FTrainStorageView v,
                                         FTrainStorageView g, FTrainStorageView b, FTrainStorageView w,
                                         FTrainStorageView out, float scale, void* workspace,
                                         uint64_t workspace_bytes, FTrainStream stream);
/** GDN2 backward, without state ports. The public chunk length is fixed to 64. */
FTRAIN_API FTrainStatus ftrainGdn2Backward(FTrainStorageView q, FTrainStorageView k, FTrainStorageView v,
                                          FTrainStorageView g, FTrainStorageView b, FTrainStorageView w,
                                          FTrainStorageView do_, FTrainStorageView dq, FTrainStorageView dk,
                                          FTrainStorageView dv, FTrainStorageView dg, FTrainStorageView db,
                                          FTrainStorageView dw, float scale, void* workspace,
                                          uint64_t workspace_bytes, FTrainStream stream);

#ifdef __cplusplus
}
#endif

#endif
