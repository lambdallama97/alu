----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 02:34:37 PM
-- Design Name: 
-- Module Name: sign_extend - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_extend is
    Port ( input : in std_logic_vector(5 downto 0);
           output : out std_logic_vector(15 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is

begin
process(input) 
    begin 
        if input(5) = '0' then 
            output <= "0000000000" & input; 
        else
            output<= "1111111111" & input; 
        end if; 
    end process; 
end Behavioral;
