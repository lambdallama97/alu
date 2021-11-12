----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 02:29:52 PM
-- Design Name: 
-- Module Name: pc_mux - Behavioral
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

entity pc_mux is
 Port ( pc_p2 : in std_logic_vector(7 downto 0);
           pc_pimm : in std_logic_vector(7 downto 0);
           sel : in STD_LOGIC;
           pc_out : out std_logic_vector(7 downto 0));
end pc_mux;

architecture Behavioral of pc_mux is

begin
 with sel select pc_out <= 
    pc_p2 when '0', 
    pc_pimm when '1', 
    "--------" when others; 
end Behavioral;
