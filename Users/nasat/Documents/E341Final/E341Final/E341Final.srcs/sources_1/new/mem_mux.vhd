----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 05:17:14 PM
-- Design Name: 
-- Module Name: mem_mux - Behavioral
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

entity mem_mux is
    Port ( sr1 : in std_logic_vector(7 downto 0);
           sr2 : in std_logic_vector(7 downto 0);
           imm : in std_logic_vector(7 downto 0);
           address : out std_logic_vector(7 downto 0);
           sel, l : in STD_LOGIC);
end mem_mux;

architecture Behavioral of mem_mux is
signal s: std_logic_vector( 7 downto 0); 
begin
with l select s<=
    sr1 when '0', 
    sr2 when '1', 
   "UUUUUUUU" when others;  
    with sel select address<=
    imm when '0', 
    s when '1',
    "UUUUUUUU" when others;  
end Behavioral;
