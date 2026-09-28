library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter10 is
    port 
    ( 
        Start, Reset, Clk: in std_logic;
        Output: out std_logic_vector(3 downto 0)
    );
end counter10;

architecture Behavioral of counter10 is
    -- khai bao cac trang thai cua bo dem
    type FSM_States is (zero, Up1, Up2, Up3, Up4, Up5, Up6, Up7, Up8, Up9);
    -- khai bao 2 tin hieu bieu dien trang thai hien tai va trang tai tiep theo
    signal CurrentState, NextState : FSM_States;

begin
    -- 
    OutputLogic: process(CurrentState) is
    begin
        case CurrentState is
            when zero => Output <= "0000";
            when Up1 => Output <= "0001";
            when Up2 => Output <= "0010";
            when Up3 => Output <= "0011";
            when Up4 => Output <= "0100";
            when Up5 => Output <= "0101";
            when Up6 => Output <= "0110";
            when Up7 => Output <= "0111";
            when Up8 => Output <= "1000";
            when Up9 => Output <= "1001";
        end case;
    end process;

    -- trang thai tiep theo
    NextStateLogic: process(CurrentState,Start) is
    begin
    case CurrentState is
        -- 0
        when zero =>    -- neu hien tai la trang thai 0
            if (Start='0') then 
                NextState <= zero;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up1; -- dem len
            end if;
        -- 1
        when Up1 =>    -- neu hien tai la trang thai 1
            if (Start='0') then 
                NextState <= Up1;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up2; -- dem len
            end if;
        -- 2
        when Up2 =>    
            if (Start='0') then 
                NextState <= Up2;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up3; -- dem len
            end if;
       -- 3
        when Up3 =>    -- neu hien tai la trang thai 1
            if (Start='0') then 
                NextState <= Up3;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up4; -- dem len
            end if;
        -- 4
        when Up4 =>    
            if (Start='0') then 
                NextState <= Up4;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up5; -- dem len
            end if;
        -- 5
        when Up5 =>    
            if (Start='0') then 
                NextState <= Up5;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up6; -- dem len
            end if;
        -- 6
        when Up6 =>    
            if (Start='0') then 
                NextState <= Up6;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up7; -- dem len
            end if;
       -- 7
        when Up7 =>    
            if (Start='0') then 
                NextState <= Up7;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up8; -- dem len
            end if;
        -- 8
        when Up8 =>    
            if (Start='0') then 
                NextState <= Up8;  -- giu nguyen trang thai: khong dem
            else
                NextState <= Up9; -- dem len
            end if;
        -- 9
        when Up9 =>    
            if (Start='0') then 
                NextState <= Up9;  -- giu nguyen trang thai: khong dem
            else
                NextState <= zero; -- dem len
            end if;     
    end case;
    end process;

    -- thanh ghi trang thai
    StateRegister: process(NextState,Clk,Reset) is
    begin
        if Reset='0' then
            CurrentState <= zero;
        elsif (Clk'event and Clk='0') then
            CurrentState <= NextState;
        end if;
    end process;

end Behavioral;
