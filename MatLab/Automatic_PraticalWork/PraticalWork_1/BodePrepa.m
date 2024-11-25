%% TP1 APC 

%% Calcul de différents diagrammes de BODE 

tau1_simu = 0.06;
tau2_simu = 0.013;
Tr5 = 0.7;
alpha_simu = 4.6;

Kp = 2;
Ki = 2;
Kd = 2;

figure;
H_BF = tf([2276],[1 0 1294]); 
grid on; 
bode(H_BF,{1,100});
margin(H_BF);

figure;
H_BO = tf([2276],[1 0 -981]); 
grid on; 
bode(H_BO,{1,100});
margin(H_BO);
%title("Bode");

figure;
subplot(2,3,1);
H_Kp = tf([2276*Kp],[1 0 -981]); 
grid on; 
bode(H_Kp,{1,100});
margin(H_Kp);
%title("Bode proportionnel");

subplot(2,3,2);
H_Ki = tf([2276*Ki],[1 0 -981 0]); 
grid on; 
bode(H_Ki,{1,100});
margin(H_Ki);
%title("Bode intégral");

subplot(2,3,3);
H_Kd = tf([2276*Kd 0],[1 0 -981]); 
grid on; 
bode(H_Kd,{1,100});
margin(H_Kd);
%title("Bode dérivé");

subplot(2,3,4);
H_Kpi = tf([2276*Ki*Kp],[1 0 -981 0]); 
grid on; 
bode(H_Kpi,{1,100});
margin(H_Kpi);
%title("Bode proportionnel-intégral");

subplot(2,3,5);
H_Kpd = tf([2276*Kp*Kd 0],[1 0 -981]); 
grid on; 
bode(H_Kpd,{1,100});
margin(H_Kpd);
%title("Bode proportionnel-dérivé");

subplot(2,3,6);
H_Kpid = tf([2276*Kp*Ki*Kd 0],[1 0 -981 0]); 
grid on; 
bode(H_Kpid,{1,100});
margin(H_Kpid);
%title("Bode PID");

%% Script pour calculer R1 et R2 en fonction de TAU1, TAU2, ALPHA et C

% Définir les valeurs de TAU1, TAU2, ALPHA, et C
tau1 = 0.1051;    % Constante de temps tau1 (en secondes)
tau2 = 0.0228;    % Constante de temps tau2 (en secondes)
alpha = 4.598; % Facteur d'atténuation alpha (sans unité)
C = 4.7e-6;    % Capacité du condensateur (en Farads)

% Calcul de R1 et R2 en utilisant les équations
R1 = tau1 / C;
% R_total = tau2 / C;
R2 = (R1*tau2)/(R1*C-tau2);

% Vérification de la condition d'atténuation
alpha_calculated = R2 / (R1 + R2);

% Affichage des résultats
fprintf('Résistance R1 = %.2f Ohms\n', R1);
fprintf('Résistance R2 = %.2f Ohms\n', R2);
fprintf('Vérification alpha calculé = %.2f\n', alpha_calculated);

% Vérification si alpha_calculated est proche de alpha
if abs(alpha_calculated - alpha) < 1e-6
    disp('Les valeurs de R1 et R2 satisfont les conditions données.');
else
    disp('Attention : les valeurs de R1 et R2 ne satisfont pas alpha exactement.');
end

%%

% Définition des paramètres du système
num_G = 2276;            % Numérateur de G(s)
den_G = [1 0 -981];      % Dénominateur de G(s), représentant s^2 - 981

% Création de la fonction de transfert G(s)
G = tf(num_G, den_G);

% Paramètres du correcteur à avance de phase
K = 10;                  % Gain du correcteur (à ajuster)
T = 0.01;                % Constante de temps (à ajuster)
alpha = 0.1;             % Paramètre d'atténuation (0 < alpha < 1)

% Fonction de transfert du correcteur à avance de phase C(s)
num_C = K * [T 1];       % Numérateur de C(s) = K * (T * s + 1)
den_C = [alpha * T 1];   % Dénominateur de C(s) = (alpha * T * s + 1)
C = tf(num_C, den_C);

% Système corrigé en boucle ouverte
G_corrige = C * G;

% Bode plot pour observer l'effet du correcteur sur la marge de phase
figure(3);
margin(G);
hold on;
margin(G_corrige)
hold off;
legend('Système de base G(s)', 'Système corrigé G(s) avec C(s)');
title('Diagramme de Bode - Effet du correcteur à avance de phase');

% Système en boucle fermée avec le correcteur
boucle_fermee = feedback(G_corrige, 1);

% Réponse indicielle en boucle fermée
figure(4);
step(boucle_fermee);
title('Réponse indicielle du système corrigé en boucle fermée');
grid on;

% Affichage des marges de gain et de phase en boucle ouverte
[GM, PM, Wcg, Wcp] = margin(G_corrige);
fprintf('Marge de gain (dB): %.2f\n', 20*log10(GM));
fprintf('Marge de phase (degrés): %.2f\n', PM);
fprintf('Fréquence de coupure en gain (rad/s): %.2f\n', Wcg);
fprintf('Fréquence de coupure en phase (rad/s): %.2f\n', Wcp);

%% Calcul du diagramme de bode pour des spécifications
clear all;

% Définition du système de base instable G(s)
num_G = 2276;
den_G = [1 0 -981];
G = tf(num_G, den_G);

% Conception d'un correcteur PID pour stabiliser le système
Kp = 1;   % Gain proportionnel initial
Ki = 1;   % Gain intégral initial
Kd = 0.1; % Gain dérivé initial

PID = pid(Kp, Ki, Kd);

% Système corrigé en boucle ouverte avec PID pour stabilisation
G_stabilise = PID * G;

% Vérifier les marges de gain et de phase
[GM, PM, Wcg, Wcp] = margin(G_stabilise);

% Si le système est maintenant stable, concevoir un correcteur à avance de phase
if PM > 0  % Vérifier que le système stabilisé a une marge de phase positive
    % Objectifs de conception
    temps_reponse_cible = 0.7;
    marge_gain_min = 10;
    marge_phase_min = 40;

    % Calcul de la fréquence naturelle cible
    omega_n_cible = 3 / temps_reponse_cible;

    % Initialisation des paramètres du correcteur à avance de phase
    alpha = 0.1;
    K = 1;
    T = 1 / (omega_n_cible * sqrt(alpha));

    % Définition du correcteur à avance de phase
    num_C = K * [T 1];
    den_C = [alpha * T 1];
    C_avance = tf(num_C, den_C);

    % Système corrigé avec avance de phase en boucle ouverte
    G_corrige = C_avance * G_stabilise;

    % Vérifier les marges du système corrigé
    [GM_corrige, PM_corrige, ~, ~] = margin(G_corrige);

    % Affichage des marges
    fprintf('Marge de gain corrigée (dB): %.2f\n', 20*log10(GM_corrige));
    fprintf('Marge de phase corrigée (degrés): %.2f\n', PM_corrige);

    % Boucle fermée finale avec PID et avance de phase
    boucle_fermee = feedback(G_corrige, 1);

    % Tracer la réponse indicielle en boucle fermée
    figure;
    step(boucle_fermee);
    title('Réponse indicielle du système corrigé en boucle fermée');
    grid on;

    figure;
    bode(boucle_fermee);
else
    fprintf('Le système stabilisé avec PID est toujours instable.\n');
end
    
fprintf('Gain : %.2f\n',K);
fprintf('Alpha : %.2f\n',alpha);