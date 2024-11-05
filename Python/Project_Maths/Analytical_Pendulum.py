import numpy as np
import matplotlib.pyplot as plt

# Paramètres du pendule
g = 9.81  # Accélération due à la gravité (m/s^2)
L = 1.0   # Longueur du pendule (m)

# Fréquence angulaire naturelle
omega0 = np.sqrt(g / L)

# Conditions initiales
theta0 = np.pi / 4  # Angle initial (rad)

# Intervalle de temps pour la simulation
t = np.linspace(0, 10, 1000)  # De 0 à 10 secondes

# Solution analytique
theta = theta0 * np.cos(omega0 * t)

# Tracer les résultats
plt.figure(figsize=(8, 4))
plt.plot(t, theta, label='θ (rad)')
plt.xlabel('Temps (s)')
plt.ylabel('Angle (rad)')
plt.title('Solution analytique du pendule pesant pour de petites oscillations')
plt.legend()
plt.grid(True)
plt.show()