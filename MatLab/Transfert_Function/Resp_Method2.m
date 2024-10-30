clear all;
close all;
clc

%% D�claration des constantes 

KM1=0.636;    % rad/(V.sec)
TM=0.045;     % sec
Fc=1;         % On fixe le gain à 1

KM2=0.71;     % rad/(V.sec)
Th1=0.0333;   % sec
Th2=0.037;    
Tb1=0.06667;  
Tb2=0.01047;  
db=0.68;      % sans unité
dh=-0.056;    

Kcpt=200;

%% Affichage des courbes
for i=1:5
    sim('TP5_simulink.slx',10);

    % r�ponse indicielle H1
    figure(1);
    hold on;
    plot(ans.pos1.Time,ans.pos1.Data*Kcpt);
    grid;
    title("Réponse à un echelon de 6,8V pour le moteur modélisé au 2ème ordre");
    xlabel("Temps (s)");
    ylabel("Position1 * Kcpt (V)");
    legend("Kcpt=200","Kcpt=20","Kcpt=1","Kcpt=0.2","Kcpt=0.02");

    % r�ponse indicielle H2
    figure(2);
    hold on;
    plot(ans.pos2.Time,ans.pos2.Data*Kcpt);
    grid;
    title("Réponse à un echelon de 6,8V pour le moteur modélisé au 4ème ordre");
    xlabel("Temps (s)");
    ylabel("Position2 * Kcpt (V)");
    legend("Kcpt=200","Kcpt=20","Kcpt=2","Kcpt=0.2","Kcpt=0.02");

    Kcpt=Kcpt/10;
end



% �chelle logarithmique 

w = logspace(-4,4,5000);
s = i*w;

% On ne conna�t toujours pas la valeur de Kcpt on va la faire varier

Kcpt=200;
for i=1:5
    % Fonction de transfert du mod�le du 2�me ordre du moteur
    num1= Fc.*KM1;
    denum1=Kcpt.*Fc.*KM1+s+TM.*s.*s;
    H1=num1./denum1;
    % Fonction de transfert du mod�le du 2�me ordre du moteur
    num2=KM2.*(Th1.*s+1).*(Th2.*Th2.*s.*s+2.*dh.*Th2.*s+1);
    denum2=s.*(Tb1.*s+1).*(Tb2.*Tb2.*s.*s+2.*db.*Tb2.*s+1);
    F2=num2./denum2;
    H2=Fc.*F2./(1+Kcpt.*F2.*Fc);

    % Cr�ation des diagramme de bode (gain et phase) pour un moteur
    % mod�lis� en 2�me ordre
    
    figure(3)
    subplot(2,1,1);
    semilogx(w,20*log10(abs(H1)));
    grid;
    xlim([10^-3 10^3]);
    ylim([-100 50]);
    xlabel('log(w)');
    ylabel('20log(|H1|) (dB)');
    title('Diagramme de bode de la FTBF du moteur modélisé par un 2ème ordre en gain');
    legend("Kcpt=200","Kcpt=20","Kcpt=2","Kcpt=0.2","Kcpt=0.02");
    hold on;

    subplot(2,1,2);
    semilogx(w,unwrap(angle(H1))*180/pi);
    grid;
    xlim([10^-3 10^3]);
    ylim([-225 45]);
    xlabel("log(w)");
    ylabel("arg(H1)");
    title('Diagramme de Bode de la FTBF du moteur modélisé par un 2ème ordre de phase')
    legend("Kcpt=200","Kcpt=20","Kcpt=2","Kcpt=0.2","Kcpt=0.02");
    hold on;

   % Cr�ation des diagramme de bode (gain et phase) pour un moteur
    % mod�lis� en 2�me ordre
    figure(4)
    subplot(2,1,1);
    semilogx(w,20*log10(abs(H2)));
    grid;
    xlabel('log(w)');
    ylabel('20log(|H2|) (dB)');
    title('Diagramme de bode de la FTBF du moteur modélisé par un 4ème ordre en gain');
    legend("Kcpt=200","Kcpt=20","Kcpt=2","Kcpt=0.2","Kcpt=0.02");
    hold on;

    subplot(2,1,2);
    semilogx(w,unwrap(angle(H2))*180/pi);
    grid;
    xlabel("log(w)");
    ylabel("arg(H2) en degrés");
    title('Diagramme de Bode de la FTBF du moteur modélisé par un 4ème ordre de phase')
    legend("Kcpt=200","Kcpt=20","Kcpt=2","Kcpt=0.2","Kcpt=0.02");
    hold on;

    Kcpt=Kcpt/10;
end
