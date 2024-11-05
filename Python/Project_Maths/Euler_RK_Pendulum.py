import numpy as np
import matplotlib.pyplot as plt

# Méthode d'Euler pour un système d'équations différentielles
def euler_pendule(f, y0, t):
    n = len(t)
    y = np.zeros((n, len(y0)))
    y[0] = y0
    for i in range(1, n):
        h = t[i] - t[i-1]
        y[i] = y[i-1] + h * f(t[i-1], y[i-1])
    return y

# Méthode de Runge-Kutta d'ordre 4 pour un système d'équations différentielles
def RK4_pendule(f, y0, t):
    n = len(t)
    y = np.zeros((n, len(y0)))
    y[0] = y0
    for i in range(1, n):
        h = t[i] - t[i-1]
        k1 = f(t[i-1], y[i-1])
        k2 = f(t[i-1] + h/2, y[i-1] + h/2 * k1)
        k3 = f(t[i-1] + h/2, y[i-1] + h/2 * k2)
        k4 = f(t[i-1] + h, y[i-1] + h * k3)
        y[i] = y[i-1] + h/6 * (k1 + 2*k2 + 2*k3 + k4)
    return y

# Fonction définissant l'équation différentielle du pendule
def pendule(t, y):
    g = 9.81  # Accélération due à la gravité (m/s^2)
    L = 1.0   # Longueur du pendule (m)
    theta, omega = y
    dydt = [omega, - (g / L) * np.sin(theta)]
    return np.array(dydt)

# Conditions initiales
theta0 = np.pi / 4  # Angle initial (45 degrés)
omega0 = 0.0        # Vitesse angulaire initiale
y0 = [theta0, omega0]
t = np.linspace(0, 10, 1000)  # Intervalle de temps

# Résolution numérique avec la méthode d'Euler
y_euler = euler_pendule(pendule, y0, t)

# Résolution numérique avec la méthode de Runge-Kutta d'ordre 4
y_rk4 = RK4_pendule(pendule, y0, t)

# Affichage des résultats
plt.figure(figsize=(12, 6))
plt.plot(t, y_euler[:, 0], label='Euler')
plt.plot(t, y_rk4[:, 0], label='Runge-Kutta 4')
plt.xlabel('Temps (s)')
plt.ylabel('Angle (rad)')
plt.title('Pendule simple: Angle en fonction du temps')
plt.legend()
plt.grid(True)
plt.show()