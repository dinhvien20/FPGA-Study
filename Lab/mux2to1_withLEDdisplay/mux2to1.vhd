library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
	port 
	( A,B	: in std_logic_vector (3 downto 0);
		sel: in std_logic;
		Y	: out std_logic_vector (3 downto 0)
		);
end mux2to1;

architecture Behavioral of mux2to1 is
begin
	Y <= A when (sel='1') else B;
end Behavioral;

