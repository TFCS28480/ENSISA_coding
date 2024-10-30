% TP2.m : Analyse spectrale et repliement de spectre 
% TP Caractérisation des Signaux 
% NOURY Amélia & FARCASIU-POPOVICI Théo
% 15 Janvier 2024

clear all ;
close all ;
clc ;

%%
% ********** Déclaration des constantes ************
% Dans cette zone sont initialisees TOUTES les constantes necessaires a
% l'execution du script


% Temps et fréquence d'échantillonnage
Fe = 1000;  % Pour la partie 2
Te = 1/Fe;

% Temps et nombre d'échantillons de l'acquisition
Tacq = 0.1; % Pour la partie 2
N = Fe*Tacq;

% Constantes
F0 = 0;  % fréquence (Hertz)
Fe2 = 100000;   % fréquence (Hertz)
A = 1;   % amplitude (V)
a = 500; % coefficient de la fonction (Hz/s)

%Déclaration des contantes de chaque signal [fréquence (Hz), phase (rad), amplitude (V)]
f1 = 40;    p1 = pi/4 ;   A1 = 1;        %Constante du signal x1
f2 = 105;   p2 = 0 ;      A2 = 1;        %Constante du signal x2
f3 = 125;   p3 = pi/3 ;   A3 = 1;        %Constante du signal x3

%Vecteur ligne de temps compris entre [0 Tacq-1/Fe] échantillonné tout les 1/Fe
t1 = (0:1/Fe:Tacq - 1/Fe)';   



%%
%********** Acquisition/Generation des signaux ****
% Dans cette zone sont declares TOUS les signaux autres que les constantes

% On considère le signal suivant : 
% x = A*cos(teta);

% On reprend l'expression des signaux étudiés dans le TP1
x1 = A1*cos(2*pi*f1*t1 + p1);    
x2 = A2*cos(2*pi*f2*t1 + p2);
x3 = A3*cos(2*pi*f3*t1 + p3);
x4 = x1 + 3*x2 + 2*x3;


%%
%********** Traitement des signaux ****************
% Dans cette zone sont effectues tous les calculs et traitements des
% grandeurs etudiees

% Calcul de l'autocorrélation de chaque signal : 
x1cor = xcorr(x1,'unbiased');   % 'unbiased' permet d'ajuster l'amplitude de la figure d'autocorrelation à A/2. 
x2cor = xcorr(x2,'unbiased');
x3cor = xcorr(x3,'unbiased');
x4cor = xcorr(x4,'unbiased');

% Base de temps assimilée
t2 = (0:Tacq/length(x1cor):Tacq*(1 - 1/length(x1cor)))';
Tau = (-Tacq + Te :Te : +Tacq-Te);

% Calcul de la transformée de Fourier de chaque signal autocorrélé :
x1ctf = fft (x1cor);
x2ctf = fft (x2cor);
x3ctf = fft (x3cor);
x4ctf = fft (x4cor);

%%
%********** Visualisation des données *************
% Cette zone permet de regrouper toutes les instructions relatives au trace
% des courbes

% émission du son créé par le signal grâce aux enceintes de la machine
%soundsc(x1cor);
%soundsc(x2cor);
%soundsc(x3cor);
%soundsc(x4cor);

% Affichage des fonctions autocorrélées
figure;
subplot(2,2,1); 
plot(Tau,x1cor,'-b');
title('Graphique de l autocorrelation du signal x1');
xlabel('Temps (s)'); ylabel('x1cor(t)');

%stem(Tau,x1cor,"-b");
%xlim([0 0.1]);
%ylim([-2.5 2.5]);

subplot(2,2,2);   
plot(Tau,x2cor,'-b');
title('Graphique de l autocorrelation du signal x2');
xlabel('Temps (s)'); ylabel('x2cor(t)');
%xlim([0 0.1]);
%ylim([-2.5 2.5]);

subplot(2,2,3);   
plot(Tau,x3cor,'-b');
title('Graphique de l autocorrelation du signal x3');
xlabel('Temps (s)'); ylabel('x3cor(t)');
%xlim([0 0.1]);
%lim([-2.5 2.5]);

subplot(2,2,4);   
plot(Tau,x4cor,'-b');
title('Graphique de l autocorrelation du signal x4');
xlabel('Temps (s)'); ylabel('x4cor(t)');
%xlim([0 0.1]);
%ylim([-2.5 2.5]);

% Affichage des TF des fonctions autocorrélées 
figure;
subplot(2,2,1); 
plot(Tau,abs(x1ctf));
title('Graphique de la transformée de Fourier de l autocorrelation du signal x1');
xlabel('Temps (s)'); ylabel('x1ctf(t)');


subplot(2,2,2);   
plot(Tau,abs(x2ctf),'-b');
title('Graphique de la transformée de Fourier de l autocorrelation du signal x2');
xlabel('Temps (s)'); ylabel('x2ctf(t)');


subplot(2,2,3);   
plot(Tau,abs(x3ctf),'-b');
title('Graphique de la transformée de Fourier de l autocorrelation du signal x3');
xlabel('Temps (s)'); ylabel('x3ctf(t)');

subplot(2,2,4);   
plot(Tau,abs(x4ctf),'-b');
title('Graphique de la transformée de Fourier de l autocorrelation du signal x4');
xlabel('Temps (s)'); ylabel('x4ctf(t)');
