#include "pen.h" 

Pen::Pen():
x(0), y(0), state(false) { } 

Pen::Pen(int _x, int _y): 
x(_x), y(_y), state(false) { } 

void Pen::move (int dx, int dy) {  
    x+=dx;  
    y+=dy; } 
    
void Pen::up() {  
    state = false; } 
    
void Pen::down() {  
    state=true; } 
    
int Pen::getX() const {  
    return x; } 
    
int Pen::getY() const {  
    return y; } 
    
bool Pen::getState() const {  
    return state; }