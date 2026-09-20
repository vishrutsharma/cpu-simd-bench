#pragma once

#include <cstddef>

void add_scalar(
    const float* a,
    const float* b,
    float* result,
    std::size_t size
);

void add_avx2(
    const float* a,
    const float* b,
    float* result,
    std::size_t size
);