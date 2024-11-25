#include "..\inc\Matrice.h"

Matrice::Matrice() : elem(nullptr), ligne(0), colonne(0) {}
	
Matrice::Matrice(int ligne, int colonne) : ligne(ligne), colonne(colonne) {
		elem = new int* [ligne];
		for (int i = 0; i < ligne; i++) {
			elem[i] = new int [colonne];
		}
		
		for (int i = 0; i < ligne; i++) {
			for (int j = 0; j < colonne; j++) {
				elem[i][j] = 0;
			}
		}
	}
	
Matrice::~Matrice() {
	for (int i = 0; i < ligne; i++) {
		delete[] elem[i];
	}
	delete[] elem;
}

void Matrice::setElem() {
	std::cout << "Entrez les coefficients de la matrice : \n";
	for (int i = 0; i < ligne; i++) {
		for (int j = 0; j < colonne; j++) {
			std::cout << "Element [" << i << "][" << j << "]: ";
			std::cin >> elem[i][j];
		}
	}
}
	
void Matrice::showElem() {
	std::cout << "La matrice est : \n";
	for (int i = 0; i < ligne; i++) {
		std::cout << "Ligne " << i << ": ";
		for (int j = 0; j < colonne; j++) {
			std::cout << "[ " << elem[i][j] << " ]";
		}
		std::cout << " \n";
	}
}
	

	
