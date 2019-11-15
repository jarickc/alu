library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;

entity AND_TB is
end AND_TB;

architecture TB of AND_TB is
	signal operand1 : std_logic;
	signal operand2 : std_logic;
	signal result : std_logic;
begin
 UUT : entity work.ALU_VHDL port map (operand1 => operand1, operand2 => operand2, result => result);

operand1 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
operand2 <= '0', '1' after 40 ns;

end TB;