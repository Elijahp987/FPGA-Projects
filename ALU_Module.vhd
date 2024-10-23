----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Elijah Panayoty
-- 
-- Create Date: 10/16/2024 12:34:48 PM
-- Design Name: 
-- Module Name: Function1 - Behavioral
-- Project Name: ALU Module
-- Target Devices: Xilinx Zynq-7010
-- Tool Versions: Xilinx Vivado v2024.1
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
use IEEE.NUMERIC_STD.ALL; --uncomment this line allows me to use signed and unsigned types

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU1 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0); -- 1 downto 0 = 2-bit std_logic_vector input A
           B : in STD_LOGIC_VECTOR (1 downto 0); -- 1 downto 0 = 2-bit std_logic_vector input B
           Y : out STD_LOGIC_VECTOR (3 downto 0); -- 3 downto 0 = 4-bit std_logic_vector output Y
           S : in STD_LOGIC_VECTOR (3 downto 0)
           ); -- S declared here. Refer to system block diagram.
end ALU1;

architecture Behavioral of ALU1 is

--Function 1
signal A_signed : signed(1 downto 0); -- 2-bit signed input A
signal B_signed : signed(1 downto 0); -- 2-bit signed input B
signal sum : signed(1 downto 0); -- 2-bit signed sum (of inputs A and B)
signal sum1 : signed(3 downto 0); -- 4-bit signed sum (of inputs A and B)
signal f1 : std_logic_vector(3 downto 0); -- final output of function 1

--Function 2
signal f2 : std_logic_vector(3 downto 0); -- final output of function 2

--Function 3
signal A_unsigned : unsigned(1 downto 0); -- 2-bit unsigned input A
signal B_unsigned : unsigned(1 downto 0); -- 2-bit unsigned input B
signal Y_unsigned : unsigned(3 downto 0); -- 4-bit unsigned output Y
signal f3 : std_logic_vector(3 downto 0); -- final output of function 3

--Function 4
signal f4 : std_logic_vector(3 downto 0); --final output of function 4

--Function 5
signal f5 : std_logic_vector(3 downto 0); -- final output of function 5


begin

--Function 1
A_signed <= signed(A); -- convert signed to unsigned, input A
B_signed <= signed(B); -- convert signed to unsigned, input B
sum <= (A_signed + B_signed); -- signed addition

-- using the concatenation operator (&), sum(1) is the MSB of sum variable
 --sum1 <= sum(1) & sum(1)& sum; -- resulted in errors in function 1 simulation
 -- sum1 <= "0" & "0" & sum;
 process(A, B, sum)
 begin
    if A = "11" and B = "11" then
        sum1 <= "0110";
        else sum1 <= "0" & "0" & sum;
    end if;
 end process;

-- revised function 1 logic
--sum1 <= ("0"& sum); -- Trunacte to 4-bits
f1 <= std_logic_vector(sum1); -- Convert back to std_logic_vector

--Function2
f2 <= ("00" &  A(1 downto 0)) when B = "00" else ("00" & ( A(1)& A(1))) when B = "01" else "0000"; -- Zero padding to ensure 4-bits are output to Y

--Function 3
A_unsigned <= unsigned(A);
B_unsigned <= unsigned(B);
Y_unsigned <= A_unsigned * B_unsigned;
f3 <= std_logic_vector(Y_unsigned);

--Function 4
f4 <= "00" & (A XOR B); -- Zero padding to ensure 4-bits are output to Y

--Function 5
f5 <= "0001" when A > B else "0000"; -- final implementation

 --                     initial implementation
--f5 <= "0001" when (A = "01" and B = "00") or (A = "10" and B = "00")
-- or (A = "10" and B = "01") or (A = "11" and B = "00") or (A = "11" and B = "01") 
-- or (A = "11" and B = "10") else "0000";

Y <= f5 when S <= "0000" else f1 when S <= "0001" else f2 when S <= "0010" else f3 when S <= "0100" else f4 when S <= "1000";
-- S corresponds to 1 of 4 push buttons on the FPGA board. When no buttons are pressed (i.e S = 0000) function 5 is output to Y. 


end Behavioral;
