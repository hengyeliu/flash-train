// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <torch/extension.h>
#include <c10/core/DeviceGuard.h>
#include <string>
#include <vector>

#include <cstdint>
#include <optional>

namespace flash_train_torch {

// Defined in flash_train_torch_capi.cpp. The bridge keeps this torch-facing
// translation unit free of the library's HIP-flavored headers: the HCU
// torch build pulls DTK's CUDA-compat headers, which clash with the HIP
// runtime headers inside one translation unit. Plain pointer and integer
// types only.
unsigned char callFp32Gemm(const void* a, const std::int64_t* a_dims, const void* b, const std::int64_t* b_dims,
                           const void* c, const std::int64_t* c_dims, void* d, const std::int64_t* d_dims,
                           const void* alpha, const void* beta, void* stream);

std::string callMrope(const void* input, const std::int64_t* dims, const void* freqs, const std::int64_t* freq_dims,
                      void* output, int dtype, const std::int64_t* section, bool interleaved, bool fp32_compute,
                      bool inverse, void* stream);

}  // namespace flash_train_torch

namespace {

// The HCU torch wheel's C++ stream headers cannot be included together
// with this TU's world (its CUDA-compat and HIP runtime headers clash), so
// ask torch itself for the current stream. The bound callable is cached
// and intentionally never destroyed.
void* currentStream() {
    static const py::object* const current_stream =
        new py::object(py::module_::import("torch").attr("cuda").attr("current_stream"));
    return reinterpret_cast<void*>(py::cast<std::uintptr_t>((*current_stream)().attr("cuda_stream")));
}

void checkMatrix(const at::Tensor& tensor, const char* name) {
    TORCH_CHECK(tensor.is_cuda(), name, " must be a device tensor");
    TORCH_CHECK(tensor.scalar_type() == at::kFloat, name, " must be FP32");
    TORCH_CHECK(tensor.dim() == 2, name, " must be rank two");
    TORCH_CHECK(tensor.is_contiguous(), name, " must be contiguous");
}

at::Tensor gemm(const at::Tensor& a, const at::Tensor& b, const std::optional<at::Tensor>& c, double alpha,
                double beta) {
    checkMatrix(a, "a");
    checkMatrix(b, "b");
    TORCH_CHECK(a.size(1) == b.size(0), "a's reduction depth must equal b's rows");
    if (c.has_value()) {
        checkMatrix(*c, "c");
        TORCH_CHECK(c->size(0) == a.size(0) && c->size(1) == b.size(1), "c must be shaped m-by-n");
    }

    at::Tensor d = torch::empty({a.size(0), b.size(1)}, a.options());

    const std::int64_t a_dims[2]  = {a.size(0), a.size(1)};
    const std::int64_t b_dims[2]  = {b.size(0), b.size(1)};
    const std::int64_t cd_dims[2] = {a.size(0), b.size(1)};

    float alpha_value = static_cast<float>(alpha);
    float beta_value  = static_cast<float>(beta);

    void* stream = currentStream();
    // FTRAIN_STATUS_SUCCESS is 0; any other code is a failure.
    const unsigned char status = flash_train_torch::callFp32Gemm(
        a.data_ptr(), a_dims, b.data_ptr(), b_dims, c.has_value() ? c->data_ptr() : nullptr, cd_dims, d.data_ptr(),
        cd_dims, &alpha_value, &beta_value, stream);
    TORCH_CHECK(status == 0, "ftrainGemm failed with status ", static_cast<unsigned int>(status));
    return d;
}

at::Tensor alignedContinuous(const at::Tensor& input) {
    auto result = input.resolve_neg().contiguous();
    if (reinterpret_cast<std::uintptr_t>(result.data_ptr()) % 16 != 0) { result = result.clone(); }
    return result;
}

at::Tensor mrope(const at::Tensor& input, const at::Tensor& raw_freqs, const std::vector<std::int64_t>& section,
                 bool interleaved, bool fp32_compute, bool inverse) {
    TORCH_CHECK(input.is_cuda() && raw_freqs.is_cuda(), "mRoPE requires device tensors");
    TORCH_CHECK(input.device() == raw_freqs.device(), "mRoPE tensors must be on the same device");
    TORCH_CHECK(input.dim() == 4 && raw_freqs.dim() == 4, "mRoPE requires rank-four tensors");
    TORCH_CHECK(raw_freqs.scalar_type() == at::kFloat, "raw_freqs must be FP32");
    TORCH_CHECK(!raw_freqs.requires_grad(), "mRoPE does not compute raw_freqs gradients");
    TORCH_CHECK(section.size() == 3, "mRoPE section must contain three integers");
    int dtype = -1;
    if (input.scalar_type() == at::kFloat) { dtype = 0; }
    if (input.scalar_type() == at::kHalf) { dtype = 1; }
    if (input.scalar_type() == at::kBFloat16) { dtype = 2; }
    TORCH_CHECK(dtype >= 0, "mRoPE input must be BF16, FP16 or FP32");
    // Generic guard dispatches through Torch without including HIP/CUDA headers.
    const c10::DeviceGuard device_guard(input.device());
    const at::NoGradGuard no_grad;
    const auto source = alignedContinuous(input);
    const auto freqs  = alignedContinuous(raw_freqs);
    auto output       = at::empty(input.sizes(), input.options());
    const auto error  = flash_train_torch::callMrope(source.data_ptr(), source.sizes().data(), freqs.data_ptr(),
                                                     freqs.sizes().data(), output.data_ptr(), dtype, section.data(),
                                                     interleaved, fp32_compute, inverse, currentStream());
    TORCH_CHECK(error.empty(), "mRoPE failed: ", error);
    return output;
}

}  // namespace

PYBIND11_MODULE(_flash_train_torch, m) {
    m.def("mrope", &mrope, "Internal out-of-place mRoPE launch; use the public autograd wrapper", py::arg("input"),
          py::arg("raw_freqs"), py::arg("section"), py::arg("interleaved_mrope") = false,
          py::arg("fp32_compute") = false, py::arg("inverse") = false);
    m.doc() = "flash-train PyTorch bindings";
    m.def("gemm", &gemm, "d = alpha * (a @ b) + beta * c on the current stream", py::arg("a"), py::arg("b"),
          py::arg("c") = std::nullopt, py::arg("alpha") = 1.0, py::arg("beta") = 0.0);
}
