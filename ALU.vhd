library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
-- Attempt to make a truth table for an AND gate!
entity ALU_VHDL is
port(
a,b : in std_logic_vector; -- 2 operands, 1 bit each for AND gate
result : out std_logic_vector -- Output is 1 bit
);
end ALU_VHDL;
architecture Maths of ALU_VHDL is
begin
result <= a and b;
end Maths; 
