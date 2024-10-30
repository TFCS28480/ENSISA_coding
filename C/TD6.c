#include <stdio.h>

//TD6_1
    /* struct Date{int jour;int mois;int annee;};

    struct Personne{
        char Nom[10];
        char Prenom[10];
        struct Date DN;
        char Matricule[20];};

    struct Personne P;

    strcpy(P.Nom,"FARCASIU-POPOVICI");
    strcpy(P.Prenom,"Théo");
    P.DN.jour=24;
    P.DN.mois=6;
    P.DN.annee=2003;
    strcpy(P.Matricule,"A32"); */


//TD6_2
    struct FI{float Feet;float Inch;};
    struct FI SaisirDist(struct FI Z){
        printf("\n Donner les feet de la distance :");
        scanf("%f",Z.Feet);
        printf("\n Donner la distance :");
        scanf("%f",Z.Inch);}

    struct FI SommeFI(struct FI Z1,struct FI Z2){
        struct FI S;
        S.Feet=Z1.Feet+Z2.Feet;
        S.Inch=Z1.Inch+Z2.Inch;
        return S;}

    void AfficherFI(struct FI S){
        printf("\n S= %f + %f *i", S.Feet, S.Inch);}


//TD6_3
    struct Complexe{float reel;float img ;};
    struct Complexe SaisirComplexe(struct Complexe C){
        printf("\n Donner la partie réelle:");
        scanf("%f",C.reel);
        printf("\n Donner la partie imaginaire :");
        scanf("%f",C.img);}

    struct Complexe SommeComplexe(struct Complexe C1,struct Complexe C2){
        struct Complexe CS;
        CS.reel = C1.reel+ C2.reel;
        CS.img = C1.img + C2.img;
        return CS;}

    struct  Complexe  ProduitComplexe(struct  Complexe  C1,struct  Complexe C2){
        struct Complexe CP;
        CP.reel = C1.reel * C2.reel;
        CP.img = C1.img * C2.reel;
        return CP;}

    void AfficherComplexe(struct Complexe C){
        printf("\n Z= %f + %f *i", C.reel, C.img);
    }


//TD6_4
    struct Etudiant {
        char Nom[15];
        int ID[1];
        int Note[1];
    };
    struct Etudiant T[10];

    int T_Etudiant() {
        for (int i=0; i<10; i++) {
            scanf("%s,%d,%d",T[i].Nom,T[i].ID,T[i].Note);
        }
        for (int i=0; i<10; i++) {
            printf("%s,%d,%d",T[i].Nom,T[i].ID,T[i].Note);
        }
    }


//TD6_5


//TD6_6
    enum fan_level{Level1,Level2,Level3,};

//TD6_7
    struct Produit{int code;char Nom[20];int prix;};
    struct Caissier{char id[30];char nom[20];struct Produit TProd[100];int NP;int soldeCaisse;};

    void AfficherProduit(struct Produit P){
        printf("\nle produit    code :%d    ,nom    %s,    prix %d",P.code,P.Nom,P.prix);
        }
    void VendreProduit(struct Produit P, struct Caissier *C){
         *C.TProd[NP].code -> P.code;
         strcpy(*C.TProd[NP].Nom,P.Nom);
         *C.TProd[NP].prix=P.prix;
         *C.NP ++;
         *C.soldeCaisse+=P.prix;
        }
    void ListeProduit(struct Caissier C){
         int i;
         for(i=0;i<C.NP;i++){
             printf("\nProduit code:%d,nom:%s,prix%d",C.TProd[i].code,C.TProd[i].Nom,C.TProd[i].prix);}
        }


int main()
{
    //TD6_2();
    /*  struct FI Z1,Z2,Z3;
    SaisirDist(&Z1);
    SaisirDist(&Z2);
    Z3 = SommeFI(Z1,Z2);
    AfficherFI(Z3); */

    //TD6_3();
    /*  struct Complexe Z1, Z2, Z3, Z4;
    SaisirComplexe(&Z1);
    SaisirComplexe(&Z2);
    Z3 = SommeComplexe(Z1, Z2);
    Z4 = ProduitComplexe(Z1, Z2);
    AfficherComplexe(Z3);
    AfficherComplexe(Z4);  */

    //TD6_4();

}
