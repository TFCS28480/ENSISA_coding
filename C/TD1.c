#include <stdio.h>
#include <stdlib.h>

int TD1_ex1() {

    printf("*******************************\n");
    printf("*   BIENVENUE DANS LE MONDE   *\n");
    printf("*  MAGIQUE DE PROGRAMMATION   *\n");
    printf("*  Programme écrit par Théo FARCASIU  *");
    printf("*******************************\n");
    return 0;
}
int TD1_ex2() {
    int a;
    a = 5;
    printf("Votre entier est : %d",a);
    return 0;
}
int TD1_ex3()  {
    int x, y, z;
    float w;
    printf("donner un réel: \n");
    scanf("%d",&x);
    printf("donner un deuxième réel:\n");
    scanf("%d",&y);
    z=x/y;
    w = x%y;
    printf("%d/%d=%d \n",x,y,z);
    printf("Le quotient de la division de %d par %d = %d \n", x,y,z);
    printf("Le reste de la division de %d par %d = %f \n", x,y,w);  //valeur de w en float -> %f
    return 0;
}
int TD1_ex4()  {
    int n,S;
    S=0;
    printf("donner le nombre 1:");
    scanf("%d",&n);
    S = S+n;
    printf("donner le nombre 2:");
    scanf("%d",&n);
    S = S+n;
    printf("donner le nombre 3:");
    scanf("%d",&n);
    S = S+n;
    printf("%d",S);
}
int TD1_ex5_1()  {
    int n,p,R;
    printf("donner le nombre 1:");
    scanf("%d",&n);
    printf("donner le nombre 2:");
    scanf("%d",&p);
    R=((n+p)*3)-10;
    printf("%d",R);
}
int TD1_ex5_3()  {
    int n, R;
    printf("donner la température en degré :");
    scanf("%d",&n);
    R=((9/50)*n)+32;
    printf("Il fait %d degré Celsius",R);
}
int TD1_ex6()  {
    int r;
    float A, S;
    printf("choisissez le rayon du cercle :");
    scanf("%d",&r);
    A=2*3.141592*r;
    S=3.141592*r*r;
    printf("Pour un rayon r=%d, on a une aire A=%f et une surface S=%f", r,A,S);
}
int TD1_ex7()  {
    float a, b, c;
    printf("choisissez un premier nombre :");
    scanf("%f",&a);
    printf("choisissez un deuxième nombre :");
    scanf("%f",&b);
    c=(a+b)*(a+b);
    printf("Le résultat est %f", c);
}
int TD1_ex8()  {
    float a,b,c,d;
    float x1,x2;
    printf("choisissez un premier nombre :");
    scanf("%f",&a);
    printf("choisissez un deuxième nombre :");
    scanf("%f",&b);
    printf("choisissez un troisième nombre :");
    scanf("%f",&c);
    d=b*b-4*a*c;
    x1=(-b+sqrt(d))/(2*a);
    x2=(-b-sqrt(d))/(2*a);
    printf("Les résultats sont %f et %f",x1,x2);
}

int main()
{
    //TD1_ex1();
    //TD1_ex2();
    //TD1_ex3();
    //TD1_ex4();
    //TD1_ex5_1();
    //TD1_ex5_3();
    //TD1_ex6();
    //TD1_ex7();
    TD1_ex8();
    return 0;
}
