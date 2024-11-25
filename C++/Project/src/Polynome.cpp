//
// Created by yoanp on 07/11/2024.
//

#include "..\inc\Polynome.h"

// Constructeur par défaut
Polynome::Polynome() : degre(0) {
    // Alloue de la mémoire pour un seul coefficient, initialisé à 1.0
    coeff = new float[1];
    coeff[0] = 1.0f;
}

Polynome::Polynome(unsigned int deg,const float* coeffs) : degre(deg) {
    coeff = new float[deg + 1];
    for (unsigned int i = 0; i < deg + 1; i++) {
        coeff[i] = coeffs[i];
    }
}

// Destructeur
Polynome::~Polynome() {
    // Libère la mémoire allouée pour les coefficients
    delete[] coeff;
}

void Polynome::getDegre()

void Polynome::printPolynome() {
	for (unsigned int i=0; i<P.degre +1; i++) {
		std::cout << "Le polynome est :" << coeff[i] << "x**" << i << " + ";
	}
}

void Polynome::afficher() const {
    for (int i = degre; i >= 0; --i) {
        if (coeff[i] != 0.0) {
            std::cout << coeff[i] << "x^" << i;
            if (i > 0 && coeff[i - 1] >= 0) {
                std::cout << " + ";
            }
            else if (i > 0) {
                std::cout << " ";
            }
        }
    }
    std::cout << std::endl;
}

// Surcharge de l'opérateur << pour afficher les informations du polynôme
std::ostream& operator<<(std::ostream& os, const Polynome& p) {
    os << "Degre: " << p.degre << ", Coefficients: [";
    for (unsigned int i = 0; i <= p.degre; ++i) {
        os << p.coeff[i];
        if (i < p.degre) {
            os << ", ";
        }
    }
    os << "]";
    return os;
}

// Surcharge de l'opérateur + pour additionner 2 polynômes
Polynome operator+(const Polynome& P,const Polynome& Q ) {
    unsigned int max_deg = std::max(P.degre,Q.degre);
    float* coeff = new float[max_deg + 1];

    for (unsigned int i = 0; i < max_deg + 1; i++) {
        float coeff_P = (i<=P.degre) ? P.coeff[i] : 0.0f;
        float coeff_Q = (i<=Q.degre) ? Q.coeff[i] : 0.0f;
        coeff[i] = coeff_P + coeff_Q;
    }
	
    Polynome result = Polynome(max_deg,coeff);

    delete[] coeff;
    return result;
}

// Surcharge de l'opérateur - pour soustraire 2 polynômes
Polynome operator-(const Polynome& P,const Polynome& Q ) {
    unsigned int max_deg = std::max(P.degre,Q.degre);
    float* coeff = new float[max_deg + 1];

    for (unsigned int i = 0; i < max_deg + 1; i++) {
        float coeff_P = (i<=P.degre) ? P.coeff[i] : 0.0f;
        float coeff_Q = (i<=Q.degre) ? Q.coeff[i] : 0.0f;
        coeff[i] = coeff_P - coeff_Q;
    }

    while ( max_deg > 0 && coeff[max_deg] == 0.0f ) {
        max_deg--;
    }

    Polynome result = Polynome(max_deg,coeff);

    delete[] coeff;
    return result;
}

Polynome operator*(const Polynome& P,const Polynome& Q ) { 
    unsigned int max_deg = P.degre + Q.degre;
    float* coeff = new float[max_deg + 1];

    for (unsigned int i = 0; i < P.degre +1; i++) {
		for (unsigned int j = 0; j < Q.degre +1; j++) {
			coeff[i+j] += P.coeff[i] * Q.coeff[j];
		}
	}
	
	Polynome result = Polynome(max_deg,coeff);

    delete[] coeff;
    return result;
}