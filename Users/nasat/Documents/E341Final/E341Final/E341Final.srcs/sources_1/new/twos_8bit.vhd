library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twos_8bit is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (7 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (7 downto 0));
end Twos_8bit;

architecture Dataflow of Twos_8bit is

begin

    Twos_Comp_Out(0) <= Diff_Input(0);
    Twos_Comp_Out(1) <= Diff_Input(1) XOR Diff_Input(0);
    Twos_Comp_Out(2) <= Diff_Input(2) XOR (Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(3) <= Diff_Input(3) XOR (Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(4) <= Diff_Input(4) XOR (Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(5) <= Diff_Input(5) XOR (Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));  
    Twos_Comp_Out(6) <= Diff_Input(5) XOR (diff_input(5) or Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(7) <= Diff_Input(7) XOR (Diff_Input(6) OR diff_input(5) or Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    
    
end Dataflow;
