library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1_LED is
	port
	(
		A, B	: in std_logic_vector (3 downto 0);
		sel	: in std_logic;
		SEG 	: out std_logic_vector (6 downto 0);
		AN		: out std_logic_vector (3 downto 0)
	);
end mux2to1_LED;

architecture Behavioral of mux2to1_LED is

	-- khai bao tin hieu noi bo de portmap
	signal abc : std_logic_vector (3 downto 0);
	
	-- khai bao cac component
	COMPONENT hex2led
	PORT(
		HEX : IN std_logic_vector(3 downto 0);          
		LED : OUT std_logic_vector(6 downto 0);
		AN : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux2to1
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		sel : IN std_logic;          
		Y : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	
begin

U1: mux2to1 PORT MAP(
		A => A,
		B => B,
		sel => sel,
		Y => abc
	);

U2: hex2led PORT MAP(
		HEX => abc,
		LED => SEG,
		AN => AN
	);

end Behavioral;

