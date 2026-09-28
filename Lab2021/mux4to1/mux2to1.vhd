library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
  Port (
    a, b    : in std_logic_vector (3 downto 0);
    s       : in std_logic;
    y       : out std_logic_vector (3 downto 0)
   );
end mux2to1;

architecture Behavioral of mux2to1 is
begin
    y <= a when (s='1') else b;
end Behavioral;
