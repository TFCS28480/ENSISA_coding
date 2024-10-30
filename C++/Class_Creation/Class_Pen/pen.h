#ifndef PEN_H 
#define PEN_H 
class Pen { 
    public:  
        Pen();  
        Pen(int, int);  
        virtual ~Pen() = default;  
        
        void move (int, int);  
        void up();  
        void down();  
        int getX() const;  
        int getY() const;  
        bool getState() const; 
        
    private:  
        int x,y;  
        bool state; 
}; 
        
#endif