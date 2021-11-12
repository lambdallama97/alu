----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 07:02:20 PM
-- Design Name: 
-- Module Name: src2_mux - Behavioral
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

entity src2_mux is
    Port ( reg2 : in std_logic_vector(15 downto 0);
           imm : in std_logic_vector(15 downto 0);
           I : in STD_LOGIC;
           src_2 : out std_logic_vector(15 downto 0));
end src2_mux;

architecture Behavioral of src2_mux is

begin

    with I select src_2 <= 
    reg2 when '0', 
    imm when '1', 
    "----------------" when others; 
end Behavioral;
