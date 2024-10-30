#include <stdio.h>
#include <stdlib.h>

int TD2_ex1() {
    int r;
    printf("donner un entier ");
    scanf("%d",&r);
    if (r<0)
        printf("Le nombre %d est négatif",r);
            if (r>0)
                printf("Le nombre %d est positif",r);
            else
                printf("Le nombre %d est nul",r);

}

int TD2_ex2() {
    int a,b;
    printf("Donner un entier A\n");
    scanf("%d",&a);
    printf("Donner un entier B\n");
    scanf("%d",&b);
    if (a>b)
        printf("A=%d est supérieure à B=%d", a, b);
    if (a=b)
        printf("on a A=B=%d", a);
    else
        printf("A=%d est inférieure à B=%d", a, b); //Le cas A=B n'est pas pris en compte
    return 0;
}

int TD2_ex3() {
    int N,i,R;
    printf("Donner un nombre : \n");
    scanf("%d",&N);
    for (i=1;i<=10;i++)
    {
        R=N*i;
        printf("%d * %d = %d \n",N,i,R); }
    return 0;
}

int TD2_ex4() {
    int N,S=0,P=1,M=0;
    printf("Donner un nombre : \n");
    scanf("%d",&N);
    for (int i=1;i<=N;i++) {
        S=S+N;
        P=P*N;
    }
    M=S/N;
    printf("La somme des %d premiers entiers est %d, le produit est %d et la moyenne est %d",N,S,P,M);
}

int TD2_ex5() {
    int N;
    printf("Donner un nombre : \n");
    scanf("%d",&N);
    if (N%2 == 0)
        printf("L'entier est pair");
    else
        printf("L'entier est impair");
}

int TD2_ex6()  {
    float a,b,c,d;
    float x1,x2,x0;
    printf("choisissez un premier nombre :");
    scanf("%f",&a);
    printf("choisissez un deuxième nombre :");
    scanf("%f",&b);
    printf("choisissez un troisième nombre :");
    scanf("%f",&c);
    d=b*b-4*a*c;
    if (d>0) {
        x1=(-b+sqrt(d))/(2*a);
        x2=(-b-sqrt(d))/(2*a);
        printf("Les résultats sont %f et %f",x1,x2);}
    if (d=0) {
        x0=(-b)/2*a;
        printf("La racine est double et vaut %f",x0);}
    else
        printf("Les résultats ne sont pas réels");
}

int TD2_ex7() {
    float a;
    printf("Quelle est la moyenne ?");
    scanf("%f",&a);
    if (a>=10 && a<12)
        printf("Sa mention est Passable");
    if (a>=12 && a<14)
        printf("Sa mention est 'Assez bien'");
    if (a>=14 && a<16)
        printf("Sa mention est 'Bien'");
    else
        printf("Sa mention est 'Très bien'");
}

int TD2_ex8() {
    int a,b,S=0;
    printf("Donner un nombre : \n");
    scanf("%d",&a);
    printf("Donner un 2 ème nombre : \n");
    scanf("%d",&b);
    for (int i=1;i<=b;i++)
        S=S+a;
    printf("Le produit de %d et %d vaut %d",a,b,S);
}

int TD2_ex9() {
    int a,i=1,F=1;
    printf("Donner un nombre dont vous souhaitez le factorielle: \n");
    scanf("%d",&a);
   // while (i<=a) {
   //     F=F*i;
   //     i++;}
    for (i=1;i<=a;i++) {
        F=F*i; }
    printf("le résultat est %d",F);
}

int TD2_ex10(){
    int i, j=0, s, ligne;
    printf("Entrez le nombre de lignes: ");
    scanf("%d",&ligne);
    for(i=1; i<=ligne; ++i, j=0) {
        for(s=1; s<=ligne-i; ++s)
        {
            printf("  ");
        }
        while(j != 2*i-1)
        {
            printf("* ");
            ++j;
        }
        printf("\n");
    }
    return 0;
}

int TD2_ex11(){
    int a,b, B=0, m=0, pos=0, neg=0, P=0, I=0, M=0, N=0;
    printf("Donner le nombre d'entier \n");
    scanf("%d",&a);
    for (int i=1;i<=a;i++) {
        printf("Donner un nombre d'entier \n");
        scanf("%d",&b);
        if (b%2 == 0)
            P++;
        else
            I++;
        if (b<0)
            neg++;
        else
            pos++;
        if (b>B)
            B=b;
        if  (b<m)
            m=b;}
    printf("Il a %d nombres pairs, %d nombres impairs, %d nombres positifs, %d nombres négatifs, le max est %d et le min est %d",P,I,pos,neg,M,m);
}

int main() {
    //TD2_ex1();
    //TD2_ex2();
    //TD2_ex3();
    //TD2_ex4();
    //TD2_ex5();
    //TD2_ex6();
    //TD2_ex7();
    //TD2_ex8();
    //TD2_ex9();
    //TD2_ex10();
    TD2_ex11();
    return 0;
}
