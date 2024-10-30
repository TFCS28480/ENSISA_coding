#include "line.h" 

Line::Line(const Point& _start, const Point& _end): 
    start(_start), end(_end) 
{ } 

void Line::move(int dx, int dy) {  
    start.move(dx, dy);  
    end.move(dx, dy); 
} 

Point Line::getStart() const {  
    return start; 
} 

Point Line::getEnd() const {  
    return end; 
} 

ostream& Line::printOn(ostream& os )const {  
    os << "line(" << start << ‘,’ << end << ‘)';  
    return os; 
}