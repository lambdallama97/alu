----------------------------------------------------------------------------------
-- Company: Umass Boston
-- Engineer: Nasa Tafari
-- 
-- Create Date: 02/10/2021 05:46:44 PM
-- Design Name: 
-- Module Name: full_adder - mixed
-- Project Name: ENGIN 341: Lab 1
-- Target Devices: 
-- Tool Versions: 
-- Description: Full Adder using Modular Design
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

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture mixed of full_adder is

component half_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end component;

signal s1, c1, c2: std_logic; 

begin

    ha1: half_adder port map (
        a => a, 
        b => b, 
        sum => s1, 
        carry => c1); 

    ha2: half_adder port map (
        a => carry_in, 
        b => s1, 
        sum => sum, 
        carry => c2); 
        
    or_gate: carry_out <= c1 or c2; 
    
end mixed;
