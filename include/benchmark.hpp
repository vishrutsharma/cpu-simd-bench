#pragma once
#include <chrono>
using namespace std;

template <typename Function>
double benchmark(Function&& function , size_t iterations)
{
    using clock = chrono::high_resolution_clock;
    auto start = clock::now();

    for(size_t i = 0 ; i < iterations ; i++)
    {
        function();
    }

    auto end = clock::now();

    chrono::duration<double> elapsed = end - start;
    return elapsed.count();
}
