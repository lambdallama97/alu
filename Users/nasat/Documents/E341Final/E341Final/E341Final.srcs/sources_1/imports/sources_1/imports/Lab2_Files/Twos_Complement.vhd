library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Twos_Complement is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (15 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (15 downto 0));
end Twos_Complement;

architecture Dataflow of Twos_Complement is

begin

    Twos_Comp_Out(0) <= Diff_Input(0);
    Twos_Comp_Out(1) <= Diff_Input(1) XOR Diff_Input(0);
    Twos_Comp_Out(2) <= Diff_Input(2) XOR (Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(3) <= Diff_Input(3) XOR (Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(4) <= Diff_Input(4) XOR (Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(5) <= Diff_Input(5) XOR (Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));  
    Twos_Comp_Out(6) <= Diff_Input(5) XOR (diff_input(5) or Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(7) <= Diff_Input(7) XOR (Diff_Input(6) OR diff_input(5) or Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(8) <= Diff_Input(8) XOR (Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(9) <= Diff_Input(9) XOR (Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(10) <= Diff_Input(10) XOR (Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0)); 
    Twos_Comp_Out(11) <= Diff_Input(11) XOR (Diff_Input(10) OR Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(12) <= Diff_Input(12) XOR (Diff_Input(11) OR Diff_Input(10) OR Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(13) <= Diff_Input(13) XOR (Diff_Input(12) OR Diff_Input(11) OR Diff_Input(10) OR Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(14) <= Diff_Input(14) XOR (Diff_Input(13) OR Diff_Input(12) OR Diff_Input(11) OR Diff_Input(10) OR Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    Twos_Comp_Out(15) <= Diff_Input(15) XOR (Diff_Input(14) OR Diff_Input(13) OR Diff_Input(12) OR Diff_Input(11) OR Diff_Input(10) OR Diff_Input(9) OR Diff_Input(8) OR Diff_Input(7) OR Diff_Input(6) OR diff_input(5) or Diff_input(4) 
                        or Diff_Input(3) or Diff_Input(2) OR Diff_Input(1) OR Diff_Input(0));
    
    
end Dataflow;
