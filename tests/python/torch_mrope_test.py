# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

"""User-defined shapes, public C API, and PyTorch first-order integration checks."""
import ctypes as C
import math
import pytest
import torch
from torch.utils.checkpoint import checkpoint
from flash_train.torch import mrope, mrope_backward
from mrope_reference import DTYPES, frequencies, reference, check_full
from mrope_capi import Plan, direct, lib, view

torch.set_num_threads(8)
pytestmark=pytest.mark.skipif(not torch.cuda.is_available(),reason='no visible HCU')


def guarded(shape,dtype):
    n=math.prod(shape); pad=16//torch.tensor([],dtype=dtype).element_size()
    storage=torch.full((n+2*pad,),37,device='cuda',dtype=dtype)
    return storage[pad:pad+n].view(shape),storage,pad


# Edit or extend these shapes for the inputs you want to test.
SHAPES=[
    pytest.param(dict(S=7,B=2,H=3,D=20,R=16,section=[3,2,3],interleaved=False),id='section_tail'),
    pytest.param(dict(S=3,B=2,H=4,D=256,R=256,section=[43,43,42],interleaved=False),id='full_rotary'),
    pytest.param(dict(S=17,B=2,H=5,D=256,R=64,section=[11,11,10],interleaved=True),id='interleaved_tail'),
]
SAMPLE=dict(S=17,B=2,H=5,D=256,R=64,section=[11,11,10],interleaved=True,
            fp32_compute=False,frequency_pattern='axis_tagged')


@pytest.mark.parametrize('case',SHAPES)
@pytest.mark.parametrize('dtype',DTYPES.values(),ids=list(DTYPES))
@pytest.mark.parametrize('fp32',[False,True])
def test_forward_backward(case,dtype,fp32):
    c=dict(case,fp32_compute=fp32,frequency_pattern='axis_tagged')
    shape=tuple(c[k] for k in ['S','B','H','D'])
    x,x_storage,pad=guarded(shape,dtype)
    generator=torch.Generator(device='cuda').manual_seed(20260815)
    x.uniform_(-1,1,generator=generator)
    saved_x=x.clone()
    raw_cpu=frequencies(c);raw=raw_cpu.cuda();saved_raw=raw.clone()
    y,y_storage,_=guarded(shape,dtype)
    for inverse in [False,True]:
        with Plan(x,raw,y,c['section'],c['interleaved'],c['fp32_compute'],inverse) as plan:
            plan.run()
        check_full(x,raw_cpu,y,c,inverse)
        binding=(mrope_backward if inverse else mrope)(x,raw,c['section'],c['interleaved'],c['fp32_compute'])
        assert torch.equal(binding,y)
        assert torch.equal(x,saved_x) and torch.equal(raw,saved_raw)
        assert (x_storage[:pad]==37).all() and (x_storage[-pad:]==37).all()
        assert (y_storage[:pad]==37).all() and (y_storage[-pad:]==37).all()
        del binding


def sample(dtype=torch.bfloat16):
    c=dict(SAMPLE)
    torch.manual_seed(20260815)
    return torch.randn(c['S'],c['B'],c['H'],c['D'],device='cuda',dtype=dtype),frequencies(c).cuda(),c


@pytest.mark.parametrize('dtype',[torch.bfloat16,torch.float16,torch.float32])
@pytest.mark.parametrize('fp32',[False,True])
def test_autograd_noncontiguous_microbatch_checkpoint(dtype,fp32):
    x,raw,c=sample(dtype)
    backing=torch.stack([x,x*.5,x*.25],dim=2).detach().requires_grad_()
    q=backing[:,:,0]  # Q/K from shared QKV storage with gaps.
    assert not q.is_contiguous()
    grad=torch.ones_like(x).transpose(0,1).contiguous().transpose(0,1)
    assert not grad.is_contiguous()
    def apply(value): return mrope(value,raw,c['section'],True,fp32)
    y=apply(q)
    expected=mrope_backward(grad,raw,c['section'],True,fp32)
    y.backward(grad,retain_graph=True);y.backward(grad)
    torch.testing.assert_close(backing.grad[:,:,0],expected+expected,atol=0,rtol=0)
    assert torch.count_nonzero(backing.grad[:,:,1:])==0
    leaf=x.detach().requires_grad_()
    checkpoint(apply,leaf,use_reentrant=False).backward(grad)
    torch.testing.assert_close(leaf.grad,expected,atol=0,rtol=0)
    with torch.no_grad(): assert not apply(leaf).requires_grad
    assert y.is_contiguous() and y.data_ptr()!=q.data_ptr()


def test_frequency_version_and_double_backward():
    x,raw,c=sample();x.requires_grad_()
    y=mrope(x,raw,c['section'],True)
    raw.add_(.1)
    with pytest.raises(RuntimeError,match='modified by an inplace'):
        y.sum().backward()
    grad=torch.ones_like(x,requires_grad=True)
    y=mrope(x,raw,c['section'],True)
    dx,=torch.autograd.grad(y,x,grad,create_graph=True)
    with pytest.raises(RuntimeError): torch.autograd.grad(dx.sum(),grad)


def test_offsets_nondefault_stream_and_cache_rebinding():
    x,raw,c=sample()
    offset=torch.empty(x.numel()+1,device='cuda',dtype=x.dtype)[1:].view_as(x)
    offset.copy_(x);assert offset.is_contiguous() and offset.data_ptr()%16!=0
    stream=torch.cuda.Stream()
    stream.wait_stream(torch.cuda.current_stream())
    with torch.cuda.stream(stream):
        output=mrope(offset,raw,c['section'],True)
        # Exercise hot convenience API and new same-key pointers.
        for value in [x,x*2,x*-3]:
            result=torch.empty_like(value)
            direct(value,raw,result,c['section'],True)
            assert torch.equal(result,mrope(value,raw,c['section'],True))
    torch.cuda.current_stream().wait_stream(stream)
    assert torch.equal(output,mrope(x,raw,c['section'],True))


def test_lazy_negative_views_are_materialized():
    x,raw,c=sample()
    for inverse in [False,True]:
        function=mrope_backward if inverse else mrope
        actual=function(torch._neg_view(x),torch._neg_view(raw),c['section'],True)
        expected=function(-x,-raw,c['section'],True)
        assert torch.equal(actual,expected)


@pytest.mark.parametrize('inverse',[False,True])
def test_public_c_rejects_without_launch(inverse):
    x,raw,c=sample();y=torch.empty_like(x)
    function=getattr(lib,'ftrainMrope'+('Backward' if inverse else 'Forward'))
    sections=(C.c_int64*3)(*c['section'])
    for port in range(3):
        for fault in ['null','alignment','host','dtype','stride']:
            views=[view(x),view(raw),view(y)]
            v=views[port]
            if fault=='null':v.memory=None
            if fault=='alignment':v.memory+=2
            if fault=='host':v.is_host_memory=True
            if fault=='dtype':v.numeric_type=7
            if fault=='stride':
                stride=(C.c_int64*4)(1,1,1,1);v.strides=stride;v.index_type=0
            assert function(*views,sections,True,False,None,0,torch.cuda.current_stream().cuda_stream)!=0
    assert function(view(x),view(raw),view(x),sections,True,False,None,0,0)!=0
    for bad in [[-1,11,22],[11,11,11],[24,4,4]]:
        assert function(view(x),view(raw),view(y),(C.c_int64*3)(*bad),True,False,None,0,0)!=0
    huge=view(x,[65536,32768,1,2]);freq=view(raw,[3,32768,65536,1]);out=view(y,[65536,32768,1,2])
    assert function(huge,freq,out,(C.c_int64*3)(1,0,0),False,False,None,0,0)==3
    for dims,raw_dims,section in [
        ([0,2,5,256],[3,2,0,32],[11,11,10]),
        ([17,2,5,256],[3,2,17,0],[0,0,0]),
        ([17,2,5,16],[3,2,17,10],[4,3,3]),
        ([17,2,5,1026],[3,2,17,32],[11,11,10]),
        ([17,2,5,256],[2,2,17,32],[11,11,10]),
    ]:
        assert function(view(x,dims),view(raw,raw_dims),view(y,dims),
                        (C.c_int64*3)(*section),False,False,None,0,0)!=0


def test_python_rejects_frequency_grad_dtype_shape_and_section():
    x,raw,c=sample()
    for bad_raw in [raw.double(),raw.cpu(),raw.requires_grad_()]:
        with pytest.raises(RuntimeError):mrope(x,bad_raw,c['section'],True)
    raw.requires_grad_(False)
    with pytest.raises(RuntimeError):mrope(x.double(),raw,c['section'],True)
    with pytest.raises(RuntimeError):mrope(x,raw,[11,21],True)
    with pytest.raises(RuntimeError):mrope(x[...,0],raw,c['section'],True)
    with pytest.raises(RuntimeError):mrope(x,raw,[24,4,4],True)


@pytest.mark.parametrize('tokens',[2047,2048,2049])
def test_packed_threshold(tokens):
    c=dict(SAMPLE,S=tokens,B=1,H=4,fp32_compute=True)
    x=torch.randn(tokens,1,4,256,device='cuda',dtype=torch.bfloat16)
    raw_cpu=frequencies(c);raw=raw_cpu.cuda()
    for inverse in [False,True]:
        y=(mrope_backward if inverse else mrope)(x,raw,c['section'],True,True)
        check_full(x,raw_cpu,y,c,inverse)


def test_local_shards_preserve_values_and_gradients():
    # Communication stays caller-owned.
    x,raw,c=sample();x.requires_grad_()
    full=mrope(x,raw,c['section'],True)
    heads=torch.cat([mrope(part,raw,c['section'],True) for part in x.split([2,3],dim=2)],dim=2)
    sequence=torch.cat([mrope(x[a:b],raw[:,:,a:b],c['section'],True) for a,b in [(0,8),(8,17)]])
    assert torch.equal(full,heads) and torch.equal(full,sequence)
    grads=[torch.autograd.grad(y.sum(),x,retain_graph=True)[0] for y in [full,heads,sequence]]
    assert torch.equal(grads[0],grads[1]) and torch.equal(grads[0],grads[2])
