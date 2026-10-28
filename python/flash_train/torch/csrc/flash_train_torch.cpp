// Copyright (c) 2026 Hygon Information Technology Co., Ltd.
// SPDX-License-Identifier: Apache-2.0

#include <torch/extension.h>

#include <cstdint>
#include <optional>
#include <tuple>

namespace flash_train_torch {

constexpr unsigned char kStatusSuccess = 0;
constexpr unsigned char kNumericInt64 = 2;
constexpr unsigned char kNumericFp32 = 4;
constexpr unsigned char kNumericBf16 = 8;
constexpr unsigned char kMainGradReturn = 1;
constexpr unsigned char kMainGradAccumulate = 2;

// Defined in flash_train_torch_capi.cpp. The bridge keeps this torch-facing
// translation unit free of the library's HIP-flavored headers: the HCU
// torch build pulls DTK's CUDA-compat headers, which clash with the HIP
// runtime headers inside one translation unit. Plain pointer and integer
// types only.
unsigned char callFp32Gemm(const void* a, const std::int64_t* a_dims, const void* b, const std::int64_t* b_dims,
                           const void* c, const std::int64_t* c_dims, void* d, const std::int64_t* d_dims,
                           const void* alpha, const void* beta, void* stream);

unsigned char callLinearCEForwardPartials(const void* hidden, const void* weight, const void* labels, void* lse_local,
                                          void* target_logit_local, std::uint64_t n, std::uint64_t d,
                                          std::uint64_t v, std::uint64_t shard_vocab_start, void* workspace,
                                          std::uint64_t workspace_bytes, void* stream);

unsigned char callLinearCEForwardFinalize(const void* lse, const void* target_logit, const void* labels, void* loss,
                                          void* maximum, void* saved_lse, void* num_valid_tokens, std::uint64_t n,
                                          void* workspace, std::uint64_t workspace_bytes, void* stream);

unsigned char callLinearCEBackward(const void* dloss, const void* hidden, const void* weight, const void* labels,
                                   const void* maximum, const void* saved_lse, const void* num_valid_tokens,
                                   void* main_grad, void* d_hidden, void* d_weight, std::uint64_t n, std::uint64_t d,
                                   std::uint64_t v, std::uint64_t shard_vocab_start, unsigned char main_grad_type,
                                   unsigned char main_grad_mode, void* workspace, std::uint64_t workspace_bytes,
                                   void* stream);

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

void checkLinearMatrix(const at::Tensor& tensor, const char* name) {
    TORCH_CHECK(tensor.is_cuda(), name, " must be a device tensor");
    TORCH_CHECK(tensor.is_contiguous(), name, " must be contiguous");
    TORCH_CHECK(tensor.dim() == 2, name, " must be rank two");
}

void checkLinearVector(const at::Tensor& tensor, const char* name) {
    TORCH_CHECK(tensor.is_cuda(), name, " must be a device tensor");
    TORCH_CHECK(tensor.is_contiguous(), name, " must be contiguous");
    TORCH_CHECK(tensor.dim() == 1, name, " must be rank one");
}

at::TensorOptions byteOptions(const at::Tensor& tensor) { return tensor.options().dtype(at::kByte); }

std::tuple<at::Tensor, at::Tensor> linearCEForwardPartials(const at::Tensor& hidden, const at::Tensor& weight,
                                                           const at::Tensor& labels, std::uint64_t shard_vocab_start) {
    checkLinearMatrix(hidden, "hidden");
    checkLinearMatrix(weight, "weight");
    checkLinearVector(labels, "labels");
    TORCH_CHECK(hidden.scalar_type() == at::kBFloat16 && weight.scalar_type() == at::kBFloat16,
                "hidden and weight must use BF16");
    TORCH_CHECK(labels.scalar_type() == at::kLong, "labels must use int64");
    TORCH_CHECK(hidden.device() == weight.device() && hidden.device() == labels.device(),
                "Linear CE tensors must share one device");
    TORCH_CHECK(hidden.size(1) == weight.size(1) && hidden.size(0) == labels.size(0),
                "Linear CE input dimensions are inconsistent");
    const auto n = static_cast<std::uint64_t>(hidden.size(0));
    const auto d = static_cast<std::uint64_t>(hidden.size(1));
    const auto v = static_cast<std::uint64_t>(weight.size(0));
    TORCH_CHECK(n > 0 && d > 0 && v > 0 && n % 256 == 0 && d % 256 == 0 && v % 256 == 0,
                "Linear CE forward assembly requires positive N/D/V multiples of 256");
    const std::uint64_t workspace_bytes = (2 * (v / 256) * n + n) * sizeof(float) + n * sizeof(std::int64_t);
    at::Tensor lse_local = torch::empty({hidden.size(0)}, hidden.options().dtype(at::kFloat));
    at::Tensor target_logit_local = torch::empty({hidden.size(0)}, hidden.options().dtype(at::kFloat));
    at::Tensor workspace = torch::empty({static_cast<std::int64_t>(workspace_bytes)}, byteOptions(hidden));
    const unsigned char status = flash_train_torch::callLinearCEForwardPartials(
        hidden.data_ptr(), weight.data_ptr(), labels.data_ptr(), lse_local.data_ptr(), target_logit_local.data_ptr(),
        n, d, v, shard_vocab_start, workspace.data_ptr(), workspace_bytes, currentStream());
    TORCH_CHECK(status == flash_train_torch::kStatusSuccess, "Linear CE forward_partials failed with status ",
                static_cast<unsigned int>(status));
    return {lse_local, target_logit_local};
}

std::tuple<at::Tensor, at::Tensor, at::Tensor, at::Tensor> linearCEForwardFinalize(
    const at::Tensor& lse, const at::Tensor& target_logit, const at::Tensor& labels) {
    checkLinearVector(lse, "lse");
    checkLinearVector(target_logit, "target_logit");
    checkLinearVector(labels, "labels");
    TORCH_CHECK(lse.scalar_type() == at::kFloat && target_logit.scalar_type() == at::kFloat,
                "lse and target_logit must use FP32");
    TORCH_CHECK(labels.scalar_type() == at::kLong, "labels must use int64");
    TORCH_CHECK(lse.device() == target_logit.device() && lse.device() == labels.device() &&
                    lse.numel() == target_logit.numel() && lse.numel() == labels.numel(),
                "Linear CE finalize inputs are inconsistent");
    const auto n = static_cast<std::uint64_t>(labels.numel());
    TORCH_CHECK(n > 0, "Linear CE finalize requires a non-empty token vector");
    const std::uint64_t workspace_bytes = n * (sizeof(float) + sizeof(std::uint32_t)) + sizeof(std::uint32_t);
    at::Tensor loss = torch::empty({}, lse.options());
    at::Tensor maximum = torch::empty({labels.size(0)}, lse.options());
    at::Tensor saved_lse = torch::empty({labels.size(0)}, lse.options());
    at::Tensor num_valid_tokens = torch::empty({}, labels.options());
    at::Tensor workspace = torch::empty({static_cast<std::int64_t>(workspace_bytes)}, byteOptions(lse));
    const unsigned char status = flash_train_torch::callLinearCEForwardFinalize(
        lse.data_ptr(), target_logit.data_ptr(), labels.data_ptr(), loss.data_ptr(), maximum.data_ptr(),
        saved_lse.data_ptr(), num_valid_tokens.data_ptr(), n, workspace.data_ptr(), workspace_bytes, currentStream());
    TORCH_CHECK(status == flash_train_torch::kStatusSuccess, "Linear CE forward_finalize failed with status ",
                static_cast<unsigned int>(status));
    return {loss, maximum, saved_lse, num_valid_tokens};
}

std::tuple<at::Tensor, at::Tensor> linearCEBackward(
    const at::Tensor& dloss, const at::Tensor& hidden, const at::Tensor& weight, const at::Tensor& labels,
    const at::Tensor& maximum, const at::Tensor& saved_lse, const at::Tensor& num_valid_tokens,
    std::uint64_t shard_vocab_start, const std::optional<at::Tensor>& main_grad) {
    checkLinearMatrix(hidden, "hidden");
    checkLinearMatrix(weight, "weight");
    checkLinearVector(labels, "labels");
    checkLinearVector(maximum, "maximum");
    checkLinearVector(saved_lse, "saved_lse");
    TORCH_CHECK(dloss.is_cuda() && dloss.is_contiguous() && dloss.dim() == 0 && dloss.scalar_type() == at::kFloat,
                "dloss must be a contiguous device FP32 scalar");
    TORCH_CHECK(num_valid_tokens.is_cuda() && num_valid_tokens.is_contiguous() && num_valid_tokens.dim() == 0 &&
                    num_valid_tokens.scalar_type() == at::kLong,
                "num_valid_tokens must be a contiguous device int64 scalar");
    TORCH_CHECK(hidden.scalar_type() == at::kBFloat16 && weight.scalar_type() == at::kBFloat16 &&
                    labels.scalar_type() == at::kLong && maximum.scalar_type() == at::kFloat &&
                    saved_lse.scalar_type() == at::kFloat,
                "Linear CE backward received unsupported tensor types");
    TORCH_CHECK(hidden.device() == weight.device() && hidden.device() == labels.device() &&
                    hidden.device() == dloss.device() && hidden.device() == maximum.device() &&
                    hidden.device() == saved_lse.device() && hidden.device() == num_valid_tokens.device(),
                "Linear CE backward tensors must share one device");
    TORCH_CHECK(hidden.size(1) == weight.size(1) && hidden.size(0) == labels.size(0) &&
                    maximum.size(0) == labels.size(0) && saved_lse.size(0) == labels.size(0),
                "Linear CE backward input dimensions are inconsistent");
    const auto n = static_cast<std::uint64_t>(hidden.size(0));
    const auto d = static_cast<std::uint64_t>(hidden.size(1));
    const auto v = static_cast<std::uint64_t>(weight.size(0));
    TORCH_CHECK(n > 0 && d > 0 && v > 0, "Linear CE backward requires positive dimensions");

    at::Tensor accumulation;
    unsigned char main_grad_type = flash_train_torch::kNumericBf16;
    unsigned char main_grad_mode = flash_train_torch::kMainGradReturn;
    if (main_grad.has_value()) {
        accumulation = *main_grad;
        checkLinearMatrix(accumulation, "main_grad");
        TORCH_CHECK(accumulation.device() == weight.device() && accumulation.sizes() == weight.sizes() &&
                        (accumulation.scalar_type() == at::kFloat || accumulation.scalar_type() == at::kBFloat16),
                    "main_grad must match weight shape and use FP32 or BF16");
        main_grad_type = accumulation.scalar_type() == at::kFloat ? flash_train_torch::kNumericFp32
                                                                    : flash_train_torch::kNumericBf16;
        main_grad_mode = flash_train_torch::kMainGradAccumulate;
    } else {
        accumulation = torch::empty_like(weight);
    }

    const std::uint64_t workspace_bytes = n * std::min<std::uint64_t>(v, 4096) * sizeof(std::uint16_t);
    at::Tensor d_hidden = torch::empty_like(hidden);
    at::Tensor d_weight = torch::empty_like(weight);
    at::Tensor workspace = torch::empty({static_cast<std::int64_t>(workspace_bytes)}, byteOptions(hidden));
    const unsigned char status = flash_train_torch::callLinearCEBackward(
        dloss.data_ptr(), hidden.data_ptr(), weight.data_ptr(), labels.data_ptr(), maximum.data_ptr(),
        saved_lse.data_ptr(), num_valid_tokens.data_ptr(), accumulation.data_ptr(), d_hidden.data_ptr(),
        d_weight.data_ptr(), n, d, v, shard_vocab_start, main_grad_type, main_grad_mode, workspace.data_ptr(),
        workspace_bytes, currentStream());
    TORCH_CHECK(status == flash_train_torch::kStatusSuccess, "Linear CE backward failed with status ",
                static_cast<unsigned int>(status));
    return {d_hidden, d_weight};
}

}  // namespace

PYBIND11_MODULE(_flash_train_torch, m) {
    m.doc() = "flash-train PyTorch bindings";
    m.def("gemm", &gemm, "d = alpha * (a @ b) + beta * c on the current stream", py::arg("a"), py::arg("b"),
          py::arg("c") = std::nullopt, py::arg("alpha") = 1.0, py::arg("beta") = 0.0);
    m.def("linear_ce_forward_partials", &linearCEForwardPartials, py::arg("hidden"), py::arg("weight"),
          py::arg("labels"), py::arg("shard_vocab_start") = 0);
    m.def("linear_ce_forward_finalize", &linearCEForwardFinalize, py::arg("lse"), py::arg("target_logit"),
          py::arg("labels"));
    m.def("linear_ce_backward", &linearCEBackward, py::arg("dloss"), py::arg("hidden"), py::arg("weight"),
          py::arg("labels"), py::arg("maximum"), py::arg("saved_lse"), py::arg("num_valid_tokens"),
          py::arg("shard_vocab_start") = 0, py::arg("main_grad") = std::nullopt);
}
