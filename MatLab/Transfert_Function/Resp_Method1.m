clear all; close all; clc;

%% Déclaration des constantes
KM1 = 0.636;
KM2 = 0.71;

TM = 0.045;
Th1 = 0.0333;
Th2 = 0.037;
Tb1 = 0.06667;
Tb2 = 0.01047;

dh = - 0.056;
db = 0.68;

Kcpt = 200;
Fc = 1;
%% Déclaration des fonctions de transfert
num_M1 = KM1 ;       %numérateur 1ère FdT
den_M1 = [TM 1 0];      %dénominateur 1ère FdT

num_M2 = [(Th1*(Th2)^2)*KM2 (2*dh*Th2*Th1+(Th2)^2)*KM2 (Th1+2*dh*Th2)*KM2 KM2];
den_M2 = [(Tb1*(Tb2)^2) (2*db*Tb2*Tb1+(Tb2)^2) (Tb1+2*db*Tb2) 1 0];

F_M1 = tf(num_M1,den_M1);    %mise en format fonction de trnasfert
F_M2 = tf(num_M2,den_M2);

%% Option de la fonction step()
opt = RespConfig;         %Création d'un raccourci
opt.Amplitude = 6.8;      %Configuration de l'amplitude

%% Affichage des courbes
 for i = 0:3
    figure(1);
    FTBF1 = feedback(F_M1,Kcpt);     %bouclage avec une chaine retour à 1
    step(FTBF1,opt);
    hold on;
    legend('Kcpt = 200','Kcpt = 20', 'Kcpt = 2','Kcpt = 0.2');

    figure(2);
    FTBF2 = feedback(F_M2,Kcpt);
    step(FTBF2,opt);
    hold on;
    legend('Kcpt = 200','Kcpt = 20', 'Kcpt = 2','Kcpt = 0.2');

    Kcpt = Kcpt/10;
end
% K=3;
% figure(3);
% step(feedback(F_M1,K),opt);
