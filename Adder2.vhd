----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 02:00:09 PM
-- Design Name: 
-- Module Name: Adder2 - Behavioral
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

entity Adder2 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC);
end Adder2;

architecture Behavioral of Adder2 is

signal X0 : std_logic;

component FullAdder is

    port (
    A, B, Cin   : in std_logic;
    S, Cout     : out std_logic
    );
    
end component;

begin

fa0: FullAdder port map(A => A0, B => B0, Cin => '0', S => S0, Cout => X0);
fa1: FullAdder port map(A => A1, B => B1, Cin => X0, S => S1, Cout => S2);

end Behavioral;
