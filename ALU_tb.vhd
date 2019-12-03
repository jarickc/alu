library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU_tb is
end ALU_tb;

architecture arch of ALU_tb is
signal operand1 : STD_LOGIC_VECTOR(23 downto 0);
signal operand2 : STD_LOGIC_VECTOR(23 downto 0);
signal ALUControl : STD_LOGIC_VECTOR(3 downto 0);
signal result : STD_LOGIC_VECTOR(23 downto 0);
signal cout : STD_LOGIC;
begin

UUT: entity work.ALU port map (operand1 => operand1, operand2 => operand2, ALUControl => ALUControl, result => result, cout => cout);
operand1 <= x"555555";
operand2 <= x"555555";
ALUControl <= "0100";
end arch;