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
signal negative : STD_LOGIC;
begin

UUT: entity work.ALU port map (operand1 => operand1, operand2 => operand2, ALUControl => ALUControl, result => result, cout => cout, negative => negative);
operand1 <= 
x"0000FF", -- Successful Addition
x"FFFFFF" after 50 ns, -- Demonstrates carryout detection
x"00ABBB" after 100 ns, -- Successful Subtraction
x"AAAAAA" after 150 ns, -- Demonstrates zero detection and produces zero
x"0000FF" after 200 ns, -- Demonstrates negative detection as an error
x"AAAAAA" after 250 ns, -- Successful AND and OR (after 300 ns)
x"AFAFAF" after 350 ns, -- Successful comparison, operand1 > operand2
x"000AAA" after 400 ns, -- Successful comparison, operand1 < operand2
x"AAAAAA" after 450 ns, -- Successful comparison, operand1 = operand2
x"ABCABC" after 500 ns, -- Shift RIGHT, then LEFT after 550 ns
x"0000FF" after 600 ns; -- Addition with a non-defined ALUControl input
operand2 <= 
x"0000EA",
x"AAAAAA" after 50 ns,
x"0000AA" after 100 ns,
x"AAAAAA" after 150 ns,
x"ABCABC" after 200 ns,
x"BBBBBB" after 250 ns,
x"000AAA" after 350 ns,
x"AFAFAF" after 400 ns,
x"AAAAAA" after 450 ns,
x"000EEE" after 600 ns;
ALUControl <= "0100", -- Addition
"1000" after 100 ns, -- Subtraction
"0001" after 250 ns, -- AND
"1100" after 300 ns, -- OR
"0010" after 350 ns, -- Comparison
"1110" after 500 ns, -- Shift RIGHT
"1111" after 550 ns, -- Shift LEFT
"0011" after 600 ns; -- Demonstrates that any other value not defined in the code results in addition.
end arch;
