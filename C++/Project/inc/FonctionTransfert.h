#include <iostream>
#include "Polynome.h"

#ifndef FONCTIONTRANSFERT_H
#define FONCTIONTRANSFERT_H

class FonctionTransfert : public Polynome {
	public :
		// Constructeur et Destructeur 
		FonctionTransfert(); 
		FonctionTransfert(const Polynome& numerateur,const Polynome& denominateur);
		virtual ~FonctionTransfert();
		
		void setFT() const;
		void afficher() const;
		
		// Surcharge
		
	private:
		Polynome numerateur;
		Polynome denominateur;
};

#endif