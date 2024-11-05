import numpy as np
import matplotlib.pyplot as plt

# Conditions initiales
y0 = 1
t = np.linspace(0, 10, 100)

def euler(f, y0, t):
    n = len(t)
    y = np.zeros(n)
    y[0] = y0
    for i in range(1, n):
        h = t[i] - t[i-1]
        y[i] = y[i-1] + h * f(t[i-1], y[i-1])
    return y

# Fonction définissant l'équation différentielle
def f(t, y):
    k = 0.1  # Constante k
    return -k * y

# Résolution numérique avec la méthode d'Euler
y_euler = euler(f, y0, t)

def runge_kutta(f, y0, t):
    n = len(t)
    y = np.zeros(n)
    y[0] = y0
    for i in range(1, n):
        h = t[i] - t[i-1]
        k1 = f(t[i-1], y[i-1])
        k2 = f(t[i-1] + h/2, y[i-1] + h/2 * k1)
        k3 = f(t[i-1] + h/2, y[i-1] + h/2 * k2)
        k4 = f(t[i-1] + h, y[i-1] + h * k3)
        y[i] = y[i-1] + h/6 * (k1 + 2*k2 + 2*k3 + k4)
    return y

# Résolution numérique avec la méthode de Runge-Kutta d'ordre 4
y_rk4 = runge_kutta(f, y0, t)

# Affichage des résultats
plt.plot(t, y_rk4, label='Runge-Kutta 4')
plt.plot(t, y_euler, label='Euler')
plt.xlabel('t')
plt.ylabel('y(t)')
plt.title('Solution de l\'équation différentielle avec la méthode de Runge-Kutta d\'ordre 4 et Euler')
plt.legend()
plt.grid(True)
plt.show()
