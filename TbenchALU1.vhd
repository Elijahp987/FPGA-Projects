----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Elijah Panayoty
-- 
-- Create Date: 10/21/2024 01:02:40 PM
-- Design Name: 
-- Module Name: TbenchALU1 - Behavioral
-- Project Name: TbenchALU1
-- Target Devices: Xilinx Zynq-7010
-- Tool Versions: Xilinx Vivado 2024.1
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TbenchALU1 is
--  Port ( );
end TbenchALU1;

architecture Behavioral of TbenchALU1 is

component ALU1 is -- component declaration is always inside the architecture
    port (A, B : in std_logic_vector(1 downto 0);
          S    : in std_logic_vector(3 downto 0);
          Y    : out std_logic_vector(3 downto 0)
          );
 end component;
 
 signal A : std_logic_vector(1 downto 0);
 signal B : std_logic_vector(1 downto 0);
 signal S : std_logic_vector(3 downto 0);
 signal Y : std_logic_vector(3 downto 0);
 
begin
 
uut : ALU1 port map (
    A => A,
    B => B,
    S => S,
    Y => Y
    );
    
sim_proc :  process
begin

    -- S = "0000" for function 5
    wait for 50 ns;
    S <= "0000";
    A <= "01";
    B <= "01";
    wait for 50 ns;
    A <= "01";
    B <= "10";
    wait for 50 ns;
    A <= "10";
    B <= "01";
    wait for 50 ns;
    A <= "11";
    B <= "11";
    
    -- S = "0001" for function 1
    wait for 50 ns;
    S <= "0001";
    A <= "01";
    B <= "01";
    wait for 50 ns;
    A <= "01";
    B <= "10";
    wait for 50 ns;
    A <= "10";
    B <= "01";
    wait for 50 ns;
    A <= "11";
    B <= "11";
    
    -- S = "0010" for function 2
    wait for 50 ns;
    S <= "0010";
    A <= "01";
    B <= "01";
    wait for 50 ns;
    A <= "01";
    B <= "10";
    wait for 50 ns;
    A <= "10";
    B <= "01";
    wait for 50 ns;
    A <= "11";
    B <= "11";
    
    -- S = "0100" for function 3
    wait for 50 ns;
    S <= "0100";
    A <= "01";
    B <= "01";
    wait for 50 ns;
    A <= "01";
    B <= "10";
    wait for 50 ns;
    A <= "10";
    B <= "01";
    wait for 50 ns;
    A <= "11";
    B <= "11";
    
    -- S = "1000" for function 4
    wait for 50 ns;
    S <= "1000";
    A <= "01";
    B <= "01";
    wait for 50 ns;
    A <= "01";
    B <= "10";
    wait for 50 ns;
    A <= "10";
    B <= "01";
    wait for 50 ns;
    A <= "11";
    B <= "11";
    wait;
  end process sim_proc;
  
end Behavioral;
