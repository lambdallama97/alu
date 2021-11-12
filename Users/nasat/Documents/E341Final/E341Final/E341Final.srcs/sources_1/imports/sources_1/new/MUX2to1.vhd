----------------------------------------------------------------------------------
-- Company: UMASS Boston
-- Engineer: Nasa Tafari 
-- 
-- Create Date: 03/05/2021 02:07:24 PM
-- Design Name: 
-- Module Name: MUX2to1 - Behavioral
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

entity overflowMux is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           Z : out STD_LOGIC);
end overflowMUX;

architecture Dataflow of overflowMUX is
begin
    with SEL select Z <=
        A when '0',
        B when '1',
        '-' when others;     
end Dataflow;
