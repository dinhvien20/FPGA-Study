library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    port
    (
        Start, Reset, Clk: in std_logic;
        Output: out std_logic_vector (3 downto 0)
    );
end FSM;

architecture Behav of FSM is
    type FSM_States is (Waits, Up1, Up2, Up3, Up4, Up5, Up6, Up7, Up8, Up9);
    signal CurrentState, NextState : FSM_States;
begin
    OutputLogic: process(CurrentState) is
    begin
    case CurrentState is
        when Waits => Output <= "0000";
        when Up1 => Output <= "0001";
        when Up2 => Output <= "0010";
        when Up3 => Output <= "0011";
        when Up4 => Output <= "0100";
        --
        when Up9 => Output <= "1001";
        when Up5 => Output <= "0101";
        when Up6 => Output <= "0110";
        when Up7 => Output <= "0111";
        when Up8 => Output <= "1000";
    end case;
    end process;
    
    
    NextStateLogic: process(CurrentState,Start) is
    begin
    case CurrentState is
        -- trang thai 0
        when Waits =>
            if (Start='0') then
                NextState <= Waits;
            else
                NextState <= Up1;
            end if;
        -- trang thai 1
        when Up1 =>
            if (Start='0') then -- khong dem
                NextState <= Up1;
            else -- Start = 1 thi dem len 2
                NextState <= Up2;
            end if;
         -- trang thai 2
        when Up2 =>
            if (Start='0') then -- khong dem
                NextState <= Up2;
            else -- Start = 1 thi dem len 3
                NextState <= Up3;
            end if;
         -- trang thai 3
        when Up3 =>
            if (Start='0') then -- khong dem
                NextState <= Up3;
            else -- Start = 1 thi dem len 4
                NextState <= Up4;
            end if;
         -- trang thai 4
        when Up4 =>
            if (Start='0') then -- khong dem
                NextState <= Up4;
            else -- Start = 1 thi dem len 5
                NextState <= Up5;
            end if;
         -- trang thai 5
        when Up5 =>
            if (Start='0') then -- khong dem
                NextState <= Up5;
            else -- Start = 1 thi dem len 6
                NextState <= Up6;
            end if;
         -- trang thai 6
        when Up6 =>
            if (Start='0') then -- khong dem
                NextState <= Up6;
            else -- Start = 1 thi dem len 7
                NextState <= Up7;
            end if;
         -- trang thai 7
        when Up7 =>
            if (Start='0') then -- khong dem
                NextState <= Up7;
            else -- Start = 1 thi dem len 8
                NextState <= Up8;
            end if;
         -- trang thai 8
        when Up8 =>
            if (Start='0') then -- khong dem
                NextState <= Up8;
            else -- Start = 1 thi dem len 9
                NextState <= Up9;
            end if;
         -- trang thai 9
        when Up9 =>
            if (Start='0') then -- khong dem
                NextState <= Up9;
            else -- Start = 1 thi dem ve 0
                NextState <= Waits;
            end if;
    end case;
    end process;
    
    StateRegister: process(NextState,Clk,Reset) is
    begin
        if Reset='1' then
            CurrentState <= Waits;
        elsif (Clk'event and Clk='1') then
            CurrentState <= NextState;
        end if;
    end process;
end Behav;
