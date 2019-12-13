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
cout : out STD_LOGIC;
negative : out STD_LOGIC
);
end ALU;

architecture arch of ALU is

signal ALU_resultaddsub : STD_LOGIC_VECTOR(24 downto 0);
signal ALU_result : STD_LOGIC_VECTOR(23 downto 0);
begin

	process (operand1, operand2, ALUControl)
	begin
	case(ALUControl) is
		when "0100" => -- Addition
			ALU_resultaddsub <= ('0' & operand1) + ('0' & operand2); -- Concatenation allows the final carry to be realized.
			ALU_result <= operand1 + operand2;

		when "1000" => -- Subtraction
			ALU_resultaddsub <= ('0' & operand1) - ('0' & operand2);
			if (operand1 = operand2) then
				ALU_result <= "000000000000000000000000"; -- Depending on what works better, another output may be created for zero instead of manipulating ALU_Result.
			else
				ALU_result <= operand1 - operand2;
			end if;
		when "0001" => -- Boolean AND
			ALU_result <= operand1 and operand2;

		when "1100" => -- Boolean OR
			ALU_result <= operand1 or operand2;

		when "0010" =>  -- Comparator
			if (operand1 > operand2) then -- Is A greater than B? 
				ALU_result <= "000000000000000000000010";
			elsif (operand1 = operand2) then -- If not, then is it equal?
				ALU_result <= "000000000000000000000000";
			else -- If it isn't greater than or equal to it, then it MUST be less than.
				ALU_result <= "000000000000000000000001";
			end if;

		when "1110" => -- Shift RIGHT: Takes the LSB and makes it the MSB.
			ALU_Result <= operand1(0) & operand1(23 downto 1); -- It is assumed that if a shift is desired, then only 1 operand is inputted.

		when "1111" => -- Shift LEFT: Takes the MSB and makes it the LSB.
			ALU_Result <= operand1(22 downto 0) & operand1(23);

		when others => -- Addition or Subtraction based on the ALUControl.
			ALU_resultaddsub <= ('0' & operand1) + ('0' & operand2);
			ALU_result <= operand1 + operand2;

	end case;
	end process;

cout <= ALU_resultaddsub(24);
negative <= ALU_resultaddsub(24);
result <= ALU_result;

end arch;
