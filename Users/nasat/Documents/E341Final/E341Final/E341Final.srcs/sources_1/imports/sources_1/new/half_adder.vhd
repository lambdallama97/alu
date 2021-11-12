----------------------------------------------------------------------------------
-- Company: Umass Boston
-- Engineer: Nasa Tafari
-- 
-- Create Date: 02/10/2021 05:46:44 PM
-- Design Name: 
-- Module Name: half_adder - dataflow
-- Project Name: ENGIN 341: Lab 1
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple 1-bit half-adder module
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

entity half_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end half_adder;

architecture dataflow of half_adder is

begin
    sum <= a XOR b; 
    carry <= a AND b;

end dataflow;
