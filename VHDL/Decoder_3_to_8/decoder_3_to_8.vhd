LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY decoder_3_to_8 IS
PORT (
	a : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
);
END decoder_3_to_8;


ARCHITECTURE Arch_dec OF decoder_3_to_8 IS
BEGIN
	process(a)
	BEGIN
		case a is
			when "000" => y <= "00000001";
			when "001" => y <= "00000010";
			when "010" => y <= "00000100";
			when "011" => y <= "00001000";
			when "100" => y <= "00010000";
			when "101" => y <= "00100000";
			when "110" => y <= "01000000";
			when "111" => y <= "10000000";
			when others => y <= "00000000";
		end case;
	end process;
END Arch_dec;