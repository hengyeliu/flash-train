# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

add_executable(
  ftrain_test
  api/common_api_test.cpp
  api/gemm_api_test.cpp
  api/gemm_numerics_test.cpp
  api/linear_ce_api_test.cpp
  api/pattern_api_test.cpp
  api/runtime_api_test.cpp
  cache/cache_test.cpp
  engine/engine_test.cpp
  family/gemm/gemm_test.cpp
  handle/handle_test.cpp
  operation/op_definitions_test.cpp
  operation/linear_ce_op_test.cpp
  operation/op_schema_test.cpp
  error_test.cpp
  matcher_test.cpp
  ops_args_test.cpp
  pattern_test.cpp
  plan_test.cpp
  primitive_test.cpp
  primitive/hygon/gemm/fp32_gemm_test.cpp
  storage_view_test.cpp
  tensor_test.cpp)

if(FTRAIN_PLATFORM_HYGON_HIP)
  target_compile_options(ftrain_test PRIVATE -Wno-return-type-void-func)
endif()

target_link_libraries(ftrain_test PRIVATE flash_train_impl GTest::gtest_main)
if(FTRAIN_PLATFORM_HYGON_HIP AND TARGET flash_train_linear_ce_assembly)
  # Keep the production fatbin out of the host-only unit-test executable.
  # Real assembly execution is validated through the shared library/Torch
  # binding, while this target only needs to resolve the launch bridge.
  target_sources(ftrain_test PRIVATE support/linear_ce_assembly_stub.cpp)
endif()

add_test(NAME ftrain_test COMMAND ftrain_test)
