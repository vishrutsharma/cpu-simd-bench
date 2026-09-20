#include <iostream>
#include <vector>

#include "benchmark.hpp"
#include "vector_ops.hpp"
using namespace std;
int main()
{
    constexpr std::size_t size = 16216;

    std::vector<float> a(size);
    std::vector<float> b(size);
    std::vector<float> result(size);
    std::vector<float> avx_result(size);

    for (std::size_t i = 0; i < size; ++i)
    {
        a[i] = static_cast<float>(i);
        b[i] = static_cast<float>(i * 10);
    }

   auto scalar_result =  benchmark([&]()
                {
                    add_scalar(a.data(),b.data(),result.data(),size);
                },100);
 
    
    auto vector_result =  benchmark([&]()
                {
                    add_avx2(a.data(),b.data(),avx_result.data(),size);
                },100);
    
    
    double scalar_time = scalar_result;
    double vector_time = vector_result;

    cout << '\n';
    cout<<"Scalar Operation Duration: "<<scalar_time * 1000.0<<'\n';
    cout<<"Vector Operation Duration: "<<vector_time * 1000.0;
    
    cout << '\n';

    return 0;
}