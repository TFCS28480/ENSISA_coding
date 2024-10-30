% definition des differentes fonctions de transfert de la PLL. (en phase)
 
clear all;
close all;
 
w=logspace(10,1,1000);
 
% Kc=1;                          % gain du comparateur de phase
%  
% Kf=1;                          % fonction de transfert du filtre passe bas de gain Kf, constante de temps Tau                              
% Tau=1;
% F=Kf./(1+Tau*i*w);        
%  
% Ko=1;                          % gain du VCO
%  
% G=2*pi/i*w;                    % integrateur
%  
% trace des diagrammes de Bode en boucle ouverte et en boucle fermee
%  
% figure(1);
%  
% A=Kc.*F*Ko.*G;                   % fonction de transfert en boucle ouverte
%  
% subplot(2,1,1);
% semilogx(w,20*log10(abs(A)));
% grid; xlabel('log(w)'); ylabel('G'); title('Diagramme de Bode de la FTBO en gain');
%  
% subplot(2,1,2);
% semilogx(w,unwrap(angle(A))*180/pi);
% grid; xlabel('log(w)'); ylabel('Phi'); title('Diagramme de Bode de la FTBO en phase');
 
 
figure(2);

z = i*w;

%num = ((z.^2).*(3+z));
num = 1200 * 54;
denum = (1e-08)*z*z*z+(6e-05)*z*z+(0.0725)*z;

H = num./denum; %fonction de transfert

step(sys,1.5) ;