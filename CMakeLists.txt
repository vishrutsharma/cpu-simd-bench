cmake_minimum_required(VERSION 3.20)
project(cpu_simd_bench
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(cpu_simd_bench
    src/main.cpp
    src/vector_ops.cpp
)

set_target_properties(cpu_simd_bench PROPERTIES
    WIN32_EXECUTABLE FALSE
)

target_compile_options(cpu_simd_bench
    PRIVATE
        -mavx2
)

target_include_directories(cpu_simd_bench
    PRIVATE
        include
)