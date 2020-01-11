library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Brings all of the programs together.
entity Full_Adder_TB is
end Full_Adder_TB;

architecture TB of Full_Adder_TB is
	signal operand1 : std_logic_vector(23 downto 0); -- Since this is a test bench, all of the variables must initially be declared as signals so they can apply the data from the outside adder.
	signal operand2 : std_logic_vector(23 downto 0);
	signal Result : std_logic_vector(23 downto 0);
	signal ALUControl : std_logic;
	signal Negative : std_logic;
begin

UUT : entity work.Full_Adder2 port map (operand1 => operand1, operand2 => operand2, result => result, ALUControl => ALUControl, Negative => Negative); -- Each signal corresponds to the Full_Adder programs'.

operand1 <= x"AAAAAA", x"BBBBBB" after 20 ns, x"00000F" after 40 ns; -- These were the first hexadecimal values that came to mind. They can be changed freely.
operand2 <= x"DDDDDD", x"EEEEEE" after 20 ns, x"00000A" after 40 ns;
ALUControl <= '1';

end TB;