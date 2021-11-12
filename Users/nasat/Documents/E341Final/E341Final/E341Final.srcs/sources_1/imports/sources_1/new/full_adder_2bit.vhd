----------------------------------------------------------------------------------
-- Company: UMASS Boston
-- Engineer: Nasa Tafari
-- 
-- Create Date: 03/05/2021 12:03:06 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity full_adder_Nbit is
    generic(N : positive := 16); 
    Port ( A, B : in std_logic_vector ( N -1 downto 0);
           Cin : in STD_LOGIC;
           S : out std_logic_vector (N-1 downto 0);
           Cout : out STD_LOGIC);
end full_adder_Nbit;

architecture Generated of full_adder_Nbit is
component full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;
signal Cc : std_logic_vector(N downto 0); 

begin
    Cc(0) <= Cin; 
    
    Full_Adders: for i in 0 to n-1 generate
                    FAx: Full_Adder port map (A(i), B(i), Cc(i), S(i), CC(i+1)); 
                 end generate;
                  
    Cout <= Cc(N);

end Generated;
