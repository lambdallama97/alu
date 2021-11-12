----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 02:22:32 PM
-- Design Name: 
-- Module Name: reg_unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_unit is
    port(CLK: in std_logic;
    RegW: in std_logic;
    DR, SR1, SR2: in std_logic_vector(2 downto 0); 
    Reg_in: in std_logic_vector(15 downto 0); 
    out1, out2: out std_logic_vector(15 downto 0)); 
end reg_unit;

architecture Behavioral of reg_unit is
    type RAM is array(0 to 7) of std_logic_vector (15 downto 0);
    signal REGs: RAM := (others =>(others => '0')); 
begin
    process(CLK)
    begin 
        if CLK = '1' and CLK'event then 
            if regw = '1' then 
                regs(TO_INTEGER(unsigned(DR))) <= reg_in; 
            end if; 
        end if; 
    end process; 
    out1 <= regs(TO_INTEGER(unsigned(sR1))); 
    out2 <= regs(TO_INTEGER(unsigned(sR2))); 
end Behavioral;
