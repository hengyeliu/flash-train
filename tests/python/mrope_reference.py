# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

"""Independent CPU oracle for user-defined test shapes; no FlashTrain internals."""
import torch

DTYPES = {'bf16': torch.bfloat16, 'fp16': torch.float16, 'fp32': torch.float32}
TOL = {torch.bfloat16: (.05, .02), torch.float16: (.01, .003), torch.float32: (1e-6, 1e-6)}


def frequencies(c):
    s, b, half = c['S'], c['B'], c['R']//2
    axis = torch.arange(3, dtype=torch.float64)[:, None, None, None]
    batch = torch.arange(b, dtype=torch.float64)[None, :, None, None]
    seq = torch.arange(s, dtype=torch.float64)[None, None, :, None]
    k = torch.arange(half, dtype=torch.float64)[None, None, None, :]
    pattern = c.get('frequency_pattern', 'position_times_inv_freq')
    if pattern == 'zero':
        value = torch.zeros(3, b, s, half)
    elif pattern == 'axis_tagged':
        value = .2*(axis+1)+.01*(batch+1)+.0005*(seq+1)+.00001*(k+1)
    elif pattern == 'axis_tagged_large_angle':
        magnitude = 4096*(axis+1)+64*(batch+1)+.25*(seq+1)+.001*(k+1)
        value = torch.where((axis+batch+seq+k)%2 != 0, -magnitude, magnitude)
    elif pattern == 'position_times_inv_freq':
        position = torch.where(axis == 0, seq, torch.where(axis == 1, seq%64, (seq//64)%64))
        value = position * c.get('rope_theta', 1000000)**(-2*k/c['R'])
        value = value.expand(3,b,s,half)
    else:
        generator = torch.Generator().manual_seed(20260815)
        value = torch.rand((3,b,s,half), generator=generator)*3-1.5
    return value.float().contiguous()


def reference(x, raw, section, interleaved=False, fp32_compute=False, inverse=False):
    half = raw.shape[-1]
    if interleaved:
        axes = torch.arange(half)%3
    else:
        axes = torch.repeat_interleave(torch.arange(3), torch.tensor(section))
    theta = raw[axes, :, :, torch.arange(half)].permute(2,1,0).unsqueeze(2).double()
    cosine, sine = theta.cos(), theta.sin()
    if inverse:
        sine = -sine
    lo, hi = x[..., :half], x[..., half:2*half]
    y = x.clone()
    if fp32_compute:
        y[..., :half] = (lo.double()*cosine-hi.double()*sine).to(x.dtype)
        y[..., half:2*half] = (hi.double()*cosine+lo.double()*sine).to(x.dtype)
    else:
        cosine, sine = cosine.to(x.dtype), sine.to(x.dtype)
        # Separate dtype-rounded products and addition/subtraction.
        y[..., :half] = lo*cosine-hi*sine
        y[..., half:2*half] = hi*cosine+lo*sine
    return y


def check_full(x, raw_cpu, y, c, inverse):
    """Exhaustive CPU FP64/rounded comparison bounded to a few MiB per chunk."""
    chunk = max(1, 2_000_000 // (c['B']*c['H']*c['D']))
    atol, rtol = TOL[x.dtype]
    for start in range(0,c['S'],chunk):
        stop=min(start+chunk,c['S'])
        source=x[start:stop].cpu()
        actual=y[start:stop].cpu()
        expected=reference(source,raw_cpu[:,:,start:stop],c['section'],c['interleaved'],
                           c['fp32_compute'],inverse)
        torch.testing.assert_close(actual,expected,atol=atol,rtol=rtol)
        assert torch.equal(actual[...,c['R']:],source[...,c['R']:]), 'tail changed'
