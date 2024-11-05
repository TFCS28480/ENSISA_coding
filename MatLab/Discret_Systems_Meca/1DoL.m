clear all

% Donnees du systeme
m = 1;
k = 1000;
c = 2 ;

% Proprietes du systeme
omega_0 =sqrt(k/m);
xi = c/(2*sqrt(k*m));
Omega_0 = omega_0*sqrt(1-xi^2);

% Reponse temporelle analytique
x0 = 5;
xp0 = 0;

A = x0;
B = xi/sqrt(1-xi^2)*x0;

T_0 = 2*pi/Omega_0;
Vt = [0:T_0/20:10];

Vresp_temp = (A*cos(Omega_0*Vt)+B*sin(Omega_0*Vt)).*exp(-xi*omega_0*Vt);

figure
plot(Vt,Vresp_temp)
xlabel('Temps (s)')
ylabel('Amplitude (m)')
grid on

% Reponse temporelle numerique
VCI = [x0 xp0];
[Vt_num,Vresp_temp_num] = ode45(@(t,y) odefcn(t,y,m,c,k), [Vt(1) Vt(end)], VCI);
Vresp_temp_num = Vresp_temp_num(:,1);
 
figure
plot(Vt_num,Vresp_temp_num)
hold on
plot(Vt,Vresp_temp,'--')
xlabel('Temps (s)')
ylabel('Amplitude (m)')
legend('numerique','analytique')
grid on


% Reponse frequentielle
F = 1;
Vfreq = [0:0.1:10];
Vresp_freq = zeros(1,length(Vfreq));

for ii = 1:length(Vfreq)
     Vresp_freq(ii) = (-(2*pi*Vfreq(ii))^2*m+1i*(2*pi*Vfreq(ii))*c+k)\F;
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

% Diagramme de Nyquist 
figure
plot(real(Vresp_freq),imag(Vresp_freq))
xlabel('Re(X)')
ylabel('Im(X)')
grid on


function force = force_exc(t)

% amplitude
Vamp = 1;
% frequence d'excitation
f_exc = 0.8;
omega_exc = 2*pi*f_exc;
force = Vamp*sin(omega_exc*t);

end


function yp = odefcn(t,y,m,c,k)

% 1 ddl en regime force
yp = [c m ; m 0]\([-k 0 ; 0 m]*y+[force_exc(t) ; 0]);

end