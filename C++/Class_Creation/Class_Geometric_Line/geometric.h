#ifndef GEOMETRIC_H 
#define GEOMETRIC_H 

#include "base.h" 

class Geometric :public Base{ 
    public: 
        virtual ~Geometric() = default; 
        virtual void move(int, int)=0; 
}; 

#endif