library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DemThuanNghich6_top is
	port (
		clk, reset, start, up: in std_logic;
		SEG:	out std_logic_vector (6 downto 0);
		AN:	out std_logic_vector (3 downto 0)
	);
end DemThuanNghich6_top;

architecture RTL of DemThuanNghich6_top is
	signal internal_clock: std_logic;
	signal V: std_logic_vector (3 downto 0);
	
	COMPONENT HEX2SEG_top
	PORT(
		HEX : IN std_logic_vector(3 downto 0);          
		SEG : OUT std_logic_vector(6 downto 0);
		HEXCTRL : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT clock_divider_100MHz_to_1Hz
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		clk_out : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter6
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		start : IN std_logic;
		up : IN std_logic;          
		output : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	

begin
	
	U1: counter6 PORT MAP(
		clk => internal_clock,
		reset => reset,
		start => start,
		up => up,
		output => V
	);
	
	U2: HEX2SEG_top PORT MAP(
		HEX => V,
		SEG => SEG,
		HEXCTRL => AN
	);

	U3: clock_divider_100MHz_to_1Hz PORT MAP(
		clk => clk,
		reset => reset,
		clk_out => internal_clock
	);
	
	
	
end RTL;

