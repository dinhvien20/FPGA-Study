LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter6_TB IS
END counter6_TB;
 
ARCHITECTURE behavior OF counter6_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter6
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         up : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal up : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter6 PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          up => up,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset <= '1';
		wait for clk_period*2;
		reset <= '0';
		
      -- insert stimulus here 
		start <='1';
		up 	<= '1';
		wait for clk_period*7;
		up 	<= '0';
		
      wait;
   end process;

END;
