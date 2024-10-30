#ifndef COMPLEX_H 
#define COMPLEX_H  

class Complex  {  
    public: 
        Complex(double re, double im=0);  
        virtual ~Complex() = defautl;  

        Complex operator+(const Complex&) const;  
        operator double()const;  
        double module()const; 
        
        ostream& Complex::printOn(ostream&) const  
        
    private: 
        double re, im;  
}; 

#endif