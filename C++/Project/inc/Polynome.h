//
// Created by yoanp on 07/11/2024.
//
#include <iostream>

#ifndef POLYNOME_H
#define POLYNOME_H

class Polynome {
    public:
	// Constructeur et destructeur
    Polynome(); 
    Polynome(unsigned int degre, const float* coeffs);
	Polynome(const Polynome& p);
    ~Polynome();

	//Méthode
	char Print_Polynome(const Polynome& P);

    // Déclaration de l'opérateur << comme ami pour qu'il puisse accéder aux membres privés
    friend std::ostream& operator<<(std::ostream& os, const Polynome& p);
    friend Polynome operator+(const Polynome& P, const Polynome& Q);
    friend Polynome operator-(const Polynome& P, const Polynome& Q);
    friend Polynome operator*(const Polynome& P, const Polynome& Q);

    private:
    unsigned int degre;
    float* coeff;
};

#endif //POLYNOME_H