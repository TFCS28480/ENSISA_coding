clear all

% Donnees du systeme
m1 = 20;
m2 = 10;
k1 = 200;
k2 = 100;
k3 = 100; 
c1 = 2;
c2 = 1;
c3 = 1;

MatM = diag([m1 m2]);
MatK = [k1+k2 -k2 ; -k2 k2+k3];
MatC = [c1+c2 -c2 ; -c2 c2+c3];

nddl = size(MatM,1);

% Reponse frequentielle
F = [1 ;0];

Vfreq = [0:0.01:1.5];
Vresp_freq = zeros(2,length(Vfreq));

for ii = 1:length(Vfreq)
     Vresp_freq(:,ii) = (-(2*pi*Vfreq(ii))^2*MatM+1i*(2*pi*Vfreq(ii))*MatC+MatK)\F;
end

% Diagramme de Bode
figure
subplot(2,1,1)
semilogy(Vfreq,abs(Vresp_freq))
ylabel('Amplitude (m)')
grid on
subplot(2,1,2)
plot(Vfreq,angle(Vresp_freq))
xlabel('Fréquence (Hz)')
ylabel('Phase (rad)')
grid on


% Reponse temporelle numerique
x10 = 0;
x20 = 0;
x1p0 = 0;
x2p0 = 0;
VCI = [x10 x20 x1p0 x2p0];
Vt=[0 60];

[Vt_num,Vresp_temp_num] = ode45(@(t,y) odefcn(t,y,MatM,MatC,MatK), [Vt(1) Vt(end)], VCI);
Vresp_temp_num = Vresp_temp_num(:,1:nddl);

figure
plot(Vt_num,Vresp_temp_num)
xlabel('Temps (s)')
ylabel('Amplitude (m)')
grid on


function force = force_exc(t)

% amplitude
Vamp = [1;0];
% frequence d'excitation
f_exc = 0.8;
omega_exc = 2*pi*f_exc;
force = Vamp*sin(omega_exc*t);

end


function yp = odefcn(t,y,m,c,k)

nddl = size(m,1);
yp = [c m ; m zeros(nddl)]\([-k zeros(nddl) ; zeros(nddl) m]*y+[force_exc(t) ; zeros(nddl,1)]);

end