#pragma once

#include <cstddef>

void add_scalar(const float* a, const float* b, float* result, std::size_t size);
void add_avx2(const float* a, const float* b, float* result, std::size_t size);
void scale_scalar(const float* a, float scalar, float* result, size_t size);
void scale_avx2(const float* a, float scalar, float* result, size_t size);
float dot_scalar(const float* a,const float* b,size_t size);
float dot_avx2(const float* a , const float* b, size_t size);