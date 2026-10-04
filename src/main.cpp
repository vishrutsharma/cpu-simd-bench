#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

#include "benchmark.hpp"
#include "vector_ops.hpp"

int main()
{
    constexpr size_t iterations = 10;
    const size_t sizes[] = {16 * 1024, 64 * 1024, 256 * 1024, 1024 * 1024, 4 * 1024 * 1024, 16 * 1024 * 1024};
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

        // ========================================================= // VECTOR ADDITION // =========================================================
        add_scalar(a.data(), b.data(), scalar_result.data(), size);
        add_avx2(a.data(), b.data(), avx_result.data(), size);

        double add_difference = 0.0;
        for (size_t i = 0; i < size; ++i)
        {
            add_difference = std::max(add_difference, std::abs(static_cast<double>(scalar_result[i]) - static_cast<double>(avx_result[i])));
        }

        double scalar_add_time = benchmark([&]()
                                           { add_scalar(a.data(), b.data(), scalar_result.data(), size); }, iterations);

        double avx_add_time = benchmark([&]()
                                        { add_avx2(a.data(), b.data(), avx_result.data(), size); }, iterations);

        scalar_add_time /= iterations;
        avx_add_time /= iterations;

        double add_bytes = static_cast<double>(size) * 12.0;
        double scalar_add_gbps = (add_bytes / scalar_add_time) / 1e9;
        double avx_add_gbps = (add_bytes / avx_add_time) / 1e9;
        double add_speedup = scalar_add_time / avx_add_time;

        // ========================================================= // DOT PRODUCT // =========================================================
        float scalar_dot = dot_scalar(a.data(), b.data(), size);
        float avx_dot = dot_avx2(a.data(), b.data(), size);
        double dot_difference = std::abs(static_cast<double>(scalar_dot) - static_cast<double>(avx_dot));
        double scalar_dot_time = benchmark([&]()
                                           { dot_scalar(a.data(), b.data(), size); }, iterations);

        double avx_dot_time = benchmark([&]()
                                        { dot_avx2(a.data(), b.data(), size); }, iterations);

        scalar_dot_time /= iterations;
        avx_dot_time /= iterations;

        double dot_bytes = static_cast<double>(size) * 8.0;
        double scalar_dot_gbps = (dot_bytes / scalar_dot_time) / 1e9;
        double avx_dot_gbps = (dot_bytes / avx_dot_time) / 1e9;
        double dot_speedup = scalar_dot_time / avx_dot_time;

        // ========================================================= // PRINT RESULTS // =========================================================

        std::cout << "\n--- Vector Addition ---\n";
        std::cout << "Scalar: " << scalar_add_time * 1'000'000 << " us\n";
        std::cout << "AVX2: " << avx_add_time * 1'000'000 << " us\n";
        std::cout << "Speedup: " << add_speedup << "x\n";
        std::cout << "Scalar BW: " << scalar_add_gbps << " GB/s\n";
        std::cout << "AVX2 BW: " << avx_add_gbps << " GB/s\n";
        std::cout << "Difference: " << add_difference << "\n";

        std::cout << "\n--- Dot Product ---\n";

        std::cout << "Scalar: " << scalar_dot_time * 1'000'000 << " us\n";
        std::cout << "AVX2: " << avx_dot_time * 1'000'000 << " us\n";
        std::cout << "Speedup: " << dot_speedup << "x\n";
        std::cout << "Scalar BW: " << scalar_dot_gbps << " GB/s\n";
        std::cout << "AVX2 BW: " << avx_dot_gbps << " GB/s\n";
        std::cout << "Difference: " << dot_difference << "\n";
    }
    return 0;
}