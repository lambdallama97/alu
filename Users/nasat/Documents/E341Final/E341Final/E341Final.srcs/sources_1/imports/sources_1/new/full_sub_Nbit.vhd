----------------------------------------------------------------------------------
-- Company: UMASS Boston
-- Engineer: Nasa Tafari
-- 
-- Create Date: 03/05/2021 01:07:30 PM
-- Design Name: 
-- Module Name: full_sub_Nbit - Behavioral
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

entity full_sub_Nbit is
    generic(N: Positive := 4); 
    Port ( A : in std_logic_vector(N-1 downto 0);
           B : in std_logic_vector(N-1 downto 0);
           BorIn : in STD_LOGIC;
           BorOut : out STD_LOGIC;
           D : out std_logic_vector(N-1 downto 0));
end full_sub_Nbit;

architecture Generated of full_sub_Nbit is
component Full_Sub is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           BorIn : in STD_LOGIC;
           BorOut : out STD_LOGIC;
           D : out STD_LOGIC);
end component;
signal CC: std_logic_vector(N downto 0); 
begin
    CC(0) <= BorIn; 
    Full_Subs: for i in 0 to N-1 generate
        FSx: Full_Sub port map (A=>A(i), B=>B(i), BorIn=>CC(i), Borout=>CC(i+1), D=>D(i)); 
    end generate; 
    Borout <= CC(N); 

end Generated;
