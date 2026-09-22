#include "vector_ops.hpp"
#include <immintrin.h>

void add_scalar(const float* a,const float* b,float* result,std::size_t size)
{
    for (std::size_t i = 0; i < size; ++i)
    {
        result[i] = a[i] + b[i];
    }
}


void add_avx2(const float* a,const float* b,float* result,std::size_t size)
{
    std::size_t i = 0;
    for (; i + 8 <= size; i += 8)
    {
        __m256 va = _mm256_loadu_ps(a + i);
        __m256 vb = _mm256_loadu_ps(b + i);
        __m256 vr = _mm256_add_ps(va, vb);
        _mm256_storeu_ps(result + i, vr);
    }

    for(;i< size;i++)
    {
        result[i] = a[i] + b[i];
    }
}