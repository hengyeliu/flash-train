# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

"""Typed black-box C API adapter for tests and separated Plan/C timing."""
import ctypes as C
import os
from pathlib import Path
import torch
import flash_train


class View(C.Structure):
    _fields_=[('memory',C.c_void_p),('dims',C.POINTER(C.c_int64)),('strides',C.POINTER(C.c_int64)),
              ('num_dims',C.c_uint8),('numeric_type',C.c_uint8),('index_type',C.c_uint8),('is_host_memory',C.c_bool)]


class Id(C.Structure):
    _fields_=[('opaque',C.c_uint64)]


lib=C.CDLL(os.environ.get('FTRAIN_TEST_LIBRARY', str(Path(flash_train.__file__).parent/'libflash_train.so')))
lib.ftrainGetLastMessage.restype=C.c_char_p


def bind(name, types):
    fn=getattr(lib,name);fn.argtypes=types;fn.restype=C.c_uint8
    return fn


ptr=C.c_void_p
for name,types in {
    'ftrainPatternCreate':[C.POINTER(ptr)], 'ftrainPatternAddTensor':[ptr,C.POINTER(Id)],
    'ftrainOpsCreate':[C.POINTER(ptr),ptr], 'ftrainArgsCreate':[C.POINTER(ptr),ptr],
    'ftrainArgsSetTensor':[ptr,Id,View], 'ftrainPlanCreate':[C.POINTER(ptr),ptr],
    'ftrainPlanGetNumPrimitives':[ptr,C.POINTER(C.c_uint64)],
    'ftrainPlanGetPrimitiveName':[ptr,C.c_uint64,C.POINTER(C.c_char_p)],
    'ftrainPlanGetPrimitiveRequiredWorkspaceBytes':[ptr,C.c_uint64,C.POINTER(C.c_uint64)],
    'ftrainPlanExecutePrimitive':[ptr,C.c_uint64,ptr,C.c_uint64,ptr],
    **{f'ftrain{kind}Destroy':[ptr] for kind in ['Pattern','Ops','Args','Plan']},
    **{f'ftrainPatternAddMrope{d}':[ptr,C.POINTER(Id),Id,Id,Id] for d in ['Forward','Backward']},
    **{f'ftrainArgsSetMrope{d}':[ptr,Id,C.POINTER(C.c_int64),C.c_bool,C.c_bool] for d in ['Forward','Backward']},
    **{f'ftrainMrope{d}':[View,View,View,C.POINTER(C.c_int64),C.c_bool,C.c_bool,ptr,C.c_uint64,ptr]
       for d in ['Forward','Backward']},
}.items(): bind(name,types)


def checked(status):
    if status:
        raise RuntimeError(f'{status}: {lib.ftrainGetLastMessage().decode()}')


def view(t, dims=None):
    dims=(C.c_int64*len(t.shape))(*(t.shape if dims is None else dims))
    v=View(t.data_ptr(),dims,None,len(t.shape),{torch.float32:4,torch.float16:7,torch.bfloat16:8,torch.float64:1}[t.dtype],1,not t.is_cuda)
    v._dims=dims
    return v


class Plan:
    def __init__(self, x, raw, y, section, interleaved=False, fp32_compute=False, inverse=False):
        self.pattern,self.ops,self.args,self.plan=(ptr() for _ in range(4))
        self.tensors=(x,raw,y)
        self.direction='Backward' if inverse else 'Forward'
        checked(lib.ftrainPatternCreate(C.byref(self.pattern)))
        self.roles={}
        # Deliberately reverse builder insertion order to test semantic mapping.
        for name in ['output','freqs','input']:
            role=Id();checked(lib.ftrainPatternAddTensor(self.pattern,C.byref(role)));self.roles[name]=role
        self.op=Id()
        checked(getattr(lib,'ftrainPatternAddMrope'+self.direction)(self.pattern,C.byref(self.op),
                self.roles['input'],self.roles['freqs'],self.roles['output']))
        checked(lib.ftrainOpsCreate(C.byref(self.ops),self.pattern))
        checked(lib.ftrainArgsCreate(C.byref(self.args),self.ops))
        for role,tensor in zip(['input','freqs','output'],self.tensors):
            checked(lib.ftrainArgsSetTensor(self.args,self.roles[role],view(tensor)))
        checked(getattr(lib,'ftrainArgsSetMrope'+self.direction)(self.args,self.op,(C.c_int64*3)(*section),interleaved,fp32_compute))
        checked(lib.ftrainPlanCreate(C.byref(self.plan),self.args))
        count=C.c_uint64(); checked(lib.ftrainPlanGetNumPrimitives(self.plan,C.byref(count)));assert count.value==1
        name=C.c_char_p();checked(lib.ftrainPlanGetPrimitiveName(self.plan,0,C.byref(name)))
        assert name.value.decode()=='HygonMrope'+self.direction+'02PackedTail'
        workspace=C.c_uint64();checked(lib.ftrainPlanGetPrimitiveRequiredWorkspaceBytes(self.plan,0,C.byref(workspace)))
        assert workspace.value==0

    def run(self):
        checked(lib.ftrainPlanExecutePrimitive(self.plan,0,None,0,torch.cuda.current_stream().cuda_stream))

    def close(self):
        for name in ['Plan','Args','Ops','Pattern']:
            handle=getattr(self,name.lower(),None)
            if handle and handle.value:
                checked(getattr(lib,'ftrain'+name+'Destroy')(handle));handle.value=None

    def __enter__(self): return self
    def __exit__(self,*args): self.close()


def direct(x,raw,y,section,interleaved=False,fp32_compute=False,inverse=False):
    checked(getattr(lib,'ftrainMrope'+('Backward' if inverse else 'Forward'))(
        view(x),view(raw),view(y),(C.c_int64*3)(*section),interleaved,fp32_compute,None,0,
        torch.cuda.current_stream().cuda_stream))
