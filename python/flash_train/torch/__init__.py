# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: MIT

"""flash-train PyTorch bindings."""

import ctypes
import os

# The extension NEEDs libtorch.so, which only enters the process with torch.
import torch

# HCU HIP registers embedded fatbins when libflash_train.so is loaded. Make
# PyTorch own the HIP runtime first; loading the fatbin before this point is
# unstable on the current HCU runtime.
if torch.cuda.is_available():
    torch.cuda.init()

# Wheels built with FTRAIN_BUILD_SHARED_LIBS=ON ship libflash_train.so in
# the package root; loading it by absolute path pins the bundled copy over
# anything on LD_LIBRARY_PATH. Static wheels ship no file and skip this.
_package_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
_native_library = os.path.join(_package_root, "libflash_train.so")
if os.path.exists(_native_library):
    ctypes.CDLL(_native_library)

try:
    from ._flash_train_torch import gemm
    from ._flash_train_torch import (
        linear_ce_backward,
        linear_ce_forward_finalize,
        linear_ce_forward_partials,
    )
except ModuleNotFoundError as exc:
    # This shell ships even in wheels built without the binding; a missing
    # extension module is a build problem, not a missing dependency.
    if exc.name != "flash_train.torch._flash_train_torch":
        raise
    raise RuntimeError(
        "this wheel was built without the torch binding; rebuild it with "
        "FTRAIN_BUILD_TORCH_BINDINGS=ON"
    ) from exc

__all__ = ["gemm", "linear_ce_forward_partials", "linear_ce_forward_finalize", "linear_ce_backward"]
