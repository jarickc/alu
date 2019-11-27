library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Full_Adder2 is -- Ports for this code

Port (
	operand1 : in STD_LOGIC_VECTOR(23 downto 0);
	operand2 : in STD_LOGIC_VECTOR(23 downto 0);
	Overflow : out STD_LOGIC;
	ALUControl : in STD_LOGIC;
	Negative : out STD_LOGIC;
	Result : out STD_LOGIC_VECTOR(23 downto 0)

);
end Full_Adder2;

architecture add of Full_Adder2 is

component Full_Adder -- Connecting ports from previous code

Port (
	a : in std_logic;
	b : in std_logic;
	sum : out std_logic;
	cout : out std_logic;
	ALUControl : in std_logic;
	cin : in std_logic
);
end component;

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22 : STD_LOGIC; -- Carries that are between Full Adders
signal S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23 : STD_LOGIC; -- Results from each full addition
begin

Adder0: Full_Adder port map (a => operand1(0), b => operand2(0), sum => S0, cout => C0, cin => ALUControl, ALUControl => ALUControl);
Adder1: Full_Adder port map (a => operand1(1), b => operand2(1), sum => S1, cout => C1, cin => C0, ALUControl => ALUControl);
Adder2: Full_Adder port map (a => operand1(2), b => operand2(2), sum => S2, cout => C2, cin => C1, ALUControl => ALUControl);
Adder3: Full_Adder port map (a => operand1(3), b => operand2(3), sum => S3, cout => C3, cin => C2, ALUControl => ALUControl);
Adder4: Full_Adder port map (a => operand1(4), b => operand2(4), sum => S4, cout => C4, cin => C3, ALUControl => ALUControl);
Adder5: Full_Adder port map (a => operand1(5), b => operand2(5), sum => S5, cout => C5, cin => C4, ALUControl => ALUControl);
Adder6: Full_Adder port map (a => operand1(6), b => operand2(6), sum => S6, cout => C6, cin => C5, ALUControl => ALUControl);
Adder7: Full_Adder port map (a => operand1(7), b => operand2(7), sum => S7, cout => C7, cin => C6, ALUControl => ALUControl);
Adder8: Full_Adder port map (a => operand1(8), b => operand2(8), sum => S8, cout => C8, cin => C7, ALUControl => ALUControl);
Adder9: Full_Adder port map (a => operand1(9), b => operand2(9), sum => S9, cout => C9, cin => C8, ALUControl => ALUControl);
Adder10: Full_Adder port map (a => operand1(10), b => operand2(10), sum => S10, cout => C10, cin => C9, ALUControl => ALUControl);
Adder11: Full_Adder port map (a => operand1(11), b => operand2(11), sum => S11, cout => C11, cin => C10, ALUControl => ALUControl);
Adder12: Full_Adder port map (a => operand1(12), b => operand2(12), sum => S12, cout => C12, cin => C11, ALUControl => ALUControl);
Adder13: Full_Adder port map (a => operand1(13), b => operand2(13), sum => S13, cout => C13, cin => C12, ALUControl => ALUControl);
Adder14: Full_Adder port map (a => operand1(14), b => operand2(14), sum => S14, cout => C14, cin => C13, ALUControl => ALUControl);
Adder15: Full_Adder port map (a => operand1(15), b => operand2(15), sum => S15, cout => C15, cin => C14, ALUControl => ALUControl);
Adder16: Full_Adder port map (a => operand1(16), b => operand2(16), sum => S16, cout => C16, cin => C15, ALUControl => ALUControl);
Adder17: Full_Adder port map (a => operand1(17), b => operand2(17), sum => S17, cout => C17, cin => C16, ALUControl => ALUControl);
Adder18: Full_Adder port map (a => operand1(18), b => operand2(18), sum => S18, cout => C18, cin => C17, ALUControl => ALUControl);
Adder19: Full_Adder port map (a => operand1(18), b => operand2(19), sum => S19, cout => C19, cin => C18, ALUControl => ALUControl);
Adder20: Full_Adder port map (a => operand1(20), b => operand2(20), sum => S20, cout => C20, cin => C19, ALUControl => ALUControl);
Adder21: Full_Adder port map (a => operand1(21), b => operand2(21), sum => S21, cout => C21, cin => C20, ALUControl => ALUControl);
Adder22: Full_Adder port map (a => operand1(22), b => operand2(22), sum => S22, cout => C22, cin => C21, ALUControl => ALUControl);
Adder23: Full_Adder port map (a => operand1(23), b => operand2(23), sum => S23, cout => Overflow, cin => C22, ALUControl => ALUControl);
Result <= S0 & S1 & S2 & S3 & S4 & S5 & S6 & S7 & S8 & S9 & S10 & S11 & S12 & S13 & S14 & S15 & S16 & S17 & S18 & S19 & S20 & S21 & S22 & S23; -- Concatenation of each full addition, broken up so the last bit can be reached.
Negative <= S23; -- The bit that determines if the value is negative or not.
end add;
