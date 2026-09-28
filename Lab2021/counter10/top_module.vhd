library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is
  Port (
    clk, reset, start : in std_logic;
    seg:    out std_logic_vector (6 downto 0);
    an :    out std_logic_vector (3 downto 0)
    );
end topmodule;

architecture Struct of topmodule is
    signal t1: std_logic;   
    signal t2: std_logic_vector (3 downto 0);

    component clock_divider_100MHz_to_1Hz is
        Port ( clk : in  std_logic;	
           reset : in  std_logic;
           clk_out : out  std_logic);
    end component;

    component counter10 is
        port(   start, reset, clk: in std_logic;
                output: out std_logic_vector (3 downto 0)
        );
    end component;
    
    component hex2seg is
        Port (  hex : in std_logic_vector (3 downto 0);
                seg : out std_logic_vector (6 downto 0);
                an  : out std_logic_vector (3 downto 0) 
        );
    end component;
    
begin
   ClockDivider : clock_divider_100MHz_to_1Hz port map
        (clk => clk, reset => reset, clk_out => t1);
   Counter : counter10 port map
        (start => start, reset => reset, clk => t1, output => t2); 
   HegToSeg : hex2seg port map 
        (hex => t2, seg => seg, an => an);  
end Struct;
