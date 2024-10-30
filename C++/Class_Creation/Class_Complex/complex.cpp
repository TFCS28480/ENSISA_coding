#include "complex.h" 

Complex::Complex(double _re, double _im): re(_re), im(_im) 
    { } 
    
ostream& Complex::printOn(ostream& os) const {  
    return os << re<< " +i "<< im; 
} 

Complex Complex::operator +(const Complex& c) const {  
    return Complex(re+c.re, im+c.im); 
} 

double Complex::module()const {  
    return sqrt(re*re+im*im); 
} 

Complex:: operator double()const {  
    return module(); 
    }