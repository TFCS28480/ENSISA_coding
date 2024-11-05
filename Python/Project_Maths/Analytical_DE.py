import numpy as np
import matplotlib.pyplot as plt

# Définition de l'équation différentielle dy/dt = -k * y
def ED(t, y, k):
    return -k * y

# Solution analytique de l'équation différentielle
def sol_analytique(t, y0, k):
    return y0 * np.exp(-k * t)

# Conditions initiales
y0 = 1.0  # Valeur initiale de y
k = 0.1  # Paramètre k dans l'équation différentielle

# Plage de temps pour la solution
t = np.linspace(0, 10, 100)

# Calcul de la solution analytique
y = sol_analytique(t, y0, k)

# Affichage de la solution
plt.plot(t, y, label='y(t)')
plt.xlabel('Temps')
plt.ylabel('y')
plt.title('Solution analytique de l\'équation différentielle dy/dt = -k * y')
plt.legend()
plt.grid(True)
plt.show()