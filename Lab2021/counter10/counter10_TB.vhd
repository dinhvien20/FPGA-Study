library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter10_TB is
--  Port ( );
end counter10_TB;

architecture Behavioral of counter10_TB is

    -- signal for DUT
    signal Start, Reset, Clk: std_logic;
    signal Output: std_logic_vector (3 downto 0);
    
    -- component declaration for DUT
    component FSM is
    port
    (
        Start, Reset, Clk: in std_logic;
        Output: out std_logic_vector (3 downto 0)
    );
    end component;

    constant clk_period : time := 10 ns;
    
begin

    -- clock generation process
    -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
   
   
    -- port map the DUT: Design Under Test
    DUT : FSM port map
    (Start => Start, Reset => Reset, Clk => Clk,
        Output=> Output
    );
    
    -- stimulus process
    stimulus: process
    begin
        start <= '0'; -- no count at beginning
        wait for clk_period*5;
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        
        -- allow counting from now on
        start <= '1';
        
        wait for clk_period * 16;
        
        -- stop counting
        start <= '0';
        wait for clk_period * 5;
        
        -- continue counting
        start <= '1';
        wait for clk_period * 5;
        
        wait; -- wait forever
        
    end process;

end Behavioral;
