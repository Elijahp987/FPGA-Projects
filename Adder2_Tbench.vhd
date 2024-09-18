----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Elijah Panayoty
-- 
-- Create Date: 09/01/2023 03:01:34 PM
-- Design Name: 
-- Module Name: Adder2_Tbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

entity Adder2_Tbench is
--  Port ( );
end Adder2_Tbench;

architecture Behavioral of Adder2_Tbench is

component Adder2 is

    port (
    A0, A1, B0, B1   : in std_logic;
    S0, S1, S2     : out std_logic
    );
    
end component;

signal A0, A1, B0, B1, S0, S1, S2   : std_logic;

begin

uut : Adder2 port map (

A0 => A0,
A1 => A1,
B0 => B0,
B1 => B1,
S0 => S0,
S1 => S1,
S2 => S2

);

stim_proc : process
begin
    wait for 100 ns;
    A0 <= '0';
    A1 <= '1';
    B0 <= '0';
    B1 <= '1';

    wait for 100 ns;
    A0 <= '1';
    A1 <= '1';
    B0 <= '1';
    B1 <= '1';
    wait;
end process stim_proc;

end Behavioral;
