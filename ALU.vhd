library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
-- Attempt to make a truth table for an AND gate!
entity ALU_VHDL is

port(
operand1 : in std_logic;
operand2 : in std_logic; -- 2 operands, 1 bit each for AND gate
result : out std_logic -- Output is 1 bit
);
end ALU_VHDL;
architecture Maths of ALU_VHDL is
begin
result <= operand1 and operand2;
end Maths; 
