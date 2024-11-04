library IEEE;
use IEEE.Std_logic_1164.all;

ENTITY commande_de_LEDs IS
PORT (
	clk : IN STD_LOGIC;
	LEDs : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
);
END commande_de_LEDs;
END commande_de_LEDs;

ARCHITECTURE Behavioral OF commande_de_LEDs IS
    SIGNAL counter : integer := 0;  -- Compteur pour générer un signal toutes les 0.1s
    SIGNAL shift_reg : STD_LOGIC_VECTOR(9 downto 0) := "1000000000";  -- Signal pour les LEDs
BEGIN 
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF counter = 5000000 THEN  -- 5000000 cycles pour 0.1s à 50 MHz
                counter <= 0;  -- Réinitialiser le compteur
                shift_reg <= shift_reg(8 DOWNTO 0) & shift_reg(9);  -- Décalage des LEDs
            ELSE
                counter <= counter + 1;  -- Incrémenter le compteur
            END IF;
        END IF;
    END PROCESS;

    LEDs <= shift_reg;  -- Piloter les LEDs
END Behavioral;
