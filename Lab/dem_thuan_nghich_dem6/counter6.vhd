library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter6 is
	port (
		clk, reset, start, up: in std_logic;
		output:	out std_logic_vector (3 downto 0)
	);
end counter6;

architecture RTL of counter6 is
	type FSM_STATES is (waits,up1,up2,up3,up4,up5,down1,down2,down3,down4,down5);
	signal CurrentState, NextState: FSM_STATES;
begin

	--- process cap nhat ngo ra cua bo dem
	OUTPUT_LOGIC: 
	process (CurrentState) is
	begin
		case CurrentState is
			when waits =>
				output <= "0000";
			when up1 | down1 =>
				output <= "0001";
			when up2 | down2 =>
				output <= "0010";
			when up3 | down3 =>
				output <= "0011";
			when up4 | down4 =>
				output <= "0100";
			when up5 | down5 =>
				output <= "0101";
		end case;
	end process;
	
	--- process cho trang thai ke tiep
	NEXTSTATE_LOGIC: 
	process (CurrentState, Start, Up) is
	begin
		case CurrentState is
			when waits =>
				if (Start='0') then
					NextState <= waits;
				elsif (Up='1') then
					NextState <= Up1;
				else
					NextState <= Down5;
				end if;
			when Up5 | Down1 =>
				NextState <= waits;
			when Up1	=>
				NextState <= Up2;
			when Up2	=>
				NextState <= Up3;
			when Up3	=>
				NextState <= Up4;
			when Up4	=>
				NextState <= Up5;
			when Down5	=>
				NextState <= Down4;
			when Down4	=>
				NextState <= Down3;
			when Down3	=>
				NextState <= Down2;
			when Down2	=>
				NextState <= Down1;
		end case;
	end process;

	--- process cap nhat trang thai hien tai
	STATE_REG: 
	process (NextState, reset, clk) is
	begin
		if (reset='1') then
			CurrentState <= waits;
		elsif (clk'event and clk='1') then
			CurrentState <= NextState;
		end if;
	end process;
	
end RTL;

