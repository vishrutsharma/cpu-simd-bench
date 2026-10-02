#include <iostream>
#include <vector>

#include "benchmark.hpp"
#include "vector_ops.hpp"

int main()
{
    constexpr size_t iterations = 1;

    const size_t sizes[] =
    {
        16 * 1024,
        64 * 1024,
        256 * 1024,
        1024 * 1024,
        4 * 1024 * 1024,
        16 * 1024 * 1024
    };


    for (size_t size : sizes)
    {      
        std::vector<float> a(size);
        std::vector<float> b(size);
        std::vector<float> scalar_result(size);
        std::vector<float> avx_result(size);

        for (size_t i = 0; i < size; ++i)
        {
            a[i] = static_cast<float>(i);
            b[i] = static_cast<float>(i * 10);
        }

        
        double scalar_time = benchmark(
            [&]()
            {
                add_scalar(
                    a.data(),
                    b.data(),
                    scalar_result.data(),
                    size
                );
            },
            iterations
        );

        
        double avx_time = benchmark(
            [&]()
            {
                add_avx2(
                    a.data(),
                    b.data(),
                    avx_result.data(),
                    size
                );
            },
            iterations
        );

        scalar_time /= iterations;
        avx_time /= iterations;

        double bytes_processed = static_cast<double>(size) * 12.0;
        double scalar_bandwidth = bytes_processed / scalar_time;
        double avx_bandwidth = bytes_processed / avx_time;

        double scalar_gbps = scalar_bandwidth / 1e9;
        double avx_gbps = avx_bandwidth / 1e9;

        std::cout
                << "Size: " << size
                << " | Scalar: " << scalar_time * 1'000'000 << " us"
                << " | AVX2: " << avx_time * 1'000'000 << " us"
                << " | Scalar BW: " << scalar_gbps << " GB/s"
                << " | AVX2 BW: " << avx_gbps << " GB/s"
                << '\n';
    }

    return 0;
}
