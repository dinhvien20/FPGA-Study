library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is
  Port ( 
    w0, w1, w2, w3  : in std_logic_vector (3 downto 0);
    s0, s1          : in std_logic;
    seg             : out std_logic_vector (6 downto 0);
    an              : out std_logic_vector (3 downto 0)
  );
end topmodule;

architecture Behavioral of topmodule is
    -- khai bao cac COMPONENT
    -- component 1: mux4to1
    component mux4to1 is
        Port (w0, w1, w2, w3 : in std_logic_vector (3 downto 0);
            s0, s1 : in std_logic;
            y : out std_logic_vector (3 downto 0)
        );
    end component;

    -- component 2: hex2seg
    component hex2seg is
    Port 
    (   HEX : in std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0);
        an  : out std_logic_vector(3 downto 0)
        );
    end component;

    -- khai bao tin hieu de thuc hien PORT MAP
    signal temp : std_logic_vector (3 downto 0);    

begin

    -- Thuc hien PORT MAP
    -- ket noi 2 components: mux4to1 va hex2seg
    
    -- port map: mux4to1
    U1: mux4to1 Port map (w0=>w0, w1=>w1, w2=>w2, w3=>w3, s0=>s0, s1=>s1, y=>temp);
    
    -- port map: hex2seg
    U2: hex2seg Port map (HEX=>temp, seg=>seg, an=>an);

end Behavioral;
