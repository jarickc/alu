library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
port(
operand1 : in STD_LOGIC_VECTOR(23 downto 0);
operand2 : in STD_LOGIC_VECTOR(23 downto 0);
ALUControl : in STD_LOGIC_VECTOR(3 downto 0);
result : out STD_LOGIC_VECTOR(23 downto 0);
cout : out STD_LOGIC
);
end ALU;

architecture arch of ALU is

signal ALU_result : STD_LOGIC_VECTOR(24 downto 0);
begin
	
	process (operand1, operand2, ALUControl)
	begin
	case(ALUControl) is
		when "0100" => -- Addition
			ALU_result <= ('0' & operand1) + ('0' & operand2);

		when "1000" => -- Subtraction. Kept consistent with addition to represent the research done in the FDP.
			ALU_result <= ('0' & operand1) + ('0' & not operand2) + '1';
		when "0010" =>  -- Comparator

			if (operand1 > operand2) then -- Is A greater than B? 
				ALU_Result <= "0000000000000000000000010";
			elsif (operand1 = operand2) then -- If not, then is it equal?
				ALU_Result <= "0000000000000000000000000";
			else -- If it isn't greater than or equal to it, then it MUST be less than.
				ALU_Result <= "0000000000000000000000001";
			end if;

		when others => -- Addition or Subtraction based on the ALUControl.
			ALU_result <= ('0' & operand1) + ('0' & operand2);
	end case;
	end process;
cout <= ALU_result(24);	
result <= ALU_result(23 downto 0);
end arch;