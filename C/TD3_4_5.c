#include <stdio.h>
#include <stdlib.h>

/*int TD3_ex1(){
    int T[10];
    for (int i=1;i<=10;i++)
        T[i]=i;
    for (int i=1;i<=10;i++)
        printf ("%d\n",T[i]);
}

int TD3_ex2(){
    int T[]={15,7,30,6,12},a=15;
    for (int i=0;i<=4;i++) {
        if (a<=T[i+1])
            a=T[i+1];
    }
    printf("Le max du tableau est %d",a);
}

int TD3_ex3() {
    int r,a,S, max,min,positionmin,positionmax,debut;
    printf("donner un entier inférieure à 50");
    scanf("%d",&r);
    int T[r],TPOS[r],TNEG[r];
    for (int i=0;i<=r-1;i++) {
        printf("donner un entier");
        scanf("%d",&a);
        T[i]=a; }
    for (int i=0;i<=r-1;i++)
        printf ("%d\n",T[i]);
    for (int i=1;i<=r;i++)
        S=S+T[i];
    printf("La somme des éléments en %d",S);
    for (int i=0 ; i< r ; i++)
      {
          if(T[i]>max){
                max=T[i];
                positionmax=i; }
    printf("La pos de l'élément max est %d et vaut %d",positionmax,max);
    for (int i=0 ; i< r ; i++)
      {
          if(T[i]<min){
                min=T[i];
                positionmin=i; }
    printf("La pos de l'élément min est %d et vaut %d",positionmin,min);
    for (debut=0 ; debut<=(r/2) ;debut++)  {
            T[debut]=T[r-debut];
    }
    for (int i=0 ; i< r ; i++) {
        if (T[i]>=0)
            TPOS[i]=T[i];
        else
            TNEG[i]=T[i];
    }
    for (int i=0;i<r;i++)
        printf ("%d\n",T[i]);
    for (int i=0;i<r;i++)
        printf ("%d\n",TPOS[i]);
    for (int i=0;i<r;i++)
        printf ("%d\n",TNEG[i]);
    }

      }}

int TD3_ex4(){
    int r,S,a;
    printf("donner un entier ");
    scanf("%d",&r);
    int T[r];
    for (int i=0;i<=r-1;i++) {
        printf("donner un entier");
        scanf("%d",&a);
        T[i]=a; }
    for (int i=0;i<r;i++) {
        S=S+T[i];
    }

    printf ("%d",S/r);
}

int TD3_ex5() {
  int matx1[10][10], matx2[10][10], matx3[10][10];
  int i,j,row,col;

  printf("Combien de lignes et de colonnes?\n");
  scanf("%d%d",&row,&col);

  printf("\nEntrez la première matrice:\n");
  for(i=0; i < row; ++i)
    for(j = 0; j < col; ++j)
      scanf("%d",&matx1[i][j]);

  printf("\nEntrez la deuxième matrice:\n");
  for(i = 0; i < row; ++i)
    for(j = 0; j < col; ++j)
      scanf("%d",&matx2[i][j]);

  printf("\n Matrice après l'addition: \n");
  for(i = 0; i < row; ++i)
  {
    for(j=0; j < col; ++j)
    {
      matx3[i][j] = matx1[i][j] + matx2[i][j];
      printf("%d ",matx3[i][j]);
    }
    printf("\n");
  }

  return 0;
}

int TD3_ex6(){
    int i, n=20, k=0, t[25], x;

    for(i=0;i<25;i++){
        t[i]=rand()%21;
    }
    for(i=0;i<n;i++){
        k=0;
        for(x=0;x<n;x++){
            if(t[i]==t[x]){
                k++;
        }   }
    printf("l'element t[%d] apparait %d fois!\n",i,k);
    }
    return 0;
}

int TD3_ex7(){
    char s[]="Hello World";
    printf("%d",strlen(s));
}

int TD3_ex8() {
    char t[]="Hello0";
}

int TD4_ex1(){
    int a,b;
    printf("donner un entier inférieure à 50");
    scanf("%d",&a);
    b=a*a*a;
    printf("Le résultat est %d",b);
}

int TD4_ex3(){
    int a;
    printf("donner un entier");
    scanf("%d",&a);
    if (a<0) printf("a est négatif");
    else printf("a est positif");
}

int TD4_ex4(){
    int a,b,c,d,e;
    printf("donner un entier");
    scanf("%d",&a);
    printf("donner un second entier");
    scanf("%d",&b);
    c=a+b;
    d=a-b;
    e=a/b;
    printf("L'addition donne %d, la soustraction %d, la division %d",c,d,e);
}

int TD4_ex5(){
    int a;
    printf("donner un entier");
    scanf("%d",&a);
    if (a%2 == 0) printf("a est pair");
    else printf("a est impair");
}

int TD4_ex6(){
    int r,S,a;
    printf("donner un entier ");
    scanf("%d",&r);
    int T[r];
    for (int i=0;i<=r-1;i++) {
        printf("donner un entier");
        scanf("%d",&a);
        T[i]=a; }
    for (int i=0;i<r;i++) {
        S=S+T[i];
}

int TD4_ex7(){

char CH[100];
int I;
printf("Entrez la chaîne à convertir : ");
gets(CH);
for (I=0; CH[I]; I++) {
    if (CH[I]>='A' && CH[I]<='Z')
        CH[I] = CH[I]-'A'+'a';
    else if (CH[I]>='a' && CH[I]<='z')
        CH[I] = CH[I]-'a'+'A';
}
printf("Chaîne convertie : %s\n", CH);
return 0;
/*}



int TD4_ex8(){
   char CH[100];
    int I;
    printf("Entrez la chaîne à convertir : ");
    gets(CH);
    I=strlen(CH);
    printf("la chaine est de longueur %d",I);
    return 0;
}

int TD4_ex9(int TAB[],int x,int N)
{   int I=0, pos=0;
    while (TAB[I]!=x && I<N)I++;
    if(TAB[I]==x) pos = I;
    return pos;
}

void Supprimer(int TAB[],int k, int N){
    int I, pos=0;
    for(I=k; I<N; I++)TAB[I]=TAB[I+1];
}

void SaisirComptes(int Tab[], float TabSoldes[], int N){
    int i, j;
    for(i=0; i<N;i++){printf("\nIntroduire le numéro de compte: ");
    scanf("%d",&Tab[i]);
    printf("\nIntroduire le solde de compte: ");
    scanf("%f",&TabSoldes[i]);}
}

void AffichComptes(int Tab[], float TabSoldes[], int N){
    int i, j;
    for(i=0; i<N;i++){
        printf("\n Numéro de compte: %d",Tab[i]);
        printf("\t Solde de compte: %f",TabSoldes[i]);
    }
}

int Rechercher(int Tab[], int N, int num){
    int i, pos =-1;i=0;
    while(Tab[i]!=num && i<N)
        {i++;}
    if(Tab[i]==num)pos =i;return pos;
}  */


int TD5_2(int *a,int *b) {
     int temp=*a;
     *a = *b;
     *b = temp;
}

void TD5_3(){
    int T[5]={1,4,7,2,5}, S;
    int *p1;
    for (int i=0;i<5;i++) {
        p1=T[i];
        S=S+*p1;
    }
    printf("%d",S);
}


int main() {
    TD5_3();
    return 0;
}

