library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_model is
generic(N: positive:= 8);
port(
clk, rst : in std_logic;
WE : in std_logic; -- Write Enable
A: in std_logic_vector( N-1 downto 0); -- Address
DI: in std_logic_vector(15 downto 0); -- Data In
DO: out std_logic_vector(15 downto 0) -- Data Out
);
end RAM_model;

architecture my_RAM of RAM_model is

type RAMtype is array(0 to 255) of std_logic_vector (15 downto 0); -- 256 Memory locations due to 8-bit address

signal DM : RAMtype;

begin

process (rst,clk) is
begin

if (rst = '1') then

	DM <= (others => (others => '0')); -- reset all bits to 0

elsif (clk ='1' and clk'event) then
	
	DO <= DM(TO_INTEGER(UNSIGNED(A))); -- read from RAM address and place on output

	if (WE = '1') then

		DM(to_integer(unsigned(A))) <= DI; -- write to RAM address the data in the input
	
	end if;

end if;

end process;

end my_RAM;
