library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;

entity Full_Adder is
port(
a : in std_logic;
b : in std_logic;
cin : in std_logic;
sum : out std_logic;
cout : out std_logic
); 
end Full_Adder;

architecture arch of Full_Adder is
signal ab, aandb, abandcin : std_logic;
begin
ab <= a xor b;
sum <= ab xor cin;
abandcin <= ab and cin;
aandb <= a and b;
cout <= abandcin or aandb;
end arch;