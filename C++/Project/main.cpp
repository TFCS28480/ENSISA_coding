#include "inc\Polynome.h"
#include <iostream>

int main() {
    float coeffs1[] = {1.0f, 5.0f, 6.0f}; // Représente 3 + 5.5x + 2.1x^2
    float coeffs2[] = {1.0f, -4.0f, 6.0f}; // Représente 1 - 4.2x + 6.3x^2

    Polynome P1(2, coeffs1);
    Polynome P2(2, coeffs2);

    Polynome P3 = P1 + P2;
    Polynome P4 = P1 - P2;
	Polynome P5 = P1 * P2;

    std::cout << "P1: " << P1 << std::endl;
    std::cout << "P2: " << P2 << std::endl;
    std::cout << "P1 + P2 = " << P3 << std::endl;
    std::cout << "P1 - P2 = " << P4 << std::endl;
	std::cout << "P1 * P2 = " << P5 << std::endl;
	
	

    return 0;
}
