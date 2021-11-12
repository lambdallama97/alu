----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 07:05:46 PM
-- Design Name: 
-- Module Name: regin_mux - Behavioral
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

entity regin_mux is
    Port ( alu : in std_logic_vector(15 downto 0);
           dr_ss : in std_logic_vector(15 downto 0);
           mem : in std_logic_vector(15 downto 0);
           regin : out std_logic_vector(15 downto 0);
           sel: in std_logic; 
           setlt_s : in STD_LOGIC);
end regin_mux;

architecture Behavioral of regin_mux is
signal s: std_logic_vector(15 downto 0); 
begin

with setlt_s select s <=
    alu when '0', 
    dr_ss when '1', 
    "UUUUUUUUUUUUUUUU" when others; 

with sel select regin<=
    s when '0', 
    mem when '1',
    "UUUUUUUUUUUUUUUU" when others;  
 
end Behavioral;
