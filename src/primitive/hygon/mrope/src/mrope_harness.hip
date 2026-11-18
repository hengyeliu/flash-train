// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

// Consumed from 02_packed_tail. Device helpers/kernel and template launchers
// are retained verbatim; standalone allocation, oracle, timing and CLI removed.
#include <hip/hip_bfloat16.h>
#include <hip/hip_fp16.h>
#include <hip/hip_runtime.h>
#include <array>
#include <cstdint>
#include "flash_train/primitive/hygon/mrope/mrope.hpp"

namespace {
constexpr int kHeadTile = 4;
struct Args {
    int seq, batch, heads, head_dim, rotary_dim;
    std::array<int, 3> section;
    bool interleaved, inverse, fp32_compute, packed_tail;
    std::uint32_t launch_tokens, launch_head_tiles, launch_fused_threads;
    int head_tile = kHeadTile;
};
// clang-format off
template <typename T>
struct Scalar;

template <>
struct Scalar<float> {
  __host__ __device__ static float to_float(float value) { return value; }
  __host__ __device__ static float from_float(float value) { return value; }
};

template <>
struct Scalar<__half> {
  __host__ __device__ static float to_float(__half value) { return __half2float(value); }
  __host__ __device__ static __half from_float(float value) { return __float2half_rn(value); }
};

template <>
struct Scalar<hip_bfloat16> {
  __host__ __device__ static float to_float(hip_bfloat16 value) {
    return static_cast<float>(value);
  }
  __host__ __device__ static hip_bfloat16 from_float(float value) {
    return hip_bfloat16(value);
  }
};

template <typename T>
__device__ T quantized_mul(T left, T right) {
  return Scalar<T>::from_float(Scalar<T>::to_float(left) * Scalar<T>::to_float(right));
}

template <typename T>
__device__ T quantized_add(T left, T right) {
  return Scalar<T>::from_float(Scalar<T>::to_float(left) + Scalar<T>::to_float(right));
}

template <typename T>
__device__ T quantized_sub(T left, T right) {
  return Scalar<T>::from_float(Scalar<T>::to_float(left) - Scalar<T>::to_float(right));
}

__host__ __device__ int select_axis(
    int k, int sec_t, int sec_h, int sec_w, bool interleaved) {
  (void)sec_w;
  if (!interleaved) {
    if (k < sec_t) {
      return 0;
    }
    if (k < sec_t + sec_h) {
      return 1;
    }
    return 2;
  }
  const int remainder = k % 3;
  const int section_index = k / 3;
  if (remainder == 1 && section_index < sec_h) {
    return 1;
  }
  if (remainder == 2 && section_index < sec_w) {
    return 2;
  }
  return 0;
}

template <typename T>
__device__ void rotate_pair(
    T x_lo,
    T x_hi,
    float cosine,
    float sine,
    bool inverse,
    bool fp32_compute,
    T* y_lo,
    T* y_hi) {
  if (fp32_compute) {
    if (inverse) {
      sine = -sine;
    }
    const float lo = Scalar<T>::to_float(x_lo);
    const float hi = Scalar<T>::to_float(x_hi);
    *y_lo = Scalar<T>::from_float(lo * cosine - hi * sine);
    *y_hi = Scalar<T>::from_float(hi * cosine + lo * sine);
    return;
  }

  T cosine_q = Scalar<T>::from_float(cosine);
  T sine_q = Scalar<T>::from_float(sine);
  if (inverse) {
    sine_q = Scalar<T>::from_float(-Scalar<T>::to_float(sine_q));
  }
  const T lo_cos = quantized_mul(x_lo, cosine_q);
  const T hi_sin = quantized_mul(x_hi, sine_q);
  const T hi_cos = quantized_mul(x_hi, cosine_q);
  const T lo_sin = quantized_mul(x_lo, sine_q);
  *y_lo = quantized_sub(lo_cos, hi_sin);
  *y_hi = quantized_add(hi_cos, lo_sin);
}

template <typename T, int HeadTile, bool PackedTail = false>
__global__ void fused_mrope_kernel(
    const T* input,
    const float* raw_freqs,
    T* output,
    int seq,
    int batch,
    int heads,
    int head_dim,
    int rotary_dim,
    int sec_t,
    int sec_h,
    int sec_w,
    bool interleaved,
    bool inverse,
    bool fp32_compute) {
  const int token = static_cast<int>(blockIdx.x);
  const int head_begin = static_cast<int>(blockIdx.y) * HeadTile;
  const int lane = static_cast<int>(threadIdx.x);
  const int half = rotary_dim / 2;
  const int pass_dim = head_dim - rotary_dim;
  const int seq_index = token / batch;
  const int batch_index = token - seq_index * batch;

  if (lane < half) {
    const int axis = select_axis(lane, sec_t, sec_h, sec_w, interleaved);
    const size_t freq_index =
        ((static_cast<size_t>(axis) * batch + batch_index) * seq + seq_index) * half + lane;
    const float theta = raw_freqs[freq_index];
    const float cosine = cosf(theta);
    const float sine = sinf(theta);
    for (int offset = 0; offset < HeadTile; ++offset) {
      const int head = head_begin + offset;
      if (head >= heads) {
        break;
    }
      const size_t base =
          ((static_cast<size_t>(token) * heads + head) * head_dim);
      T y_lo;
      T y_hi;
      rotate_pair(
          input[base + lane],
          input[base + lane + half],
          cosine,
          sine,
          inverse,
          fp32_compute,
          &y_lo,
          &y_hi);
      output[base + lane] = y_lo;
      output[base + lane + half] = y_hi;
    }
  } else {
    const int tail_index = lane - half;
    if (tail_index >= (PackedTail ? pass_dim / 8 : pass_dim)) {
      return;
    }
    const int dim = rotary_dim + tail_index * (PackedTail ? 8 : 1);
    for (int offset = 0; offset < HeadTile; ++offset) {
      const int head = head_begin + offset;
      if (head >= heads) {
        break;
      }
      const size_t index =
          ((static_cast<size_t>(token) * heads + head) * head_dim) + dim;
      if constexpr (PackedTail) {
        using Packed = uint32_t __attribute__((ext_vector_type(4)));
        Packed packed;
        __builtin_memcpy(&packed, __builtin_assume_aligned(input + index, 16), sizeof(packed));
        __builtin_memcpy(__builtin_assume_aligned(output + index, 16), &packed, sizeof(packed));
      } else {
        output[index] = input[index];
      }
    }
  }
}

template <typename T, int HeadTile, bool PackedTail = false>
void launch_fused_tile(
    const Args& args, const T* input, const float* freqs, T* output, hipStream_t stream) {
  const dim3 grid(args.launch_tokens, args.launch_head_tiles);
  hipLaunchKernelGGL(
      (fused_mrope_kernel<T, HeadTile, PackedTail>),
      grid,
      dim3(args.launch_fused_threads),
      0,
      stream,
      input,
      freqs,
      output,
      args.seq,
      args.batch,
      args.heads,
      args.head_dim,
      args.rotary_dim,
      args.section[0],
      args.section[1],
      args.section[2],
      args.interleaved,
      args.inverse,
      args.fp32_compute);
  return;
}

template <typename T>
void launch_fused(
    const Args& args, const T* input, const float* freqs, T* output, hipStream_t stream) {
  if (args.head_tile == 1) {
    launch_fused_tile<T, 1>(args, input, freqs, output, stream);
  } else if constexpr (sizeof(T) == 2) {
    if (args.packed_tail) {
      launch_fused_tile<T, kHeadTile, true>(args, input, freqs, output, stream);
    } else {
      launch_fused_tile<T, kHeadTile>(args, input, freqs, output, stream);
    }
  } else {
    launch_fused_tile<T, kHeadTile>(args, input, freqs, output, stream);
  }
}

// clang-format on
}  // namespace

namespace ftrain {
void launchMrope(const MropeLaunch& p, FTrainStream stream) {
    const Args args{p.seq,     p.batch,        p.heads,       p.head_dim, p.rotary_dim, p.section, p.interleaved,
                    p.inverse, p.fp32_compute, p.packed_tail, p.tokens,   p.head_tiles, p.threads};
    if (p.dtype == FTRAIN_NUMERIC_TYPE_BF16) {
        launch_fused(args, static_cast<const hip_bfloat16*>(p.input), p.raw_freqs, static_cast<hip_bfloat16*>(p.output),
                     stream);
    } else if (p.dtype == FTRAIN_NUMERIC_TYPE_FP16) {
        launch_fused(args, static_cast<const __half*>(p.input), p.raw_freqs, static_cast<__half*>(p.output), stream);
    } else {
        launch_fused(args, static_cast<const float*>(p.input), p.raw_freqs, static_cast<float*>(p.output), stream);
    }
    const auto status = hipGetLastError();
    if (status != hipSuccess) {
        throw Exception(FTRAIN_STATUS_INTERNAL_ERROR, "mRoPE launch failed: %s", hipGetErrorString(status));
    }
}
}  // namespace ftrain
