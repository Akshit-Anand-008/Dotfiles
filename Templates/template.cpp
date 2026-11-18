#include <iostream>
#include <vector>
using ll = long long;
using vint = std::vector<int>;

template <typename T>
void vprint(T& V) {
    for (auto& i : V) { std::cout << i << " "; }
    std::cout << std::endl;;
}

template <typename T>
void pprint(T& P) {
    for (auto& i : P) { std::cout << i.first << " " << i.second << "\n"; }
    std::cout << std::endl;;
}

int main(int argc, char** argv) {}
