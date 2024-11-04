library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity commande_de_LEDs_tb is
end;

architecture bench of commande_de_LEDs_tb is

  component commande_de_LEDs
  PORT (
  	clk : IN STD_LOGIC;
  	LEDs : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
  end component;

  signal clk: STD_LOGIC;
  signal LEDs: STD_LOGIC_VECTOR (9 DOWNTO 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: commande_de_LEDs port map ( clk  => clk,
                                   LEDs => LEDs );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  