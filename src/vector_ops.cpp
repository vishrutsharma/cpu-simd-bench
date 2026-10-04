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


void scale_scalar(const float* a, float scalar, float* result, size_t size)
{
    for (size_t i = 0 ; i < size ; i++)
    {
        result[i] = a[i] * scalar;
    }
}

void scale_avx2(const float* a,float scalar, float* result, size_t size)
{
    unsigned int i = 0;
    __m256 scalarReg = _mm256_set1_ps(scalar);
    
    for(;i + 8 < size; i+=8)
    {
        __m256 va = _mm256_loadu_ps(a + i);
        __m256 vr = _mm256_mul_ps(va,scalarReg);
        _mm256_storeu_ps(result + i, vr);
    }

    for (; i < size; ++i)
    {
        result[i] = a[i] * scalar;
    }
}

float dot_scalar(
    const float* a,
    const float* b,
    size_t size)
{
    float sum = 0.0f;

    for (size_t i = 0; i < size; ++i)
    {
        sum += a[i] * b[i];
    }

    return sum;
}

float dot_avx2(const float* a , const float* b , size_t size)
{
    unsigned int i = 0;
    __m256 vsum = _mm256_setzero_ps();

    for (; i + 8 <= size; i += 8)
    {
        __m256 va = _mm256_loadu_ps(a + i);
        __m256 vb = _mm256_loadu_ps(b + i);

        __m256 product = _mm256_mul_ps(va, vb);

        vsum = _mm256_add_ps(vsum, product);
    }

    float sum = 0.0f;

    alignas(32) float temp[8];

    _mm256_store_ps(temp, vsum);

    for (int j = 0; j < 8; ++j)
    {
        sum += temp[j];
    }

    for (; i < size; ++i)
    {
        sum += a[i] * b[i];
    }

    return sum;

}