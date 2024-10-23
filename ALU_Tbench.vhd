----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Elijah Panayoty
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: ALU_tbench - Behavioral
-- Project Name: 
-- Target Devices: Xilinx Zynq-7010
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Tbench is
          
end ALU_Tbench;
architecture Behavioral of ALU_Tbench is

-- component declaration
component ALU is 
    port (
        A : in std_logic_vector (1 downto 0);
        B : in std_logic_vector (1 downto 0);
        S : in std_logic_vector (3 downto 0);
        Y : out std_logic_vector (3 downto 0)
     );
 end component; 
 
 -- initializing signals
 signal A : std_logic_vector (1 downto 0);
 signal B : std_logic_vector (1 downto 0);
 signal S : std_logic_vector (3 downto 0);
 signal Y : std_logic_vector (3 downto 0);

begin

--unit under test, UUT
uut : ALU port map (
    A => A,
    B => B,
    S => S, 
    Y => Y
);
sim_proc : process
begin
wait for 100 ns;
    A <= "00";
    B <= "11";
    S <= "0000";
    
    wait for 100 ns;
    A <= "11";
    B <= "01";
    S <= "0000";
    
    wait for 100 ns;
    A <= "10";
    B <= "01";
    S <= "0000";
    wait;
end process sim_proc;
end Behavioral;
