#include <iostream>

#ifndef MATRICE_H
#define MATRICE_H

class Matrice {
	private:
	int** elem;
	int ligne;
	int colonne;
	
	public:
	Matrice();
	Matrice(int ligne, int colonne);
	~Matrice();
	
	void setElem();
	void showElem();
};

#endif //MATRICE_H