#include <stdio.h>
#include <stdlib.h>

int Exo6_et_7(){

struct Horaire{int heure; int min ;int sec;};
struct Bus{int numero; char LieuDep[20]; char LieuArr[20]; struct Horaire HDep; struct Horaire HArr;};

void SaisirBus(struct Bus Tbus[], int N){
    int i;
    for(i=0;i<N;i++){
        printf("\n Donner le numéro de bus:");
        scanf("%d",Tbus[i].numero);
        printf("\n Donner le lieu de départ de bus:");
        gets(Tbus[i].LieuDep);
        printf("\n Donner le lieu d'arrivée de bus:");
        gets(Tbus[i].LieuArr);
        printf("\nDonner l'horaire de départ (heure/min/sec):");
        scanf("%d",Tbus[i].HDep.heure);
        scanf("%d",Tbus[i].HDep.min);
        scanf("%d",Tbus[i].HDep.sec);
        }
}

void AffichBus(struct Bus Tbus[],char V1[],char V2[],struct Horaire H1,struct Horaire H2,int N){
    int i;
    for(i=0;i<N;i++){
        if(strcmp(Tbus[i].LieuDep,V1)==1 && strcmp(Tbus[i].LieuArr,V2)==1)
            //if((Tbus[i].HDep==H1) && (Tbus[i].HArr==H2)
                printf("\n     Numéro     de     bus     trouvé:    %d",Tbus[i].numero);
    }
}

void  AffichHeureArriv(struct  Bus Tbus[],int  num,char  V1[],char V2[],struct Horaire H1,int N){
    int i;for(i=0;i<N;i++){
        if(Tbus[i].numero==num   &&   strcmp(Tbus[i].LieuDep,V1)==1   &&  strcmp(Tbus[i].LieuArr,V2)==1 )
            //if(Tbus[i].HDep==H1)
                printf("\n L'horaire d'arrivée du bus trouvé :%d%d %d",Tbus[i].HArr.heure,Tbus[i].HArr.min,Tbus[i].HArr.sec);
    }
}


struct Date{int jour;int mois;int annee;};
struct Sportif{char Nom[20];char Prenom[20];char Pays[20];struct Date DN;int performance;};

void SaisiSport(struct Sportif TSport[], int N){
    int i;
    for(i=0;i<N;i++){
        printf("\n Donner le nom du sportif:");
        gets(TSport[i].Nom);
        printf("\n Donner le prénom du sportif:");
        gets(TSport[i].Prenom);printf("\n Donner le pays du sportif:");
        gets(TSport[i].Pays);printf("\nDonner la date de naissance (jour/mois/annee):");
        scanf("%d",TSport[i].DN.jour);
        scanf("%d",TSport[i].DN.mois);
        scanf("%d",TSport[i].DN.annee);}
}

void TriSport(struct Sportif TSport[], int N){
    struct Sportif * P, AIDE; // Tri du tableau par sélection directe du maximum.
    for (P=TSport; P<TSport+N-1; P++){
            int PMAX=P-TSport;  //Recherche du maximum à droite
            for (int Pj=P+1; Pj<TSport+N; Pj++)
                //if ((*Pj).performance > (*(TSport+PMAX)).performance)
                    //PMAX=Pj-TSport;   // Echange de *Pavec le maximum
                AIDE= *P;*P =*(TSport+PMAX);*(TSport+PMAX)=AIDE;}
}

void AffichSport(struct Sportif TSport[],int N){
    TriSport(TSport, N);
    printf("\nLes trois vaiqueurs sont :");
    printf("\n Medaille d'or:      %s      %s      %s ",TSport[0].Nom,TSport[0].Prenom,TSport[0].pays);
    printf("\n Medaille d'argent:     %s     %s     %s ",TSport[1].Nom,TSport[1].Prenom,TSport[1].pays);
    printf("\n Medaille    de    Bronze:    %s    %s    %s ",TSport[02].Nom,TSport[2].Prenom,TSport[2].pays);
}
}

int Lire_T(){
    int n, a, b, position, nbr;
    printf("\n Donner la taille du tableau (max 100) :");
    scanf("%d",n);
    int T[n], TPos[n], TNeg[n];
    int *P; P=T;
    for (int i=0;i<n;i++){
        printf("\n Donner les valeurs du tableau :");
        scanf("%d",a);
        T[i]=a;
    }
    for (int i=0;i<n;i++) {
        if (i<0) TNeg[i]=*(P+i);
        else TPos[i]=*(P+i);
    }
    for (int i=0;i<n;i++) {
        if (TPos[i]==0) {
            if (position >= nbr+1)
        for (i = position - 1; i < nbr - 1; i++)
            TPos[i] = TPos[i+1];
        printf(" Après la suppression, le tableau = ");
        while (TPos[i] != '/0')
            printf("%d", TPos[i]);
        }
    }

    for (int i=0;i<n;i++) {
        if (TNeg[i]==0) {
            if (position >= nbr+1)
        for (i = position - 1; i < nbr - 1; i++)
            TNeg[i] = TNeg[i+1];
        printf(" Après la suppression, le tableau = ");
        while (TNeg[i] != '/0')
            printf("%d", TNeg[i]);
        }
    }
}

int Lire_CH() {
    char CH[20];
    int *PH, i=0 ;
    printf("Entrez une chaine :\n");
    gets(CH);
    PH=CH;
    while (*PH != '/0') {i++;}
    printf("\n La longueur de la chaine est %d", );
    PH++;
}



int main()
{
    Lire_CH();
    return 0;
}