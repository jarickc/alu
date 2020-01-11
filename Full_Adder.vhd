library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- The base Full Adder for the addition and subtraction circuit.
entity Full_Adder is
port(
a : in std_logic; -- Each variable is only 1 bit, so vectors are not needed.
b : in std_logic;
cin : in std_logic;
ALUControl : in std_logic;
sum : out std_logic;
cout : out std_logic
); 
end Full_Adder;

architecture arch of Full_Adder is
signal ab: std_logic_vector(1 downto 0); -- Signals are like ports, but don't I/O. Rather, they act as intermediate variables.
signal aandb, abandcin, absum, b2 : std_logic;
begin
	b2 <= ALUControl xor b;
	ab <= '0' & a + b2 + cin; -- The 0 acts as an overflow for the sum to carry over too if there are 2 or more 1's inputted.
	sum <= ab(0); -- The LSB is the bit that adds A and B.
	absum <= a xor b2; -- This is addition.
	abandcin <= absum and cin; -- A factor of the carryout. 
	aandb <= a and b2; -- If A and B are both 1, then their value will carry over.
	cout <= abandcin or aandb; -- Only one of these will occur at once, and if either do then a carryout is needed.
end arch;