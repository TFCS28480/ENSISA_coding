library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder_3_to_8_tb is
end;

architecture bench of decoder_3_to_8_tb is

  component decoder_3_to_8
  PORT (
  	a : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
  	y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
  end component;

  signal a_s: STD_LOGIC_VECTOR (2 DOWNTO 0);
  signal y_s: STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

  uut: decoder_3_to_8 port map ( a => a_s,
                                 y => y_s );

  stimulus: process
  begin
  
		wait for 50ns;
		a_s <= "001";
		wait for 100ns;
		a_s <= "010";
		wait for 70ns;
		a_s <= "011";
		wait for 90ns;
		a_s <= "100";
		wait for 90ns;
		a_s <= "101";
		wait for 40ns;
		a_s <= "110";
		wait for 60ns;
		a_s <= "111";
	
  end process;
end;