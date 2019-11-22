library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder2 is

Port (
	operand1 : in STD_LOGIC_VECTOR(23 downto 0);
	operand2 : in STD_LOGIC_VECTOR(23 downto 0);
	Cin : in STD_LOGIC;
	Cfout : out STD_LOGIC; -- There are many, many carries in this code, so it is helpful to distinguish between them.
	totalSum : out STD_LOGIC_VECTOR(23 downto 0)
);
end Full_Adder2;

architecture add of Full_Adder2 is

component Full_Adder -- This employs the I/O variables in this code, so that they can be mapped onto the above variables later on.

Port (
	a : in std_logic;
	b : in std_logic;
	sum : out std_logic;
	cout : out std_logic;
	cin : in std_logic
);
end component;

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22 : STD_LOGIC; -- Carries that are between Full Adders

begin

Adder0: Full_Adder port map (a => operand1(0), b => operand2(0), sum => totalSum(0), cout => C0, cin => Cin); -- If there is a first carry in, then subtraction is occuring.
Adder1: Full_Adder port map (a => operand1(1), b => operand2(1), sum => totalSum(1), cout => C1, cin => C0);
Adder2: Full_Adder port map (a => operand1(2), b => operand2(2), sum => totalSum(2), cout => C2, cin => C1);
Adder3: Full_Adder port map (a => operand1(3), b => operand2(3), sum => totalSum(3), cout => C3, cin => C2);
Adder4: Full_Adder port map (a => operand1(4), b => operand2(4), sum => totalSum(4), cout => C4, cin => C3);
Adder5: Full_Adder port map (a => operand1(5), b => operand2(5), sum => totalSum(5), cout => C5, cin => C4);
Adder6: Full_Adder port map (a => operand1(6), b => operand2(6), sum => totalSum(6), cout => C6, cin => C5);
Adder7: Full_Adder port map (a => operand1(7), b => operand2(7), sum => totalSum(7), cout => C7, cin => C6);
Adder8: Full_Adder port map (a => operand1(8), b => operand2(8), sum => totalSum(8), cout => C8, cin => C7);
Adder9: Full_Adder port map (a => operand1(9), b => operand2(9), sum => totalSum(9), cout => C9, cin => C8);
Adder10: Full_Adder port map (a => operand1(10), b => operand2(10), sum => totalSum(10), cout => C10, cin => C9);
Adder11: Full_Adder port map (a => operand1(11), b => operand2(11), sum => totalSum(11), cout => C11, cin => C10);
Adder12: Full_Adder port map (a => operand1(12), b => operand2(12), sum => totalSum(12), cout => C12, cin => C11);
Adder13: Full_Adder port map (a => operand1(13), b => operand2(13), sum => totalSum(13), cout => C13, cin => C12);
Adder14: Full_Adder port map (a => operand1(14), b => operand2(14), sum => totalSum(14), cout => C14, cin => C13);
Adder15: Full_Adder port map (a => operand1(15), b => operand2(15), sum => totalSum(15), cout => C15, cin => C14);
Adder16: Full_Adder port map (a => operand1(16), b => operand2(16), sum => totalSum(16), cout => C16, cin => C15);
Adder17: Full_Adder port map (a => operand1(17), b => operand2(17), sum => totalSum(17), cout => C17, cin => C16);
Adder18: Full_Adder port map (a => operand1(18), b => operand2(18), sum => totalSum(18), cout => C18, cin => C17);
Adder19: Full_Adder port map (a => operand1(19), b => operand2(19), sum => totalSum(19), cout => C19, cin => C18);
Adder20: Full_Adder port map (a => operand1(20), b => operand2(20), sum => totalSum(20), cout => C20, cin => C19);
Adder21: Full_Adder port map (a => operand1(21), b => operand2(21), sum => totalSum(21), cout => C21, cin => C20);
Adder22: Full_Adder port map (a => operand1(22), b => operand2(22), sum => totalSum(22), cout => C22, cin => C21);
Adder23: Full_Adder port map (a => operand1(23), b => operand2(23), sum => totalSum(23), cout => Cfout, cin => C22);

end add;
