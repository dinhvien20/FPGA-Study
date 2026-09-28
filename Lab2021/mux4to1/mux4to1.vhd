library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
  Port (
    w0, w1, w2, w3 : in std_logic_vector (3 downto 0);
    s0, s1 : in std_logic;
    y : out std_logic_vector (3 downto 0)
   );
end mux4to1;

architecture Behavioral of mux4to1 is
    -- khai bao COMPONENT
    component mux2to1 is
        Port (
        a, b    : in std_logic_vector (3 downto 0);
        s       : in std_logic;
        y       : out std_logic_vector (3 downto 0)
       );
    end component;
    
    -- khai bao local signal
    signal t1, t2 : std_logic_vector (3 downto 0);
    
begin
    -- port map
    -- U1
    U1: mux2to1 Port map (a =>w0, b=>w1, s =>s0,  y=>t1);       
    
    -- U2
    U2: mux2to1 Port map (a =>w2, b=>w3, s =>s0,  y=>t2); 
    
    -- U3
    U3: mux2to1 Port map (a =>t1, b=>t2, s =>s1,  y=>y);
    
    
    

end Behavioral;
