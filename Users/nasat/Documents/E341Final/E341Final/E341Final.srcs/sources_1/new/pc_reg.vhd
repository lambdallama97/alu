----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 02:57:23 PM
-- Design Name: 
-- Module Name: pc_reg - Behavioral
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

entity pc_reg is
    port(CLK: in std_logic;
    rst: in std_logic; 
    pc_update: in std_logic;
    Reg_in: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)); 
end pc_reg;

architecture Behavioral of pc_reg is
signal reg_s: std_logic_vector(7 downto 0); 
begin
    process(CLK, rst)
    begin 
        if rst='1' then 
            reg_s <="00000000"; 
        elsif CLK = '1' and CLK'event then 
            if pc_update = '1' then 
                reg_s<= reg_in; 
            end if; 
        end if; 
    end process; 
    out1 <= reg_s;  
end Behavioral;
