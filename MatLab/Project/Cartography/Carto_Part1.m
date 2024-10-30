% TP1.m : Premier TD de l'ann�e bas� sur Phase_1_Antarctica.pdf
% 
% 
% TP matlab - Phase 1 Mission 1
% 09/10 Mission 1 d�but (questions 1 � 5)
% 14/10 fin de la Mission 1 
% SANCHEZ Arthur - Octobre 2023

clear all ;
close all ;
clc ;

%%
% ********** Declaration des constantes ************
% Dans cette zone sont initialisees TOUTES les constantes necessaires a
% l'execution du script
% 

CheminTemperature= "C:\Users\yoanp\OneDrive\Documents\GitHub\ENSISA_coding\MatLab\Project\Cartography\ENDURANCE_temperature.mat";


%%
%********** Acquisition/Generation des signaux ****
% Dans cette zone sont declares TOUS les signaux autres que les constantes

T = load(CheminTemperature)  ;              %importation des donn�es
[tmax,jmax] = max(T.temperature);                 %recherche de la temp�rature maximale et du jour correspondant
[tmin,jmin] = min(T.temperature) ;                %recherche de la temp�rature minimale et du jour correspondant
[z,jz] = min(abs(T.temperature)) ;             %recherche de la temp�rature la plus proche de z�ro et du jour correspondant


%%
%********** Traitement des signaux ****************
% Dans cette zone sont effectues tous les calculs et traitements des
% grandeurs etudiees

Bruit = rand(1,100)-0.5;         %g�n�ration du bruit
Tbruit = T.temperature + Bruit  ; %cr�artion d'une liste de temp�ratures bruit�es
Tajustee1 = Tbruit ; 
Tajustee1(Tajustee1<0.3 & Tajustee1>-0.2)=0 ; %cr�ation du vecteur aux valeurs ajust�es pr�s de 0�
Tajustee2 = Tajustee1 ;
for i = 2:99
    if Tajustee2(i)<-80
        Tajustee2(i)=Tajustee2(i)-(Tajustee2(i-1)+Tajustee2(i+1))/2;
    end
end
SommeTemp=0;
for i =1:100
    SommeTemp=SommeTemp+abs(Tajustee2(i));
end

%%
%********** Visualisation des donn�es *************
% Cette zone permet de regrouper toutes les instructions relatives au trace
% des courbes

disp("la temp�rature maximale est "+tmax+" et elle a �t� atteinte au jour "+jmax)
disp("la temp�rature minimale est "+tmin+" et elle a �t� atteinte au jour "+jmin)
disp("la temp�rature la plus proche de z�ro est "+z+" et elle a �t� atteinte au jour "+jz)

plot(T.temps,T.temperature,'-o','LineWidth',2) ; %affichage de la temp�rature en fonction du temps
hold on;
plot(T.temps,Tbruit,"g");                %affichage de la temp�rature bruit�e en fonction du temps
plot(T.temps,Tajustee1,"k");          %affichage de la temp�rature ajust�e pr�s de O�
plot(T.temps,Tajustee2,"r")
legend("temperatures non corrig�es","temperatures avec bruit","temperatures avec bruit corrig�es pr�s de 0�","temperature avec bruit corrig�es pr�s de 0� et de -80�")
xlabel("Temps (jours)")
ylabel("Temp�rature (�)")
title("Evolution de la temp�rature au cours du temps")
hold off;

display("le capteur � accumul� "+SommeTemp+"� en valeur absolue, il n'est donc plus fonctionel")




