# Copyright (c) 2026 Hygon Information Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0

add_library(
  flash_train_impl
  OBJECT api/common_api.cpp
         api/gemm_api.cpp
         api/ops_args_api.cpp
         api/pattern_api.cpp
         api/plan_api.cpp
         ops_args.cpp
         plan.cpp
         constraints.cpp
         error.cpp
         trace.cpp
         storage_view.cpp
         tensor.cpp
         handle.cpp
         cache.cpp
         engine.cpp
         family/gemm/family.cpp
         family/gemm/problem.cpp
         family/linear_ce/family.cpp
         family/linear_ce/problem.cpp
         primitive.cpp
         pattern.cpp)
target_include_directories(
  flash_train_impl
  PUBLIC "${PROJECT_BINARY_DIR}/include" "${PROJECT_SOURCE_DIR}/include"
         "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(flash_train_impl PUBLIC Threads::Threads)

# The platform-specific primitives: everything under primitive/hygon/
# builds only for the selected platform and carries its dependencies.
if(FTRAIN_PLATFORM_HYGON_HIP)
  set(FTRAIN_DTK_ROOT "$ENV{DTK_ROOT}" CACHE PATH "DTK installation root")
  if(NOT FTRAIN_DTK_ROOT)
    set(FTRAIN_DTK_ROOT "/opt/dtk")
  endif()
  find_path(
    FTRAIN_ROCBLAS_INCLUDE_DIR
    NAMES rocblas.h
    PATHS "${FTRAIN_DTK_ROOT}/include" "${FTRAIN_DTK_ROOT}/rocblas/include"
    NO_DEFAULT_PATH)
  find_library(
    FTRAIN_ROCBLAS_LIBRARY
    NAMES rocblas
    PATHS "${FTRAIN_DTK_ROOT}/lib" "${FTRAIN_DTK_ROOT}/lib64" "${FTRAIN_DTK_ROOT}/rocblas/lib"
    NO_DEFAULT_PATH)
  if(NOT FTRAIN_ROCBLAS_INCLUDE_DIR OR NOT FTRAIN_ROCBLAS_LIBRARY)
    message(FATAL_ERROR "Linear CE backward requires rocBLAS under ${FTRAIN_DTK_ROOT}")
  endif()
  # Build one HIP fatbin containing every requested architecture for which a
  # Linear CE assembly source exists. Adding a new architecture only requires
  # placing its source under assembly/<arch>/bf16/forward/ and adding the arch
  # to FTRAIN_HYGON_HIP_ARCHS.
  set(FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS "")
  set(FTRAIN_LINEAR_CE_ASSEMBLY_SOURCES "")
  foreach(FTRAIN_LINEAR_CE_ARCH IN LISTS FTRAIN_HYGON_HIP_ARCHS)
    set(FTRAIN_LINEAR_CE_SOURCE
        "${CMAKE_CURRENT_SOURCE_DIR}/primitive/hygon/linear_ce/assembly/${FTRAIN_LINEAR_CE_ARCH}/bf16/forward/bf16_tn_partial_family_a.s")
    if(EXISTS "${FTRAIN_LINEAR_CE_SOURCE}")
      list(APPEND FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS "${FTRAIN_LINEAR_CE_ARCH}")
      list(APPEND FTRAIN_LINEAR_CE_ASSEMBLY_SOURCES "${FTRAIN_LINEAR_CE_SOURCE}")
    else()
      message(WARNING
              "Linear CE forward assembly source is unavailable for ${FTRAIN_LINEAR_CE_ARCH}; "
              "that architecture will not have the embedded assembly primitive")
    endif()
  endforeach()

  if(FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS)
    set(FTRAIN_DTK_CLANG "${FTRAIN_DTK_ROOT}/llvm/bin/clang")
    set(FTRAIN_DTK_HIPCC "${FTRAIN_DTK_ROOT}/bin/hipcc")
    set(FTRAIN_DTK_BUNDLER "${FTRAIN_DTK_ROOT}/llvm/bin/clang-offload-bundler")
    set(FTRAIN_DTK_OBJCOPY "${FTRAIN_DTK_ROOT}/llvm/bin/llvm-objcopy")
    if(NOT EXISTS "${FTRAIN_DTK_CLANG}" OR NOT EXISTS "${FTRAIN_DTK_HIPCC}" OR
       NOT EXISTS "${FTRAIN_DTK_BUNDLER}" OR NOT EXISTS "${FTRAIN_DTK_OBJCOPY}")
      message(FATAL_ERROR
              "Embedding Linear CE assembly requires DTK clang, hipcc, "
              "clang-offload-bundler, and llvm-objcopy")
    endif()

    set(FTRAIN_LINEAR_CE_CODE_OBJECTS "")
    set(FTRAIN_LINEAR_CE_BUNDLE_TARGETS
        "host-x86_64-unknown-linux-gnu-")
    set(FTRAIN_LINEAR_CE_BUNDLE_INPUTS "")
    list(LENGTH FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS FTRAIN_LINEAR_CE_ARCH_COUNT)
    math(EXPR FTRAIN_LINEAR_CE_LAST_ARCH_INDEX "${FTRAIN_LINEAR_CE_ARCH_COUNT} - 1")
    foreach(FTRAIN_LINEAR_CE_INDEX RANGE ${FTRAIN_LINEAR_CE_LAST_ARCH_INDEX})
      list(GET FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS ${FTRAIN_LINEAR_CE_INDEX}
           FTRAIN_LINEAR_CE_ARCH)
      list(GET FTRAIN_LINEAR_CE_ASSEMBLY_SOURCES ${FTRAIN_LINEAR_CE_INDEX}
           FTRAIN_LINEAR_CE_SOURCE)
      set(FTRAIN_LINEAR_CE_CODE_OBJECT
          "${CMAKE_CURRENT_BINARY_DIR}/linear_ce_forward_${FTRAIN_LINEAR_CE_ARCH}.co")
      add_custom_command(
        OUTPUT "${FTRAIN_LINEAR_CE_CODE_OBJECT}"
        COMMAND "${FTRAIN_DTK_CLANG}" -x assembler -target amdgcn-amd-amdhsa
                -mcode-object-version=4 -mcpu=${FTRAIN_LINEAR_CE_ARCH}
                "${FTRAIN_LINEAR_CE_SOURCE}" -o
                "${FTRAIN_LINEAR_CE_CODE_OBJECT}"
        DEPENDS "${FTRAIN_LINEAR_CE_SOURCE}"
        COMMENT "Assembling Linear CE ${FTRAIN_LINEAR_CE_ARCH} forward kernel")
      list(APPEND FTRAIN_LINEAR_CE_CODE_OBJECTS "${FTRAIN_LINEAR_CE_CODE_OBJECT}")
      list(APPEND FTRAIN_LINEAR_CE_BUNDLE_TARGETS
           "hipv4-amdgcn-amdhsa--${FTRAIN_LINEAR_CE_ARCH}")
      list(APPEND FTRAIN_LINEAR_CE_BUNDLE_INPUTS
           "--input=${FTRAIN_LINEAR_CE_CODE_OBJECT}")
    endforeach()

    set(FTRAIN_LINEAR_CE_CODE_OBJECT_HOST
        "${CMAKE_CURRENT_BINARY_DIR}/linear_ce_forward_linked.o")
    set(FTRAIN_LINEAR_CE_ADAPTER_OBJECT
        "${CMAKE_CURRENT_BINARY_DIR}/linear_ce_forward_adapter.o")
    set(FTRAIN_LINEAR_CE_BUNDLE
        "${CMAKE_CURRENT_BINARY_DIR}/linear_ce_forward.bundle")
    set(FTRAIN_LINEAR_CE_EMPTY_HOST
        "${CMAKE_CURRENT_BINARY_DIR}/linear_ce_forward.empty")
    file(WRITE "${FTRAIN_LINEAR_CE_EMPTY_HOST}" "")

    set(FTRAIN_LINEAR_CE_HIP_ARCH_OPTIONS "")
    foreach(FTRAIN_LINEAR_CE_ARCH IN LISTS FTRAIN_LINEAR_CE_ASSEMBLY_ARCHS)
      list(APPEND FTRAIN_LINEAR_CE_HIP_ARCH_OPTIONS
           "--offload-arch=${FTRAIN_LINEAR_CE_ARCH}")
    endforeach()
    add_custom_command(
      OUTPUT "${FTRAIN_LINEAR_CE_ADAPTER_OBJECT}"
      COMMAND "${FTRAIN_DTK_HIPCC}" -O2 -std=c++17
              ${FTRAIN_LINEAR_CE_HIP_ARCH_OPTIONS}
              -DFTRAIN_LINEAR_CE_FORWARD_FAMILY_A=1 -fPIC -c
              "${CMAKE_CURRENT_SOURCE_DIR}/primitive/hygon/linear_ce/forward_assembly_adapter.hip"
              -I"${CMAKE_CURRENT_SOURCE_DIR}/primitive/hygon/linear_ce"
              -I"${PROJECT_SOURCE_DIR}/include" -I"${CMAKE_CURRENT_SOURCE_DIR}/include"
              -I"${PROJECT_BINARY_DIR}/include"
              -o "${FTRAIN_LINEAR_CE_ADAPTER_OBJECT}"
      DEPENDS ${FTRAIN_LINEAR_CE_CODE_OBJECTS}
              "${CMAKE_CURRENT_SOURCE_DIR}/primitive/hygon/linear_ce/forward_assembly_adapter.hip"
              "${CMAKE_CURRENT_SOURCE_DIR}/primitive/hygon/linear_ce/launch.hpp"
      COMMENT "Compiling Linear CE multi-architecture assembly adapter")

    string(JOIN "," FTRAIN_LINEAR_CE_BUNDLE_TARGET_LIST
           ${FTRAIN_LINEAR_CE_BUNDLE_TARGETS})
    add_custom_command(
      OUTPUT "${FTRAIN_LINEAR_CE_BUNDLE}"
      COMMAND "${FTRAIN_DTK_BUNDLER}" --type=o
              "--targets=${FTRAIN_LINEAR_CE_BUNDLE_TARGET_LIST}"
              "--input=${FTRAIN_LINEAR_CE_EMPTY_HOST}"
              ${FTRAIN_LINEAR_CE_BUNDLE_INPUTS}
              "--output=${FTRAIN_LINEAR_CE_BUNDLE}"
      DEPENDS "${FTRAIN_LINEAR_CE_EMPTY_HOST}" ${FTRAIN_LINEAR_CE_CODE_OBJECTS}
      COMMENT "Bundling Linear CE multi-architecture code objects")
    add_custom_command(
      OUTPUT "${FTRAIN_LINEAR_CE_CODE_OBJECT_HOST}"
      COMMAND "${CMAKE_COMMAND}" -E copy "${FTRAIN_LINEAR_CE_ADAPTER_OBJECT}"
              "${FTRAIN_LINEAR_CE_CODE_OBJECT_HOST}"
      COMMAND "${FTRAIN_DTK_OBJCOPY}" --update-section
              ".hip_fatbin=${FTRAIN_LINEAR_CE_BUNDLE}"
              "${FTRAIN_LINEAR_CE_CODE_OBJECT_HOST}"
      DEPENDS "${FTRAIN_LINEAR_CE_ADAPTER_OBJECT}" "${FTRAIN_LINEAR_CE_BUNDLE}"
      COMMENT "Embedding Linear CE multi-architecture fatbin into the shared-library object")
    set_source_files_properties("${FTRAIN_LINEAR_CE_CODE_OBJECT_HOST}"
                                PROPERTIES GENERATED TRUE EXTERNAL_OBJECT TRUE)
    set(FTRAIN_LINEAR_CE_ASSEMBLY_OBJECT
        "${FTRAIN_LINEAR_CE_CODE_OBJECT_HOST}")
    add_library(flash_train_linear_ce_assembly STATIC EXCLUDE_FROM_ALL
                "${FTRAIN_LINEAR_CE_ASSEMBLY_OBJECT}")
    set_target_properties(flash_train_linear_ce_assembly
                          PROPERTIES LINKER_LANGUAGE CXX
                                     POSITION_INDEPENDENT_CODE ON)
  endif()
  target_sources(
    flash_train_impl
    PRIVATE primitive/hygon/gemm/fp32_gemm.cpp
            primitive/hygon/gemm/fp32_gemm.hip
            primitive/hygon/linear_ce/forward_finalize.cpp
            primitive/hygon/linear_ce/forward_finalize.hip
            primitive/hygon/linear_ce/forward_partials.cpp
            primitive/hygon/linear_ce/forward_partials.hip
            primitive/hygon/linear_ce/backward.cpp
            primitive/hygon/linear_ce/backward.hip)
  target_include_directories(flash_train_impl PRIVATE "${FTRAIN_ROCBLAS_INCLUDE_DIR}")
  target_compile_options(flash_train_impl PRIVATE -Wno-return-type-void-func)
  target_link_libraries(flash_train_impl PUBLIC hip::host)
  target_link_libraries(flash_train_impl PUBLIC "${FTRAIN_ROCBLAS_LIBRARY}")
  target_link_libraries(flash_train_impl PRIVATE ROCTX::roctx)
  if(FTRAIN_LINEAR_CE_ASSEMBLY_OBJECT)
    target_compile_definitions(flash_train_impl PRIVATE FTRAIN_LINEAR_CE_FORWARD_EMBEDDED=1)
  endif()
endif()

if(FTRAIN_BUILD_SHARED_LIBS)
  target_compile_definitions(flash_train_impl PRIVATE FTRAIN_BUILDING)
else()
  target_compile_definitions(flash_train_impl PRIVATE FTRAIN_STATIC)
endif()

add_library(flash_train ${FTRAIN_LIBRARY_TYPE})
target_sources(flash_train PRIVATE $<TARGET_OBJECTS:flash_train_impl>)
add_library(flash_train::flash_train ALIAS flash_train)
target_link_libraries(flash_train PRIVATE Threads::Threads)

target_sources(
  flash_train
  PUBLIC FILE_SET
  HEADERS
  BASE_DIRS
  "${PROJECT_BINARY_DIR}/include"
  "${PROJECT_SOURCE_DIR}/include"
  FILES
  "${PROJECT_BINARY_DIR}/include/flash_train/control.h"
  "${PROJECT_BINARY_DIR}/include/flash_train/version.h"
  "${PROJECT_SOURCE_DIR}/include/flash_train/common.h"
  "${PROJECT_SOURCE_DIR}/include/flash_train/env.h"
  "${PROJECT_SOURCE_DIR}/include/flash_train/flash_train.h")

if(FTRAIN_BUILD_SHARED_LIBS)
  # A binding build ships the library inside the wheel as one unversioned
  # file next to the extension module.
  if(NOT FTRAIN_BUILD_WHEEL)
    set_target_properties(
      flash_train PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION
                                                      ${PROJECT_VERSION_MAJOR})
  endif()
else()
  target_compile_definitions(flash_train PUBLIC FTRAIN_STATIC)
endif()

if(FTRAIN_PLATFORM_HYGON_HIP)
  target_link_libraries(flash_train PUBLIC hip::host)
  target_link_libraries(flash_train PUBLIC "${FTRAIN_ROCBLAS_LIBRARY}")
  target_link_libraries(flash_train PRIVATE ROCTX::roctx)
  if(TARGET flash_train_linear_ce_assembly)
    target_link_libraries(flash_train PRIVATE flash_train_linear_ce_assembly)
  endif()
endif()
