----------------------------------------------------------------------------------
-- Company: UMASS Boston
-- Engineer: Nasa Tafari 
-- Module Name: output_MUX - Behavioral
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

entity output_MUX is
    generic (N: positive := 16); 
    Port ( SEL : in std_logic_vector(2 downto 0);
           Add : in STD_LOGIC_vector(15 downto 0);
           SUB : in STD_LOGIC_vector(N-1 downto 0);
           Twos_comp: in STD_LOGIC_vector(15 downto 0);
           AND_F : in STD_LOGIC_vector(15 downto 0); 
           OR_F : in STD_LOGIC_vector(15 downto 0);
           XOR_F: in STD_LOGIC_vector(N-1 downto 0);
           NOT_F: in STD_LOGIC_vector(N-1 downto 0);
           SL: in STD_LOGIC_vector(15 downto 0);
           SR: in STD_LOGIC_vector(15 downto 0);
           RL : in STD_LOGIC_vector(N-1 downto 0);
           RR: in STD_LOGIC_vector(N-1 downto 0); 
           output : out STD_LOGIC_vector(N-1 downto 0));
end output_MUX;

architecture Dataflow of output_MUX is
begin
with SEL select
output <= 
    add when "000",
    SUB when "001",
    AND_F when "010",
    OR_F  when "011",
    SL when "100",
    SR when "101",
     "UUUUUUUUUUUUUUUU" when others; 
end Dataflow;
