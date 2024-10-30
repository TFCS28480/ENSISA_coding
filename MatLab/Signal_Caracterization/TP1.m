% TEMPLATE.M : Fichier exemple decrivant la maniere dont un script
% (ou une fonction) matlab doir etre structure et commente.
% 
% Le cartouche contient:
%   - le nom du script
%   - l'objectif realise par le script
%   - la definition des variables d'appel et de retour
%   - la/les syntaxe(s) d'appel via matlab
%   - L'auteur du script ainsi que les modifications apportees depuis sa
%   creation
%
% Modif 09/2011 : Ajout des cellules
% Modif 09/09 : Mise en ligne sur Moodle
%
% NOURY Am�lia - FARCASIU-POPOVICI Th�o - Janvier 2024
 
clear all;
close all;
clc;

% %
% ********** Declaration des constantes ************
% Dans cette zone sont initialisees TOUTES les constantes necessaires a
% l'execution du script
% 

%D�claration des contantes de chaque signal [fr�quence (Hz), phase (rad),
%  amplitude (V)]
f1 = 40;    p1 = pi/4 ;   A1 = 1;        %Constante du signal x1
f2 = 105;   p2 = 0 ;      A2 = 1;        %Constante du signal x1
f3 = 125;   p3 = pi/3 ;   A3 = 1;        %Constante du signal x3

Tacq = 0.1;   %Temps d'acquisition du signal

Fe = 1000;  %fr�quence d'�chantillonnage en Hertz
Te = 1/Fe;  %P�riode d'�chantillonnage
Fe2 = 100000;

t1 = (0:1/Fe:Tacq - 1/Fe)';   %Vecteur ligne de temps compris entre [0 Tacq-1/Fe] �chantillonn� tout les 1/Fe
t2 = (0:1/Fe2:Tacq - 1/Fe2)';
t3 = 0:1/Fe:1-Fe;

N = Fe*Tacq;   % nombre d'�chantillon
%N = 1000;
N1 = 128;

F = (0:Fe/N:Fe-1)';    %Vecteur ligne de fr�quence compris entre [0 Fe-1] �chantillonn� tout les Fe/N
F_s = (-Fe/2:Fe/N:(Fe/2)-1);


%%
%********** Acquisition/Generation des signaux ****
% Dans cette zone sont declares TOUS les signaux autres que les constantes

x1 = A1*cos(2*pi*f1*t1 + p1);    %signal repr�sentant le signal num�rique
x2 = A2*cos(2*pi*f2*t1 + p2);
x3 = A3*cos(2*pi*f3*t1 + p3);
x4 = x1 + 3*x2 + 2*x3;

x1_c = A1*cos(2*pi*f1*t2 + p1);  % signal �chantillonn� repr�sentant le signal analogique
x2_c = A1*cos(2*pi*f2*t2 + p2);
x3_c = A1*cos(2*pi*f3*t2 + p3);
x4_c = x1_c + 3*x2_c + 2*x3_c;

freq_1 = 0:Fe/length(x1):Fe/2;
freq_2 = 0:Fe/length(x2):Fe/2;
freq_3 = 0:Fe/length(x3):Fe/2;
freq_4 = 0:Fe/length(x4):Fe/2;
%%
%********** Traitement des signaux ****************
% Dans cette zone sont effectues tous les calculs et traitements des
% grandeurs etudiees

X1 = fft(x1/N);
X2 = fft(x2/N);
X3 = fft(x3/N);
X4 = fft(x4/N);

X1_s = fftshift(X1);
X2_s = fftshift(X2);
X3_s = fftshift(X3);
X4_s = fftshift(X4);

xdft1 = fft(x1);
xdft1 = xdft1(1:length(x1)/2+1);
xdft1 = xdft1/length(x1);
xdft1(2:end-1) = 2*xdft1(2:end-1);

xdft2 = fft(x2);
xdft2 = xdft2(1:length(x2)/2+1);
xdft2 = xdft2/length(x2);
xdft2(2:end-1) = 2*xdft2(2:end-1);
    %%
%********** Visualisation des donn�es *************
% Cette zone permet de regrouper toutes les instructions relatives au trace
% des courbes

figure(1);
subplot(2,2,1);   
stem(t1,x1,"-b");
xlim([0 0.1]);
ylim([-2.5 2.5]);
hold on;
plot(t2,x1_c,'-k');
legend('x1_e_c_h','x1(t)');
title('Evolution temporelle de x_1(t) = cos(2*pi*40*t)');
xlabel('Temps (s)');
ylabel('x_1(t)');

subplot(2,2,2);
stem(t1,x2,"-r");
legend('x2');
xlim([0 0.1]);
ylim([-2.5 2.5]);
hold on;
plot(t2,x2_c,'-k');
legend('x2_e_c_h','x2(t)');
title('Evolution temporelle de x_2(t) = cos(2*pi*105*t)');
xlabel('Temps (s)');
ylabel('x_2(t)');

subplot(2,2,3);
stem(t1,x3,"-g");
legend('x3');
xlim([0 0.1]);
ylim([-2.5 2.5]);
hold on;
plot(t2,x3_c,'-k');
legend('x3_e_c_h','x3(t)');
title('Evolution temporelle de x_3(t) = cos(2*pi*125*t)');
xlabel('Temps (s)');
ylabel('x_3(t)');

subplot(2,2,4);
stem(t1,x4,"-c");
legend('x4');
xlim([0 0.05]);
ylim([-8 8]);
hold on;
plot(t2,x4_c,'-k');
legend('x4_e_c_h','x4(t)');
title('Evolution temporelle de x_4(t) = x_1(t) + 3*x_2(t) + 2*x_3(t)');
xlabel('Temps (s)');
ylabel('x_4(t)');
hold off;


%Repr�sentation dans le domaine fr�quentiel en unilat�rale
figure(2);
subplot(2,2,1);
stem(F,abs(X1));
xlim([0 Fe]);
title('Spectre d amplitude unilat�rale de |X1(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X1(jf)|');
hold on;
plot(F,abs(X1));

subplot(2,2,2);
stem(F,abs(X2));
xlim([0 Fe]);
title('Spectre d amplitude unilat�rale de |X2(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X2(jf)|');
hold on;
plot(F,abs(X2));

subplot(2,2,3);
stem(F,abs(X3));
xlim([0 Fe]);
title('Spectre d amplitude unilat�rale de |X3(jf)|');
xlabel('Fr�quence (Hz))');
hold on;
plot(F,abs(X3));ylabel('|X3(jf)|');


subplot(2,2,4);
stem(F,abs(X4));
xlim([0 Fe]);
title('Spectre d amplitude unilat�rale de |X4(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X4(jf)|');
hold on;
plot(F,abs(X4));

%Repr�sentation dans le domaine fr�quentiel en bilat�rale centr�e en 0
figure(3);
subplot(2,2,1);
stem(F_s,abs(X1_s));
xlim([-Fe/2 Fe/2]);
title('Spectre d amplitude bilat�rale centr� de |X1(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X1(jf)|');
hold on;
plot(F_s,abs(X1_s));

subplot(2,2,2);
stem(F_s,abs(X2_s));
xlim([-Fe/2 Fe/2]);
title('Spectre d amplitude bilat�rale centr� de |X2(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X2(jf)|');
hold on;
plot(F_s,abs(X2_s));

subplot(2,2,3);
stem(F_s,abs(X3_s));
xlim([-Fe/2 Fe/2]);
title('Spectre d amplitude bilat�rale centr� de |X3(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X3(jf)|');
hold on;
plot(F_s,abs(X3_s));

subplot(2,2,4);
stem(F_s,abs(X4_s));
xlim([-Fe/2 Fe/2]);
title('Spectre d amplitude bilat�rale centr� de |X4(jf)|');
xlabel('Fr�quence (Hz)');
ylabel('|X4(jf)|');
hold on;
plot(F_s,abs(X4_s));

%Repr�sentation fr�quentielle avec le zero-padding

figure(4);
subplot(2,2,1);
plot(freq_1,abs(xdft1));
hold on;
plot(freq_1,ones(length(x1)/2+1,1),'LineWidth',2)
xlabel('Hz');ylabel('Amplitude');hold off;




