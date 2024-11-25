#include "..\inc\FonctionTransfert.h"
#include <iostream>

FonctionTransfert::FonctionTransfert () {}

FonctionTransfert::FonctionTransfert(const Polynome& numerateur, const Polynome& denominateur) 
	: numerateur(numerateur), denominateur(denominateur) {}
	
FonctionTransfert::~FonctionTransfert() {}

void FonctionTransfert::afficher() const {
	std::cout << "\n";
	numerateur.afficher();
	std::cout<<"------------------------------------"<<std::endl;
	denominateur.afficher();
}

