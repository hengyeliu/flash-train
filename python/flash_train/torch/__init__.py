# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

"""flash-train PyTorch bindings."""

import ctypes
import os

# The extension NEEDs libtorch.so, which only enters the process with torch.
import torch

# Wheels built with FTRAIN_BUILD_SHARED_LIBS=ON ship libflash_train.so in
# the package root; loading it by absolute path pins the bundled copy over
# anything on LD_LIBRARY_PATH. Static wheels ship no file and skip this.
_package_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
_native_library = os.path.join(_package_root, "libflash_train.so")
if os.path.exists(_native_library):
    ctypes.CDLL(_native_library)

try:
    from ._flash_train_torch import gemm, mrope as _mrope
except ModuleNotFoundError as exc:
    # This shell ships even in wheels built without the binding; a missing
    # extension module is a build problem, not a missing dependency.
    if exc.name != "flash_train.torch._flash_train_torch":
        raise
    raise RuntimeError(
        "this wheel was built without the torch binding; rebuild it with "
        "FTRAIN_BUILD_TORCH_BINDINGS=ON"
    ) from exc

from torch.autograd.function import once_differentiable


class _Mrope(torch.autograd.Function):
    @staticmethod
    def forward(ctx, input, raw_freqs, section, interleaved_mrope, fp32_compute):
        ctx.set_materialize_grads(False)
        ctx.save_for_backward(raw_freqs)
        ctx.section = tuple(section)
        ctx.interleaved_mrope = interleaved_mrope
        ctx.fp32_compute = fp32_compute
        return _mrope(input, raw_freqs, ctx.section, interleaved_mrope, fp32_compute, False)

    @staticmethod
    @once_differentiable
    def backward(ctx, grad_output):
        if grad_output is None:
            return None, None, None, None, None
        (raw_freqs,) = ctx.saved_tensors
        grad_input = _mrope(grad_output, raw_freqs, ctx.section,
                            ctx.interleaved_mrope, ctx.fp32_compute, True)
        return grad_input, None, None, None, None


def mrope(input, raw_freqs, section, interleaved_mrope=False, fp32_compute=False):
    """Apply split-half mRoPE to SBHD BF16/FP16/FP32 activations, out of place.

    raw_freqs is FP32 [3,B,S,R/2] without gradients. The three section sizes
    sum to R/2; interleaving requires balanced stride-three sections. Input
    and frequencies are made contiguous/aligned when needed. Tail values
    are copied exactly. Only first-order activation gradients are provided.
    TP/SP, parameter gradient accumulation and frequency generation belong
    to the caller. fp32_compute=False rounds intermediate arithmetic to the
    activation dtype; True computes in FP32 before the final cast.
    """
    return _Mrope.apply(input, raw_freqs, tuple(section), interleaved_mrope, fp32_compute)


def mrope_backward(grad_output, raw_freqs, section, interleaved_mrope=False, fp32_compute=False):
    """Return the mRoPE input gradient; this explicit inverse has no autograd graph."""
    return _mrope(grad_output, raw_freqs, tuple(section), interleaved_mrope, fp32_compute, True)


__all__ = ["gemm", "mrope", "mrope_backward"]
