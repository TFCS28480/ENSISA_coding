#ifndef VALUE_H 
#define VALUE_H 

#include "base.h" 

template <class T> 

class Value :public Base { 
    public:  
        Value(const T& v=T());  
        virtual ~Value() = default;  
        
        T GetValue() const;  
        void SetValue(const T&);  
        
        virtual ostream& Complex::PrintOn(ostream& os) const; 
        
    private:  
        T value; 
}; 
    
//operator / 
template<class T> 
Value<T> operator /(const Value<T>& left, const Value<T>& right) {  
    if(right.getValue()==0)   
        throw "division by zero";  
    return Value<T>(left.getValue()/right.getValue()); 
}