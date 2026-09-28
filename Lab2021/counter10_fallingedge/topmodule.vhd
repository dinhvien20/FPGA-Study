library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is
  Port ( 
    Start, Reset, clk   : in std_logic;
    seg                 : out std_logic_vector (6 downto 0);
    an                  : out std_logic_vector (3 downto 0)
  );
end topmodule;

architecture Behavioral of topmodule is
    -- khai bao 3 component
    -- COMPONENT 1: counter 10
    component counter10 is
    port 
    ( 
        Start, Reset, Clk: in std_logic;
        Output: out std_logic_vector(3 downto 0)
    );
    end component;
    
    -- COMPONENT 2: hex2seg
    component hex2seg is
    Port ( 
    hex : in std_logic_vector (3 downto 0);
    seg : out std_logic_vector (6 downto 0);
    an  : out std_logic_vector (3 downto 0)
    );
    end component;
    
    -- COMPONENT 3: clock_divider
    component clock_divider_100MHz_to_1Hz is
    Port ( clk : in  STD_LOGIC;	-- 100 MHz in clock
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);	-- 1Hz out clock
    end component;


    -- khai bao 2 tin hieu noi bo de thuc hien PORT MAP
    signal t1 : std_logic;
    signal t2 : std_logic_vector (3 downto 0);
    signal reset1 : std_logic;

begin

    -- thuc hien PORT MAP : ket noi cac component
    -- clock_divider
    U1: clock_divider_100MHz_to_1Hz Port map 
    (clk => clk, reset=> reset1, clk_out=> t1);
    reset1 <= not(reset);

    -- counter 10
    U2: counter10 port map
    (Start=>Start, Reset=>Reset, Clk=>t1, Output=>t2);
    
    -- hex2seg
    U3: hex2seg Port map 
    (hex=>t2, seg=>seg, an=>an);
    
end Behavioral;
