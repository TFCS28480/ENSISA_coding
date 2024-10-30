#ifndef LINE_H 
#define LINE_H 

#include "geometric.h" 
#include "point.h" 

class Line :public Geometric { 
    public: 
        Line(){}; 
        Line(const Point& , const Point&); 
        virtual ~Line() = default; 
        
        virtual void move(int, int);  
        Point getStart() const; 
        Point getEnd() const; 
    
    protected: 
        ostream& PrintOn(ostream&) const; 
        
    private: 
        Point start, end; 
}

#endif