----------------------------------------------------------------------------------
-- Company: UMASS Boston
-- Engineer: Nasa Tafari
-- 
-- Create Date: 03/05/2021 02:46:05 PM
-- Design Name: Lab 2
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    generic(N: positive := 16); 
    Port ( A : in std_logic_vector(N-1 downto 0); 
           B : in std_logic_vector(N-1 downto 0);
           Function_Select : in std_logic_vector(2 downto 0);
           overflow : out STD_LOGIC;
           output : out std_logic_vector(N-1 downto 0));
end ALU;

architecture Behavioral of ALU is
component full_adder_Nbit is
    generic(N : positive := 16); 
    Port ( A, B : in std_logic_vector ( N -1 downto 0);
           Cin : in STD_LOGIC;
           S : out std_logic_vector (N-1 downto 0);
           Cout : out STD_LOGIC);
end component;
component full_sub_Nbit is
    generic(N: Positive := 16); 
    Port ( A : in std_logic_vector(N-1 downto 0);
           B : in std_logic_vector(N-1 downto 0);
           BorIn : in STD_LOGIC;
           BorOut : out STD_LOGIC;
           D : out std_logic_vector(N-1 downto 0));
end component;

component output_MUX is
    generic (N: positive := 16); 
    Port ( SEL : in std_logic_vector( 2 downto 0);
           Add : in STD_LOGIC_vector(N-1 downto 0);
           SUB : in STD_LOGIC_vector(N-1 downto 0);
           Twos_comp: in STD_LOGIC_vector(N-1 downto 0);
           AND_F : in STD_LOGIC_vector(N-1 downto 0); 
           OR_F : in STD_LOGIC_vector(N-1 downto 0);
           XOR_F: in STD_LOGIC_vector(N-1 downto 0);
           NOT_F: in STD_LOGIC_vector(N-1 downto 0);
           SL: in STD_LOGIC_vector(N-1 downto 0);
           SR: in STD_LOGIC_vector(N-1 downto 0);
           RL : in STD_LOGIC_vector(N-1 downto 0);
           RR: in STD_LOGIC_vector(N-1 downto 0); 
           output : out STD_LOGIC_vector(N-1 downto 0));
end component;

component overflowMux is
    Port ( A : in STD_LOGIC := '0';
           B : in STD_LOGIC := '0';
           SEL : in STD_LOGIC:='0';
           Z : out STD_LOGIC);
end component;

component Twos_Complement is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (15 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (15 downto 0));
end component;
signal Sum, Diff, Twos,AandB, AorB, notA, AxorB, sllA, srlA, rrA, rlA : std_logic_vector (15 downto 0) := "0000000000000000"; 
signal Z_s, Carry, B_s: std_logic:= '0'; 
begin

Adder: full_adder_nbit generic map (N=>N) port map(
    A =>A, 
    B =>B, 
    S => Sum,
    Cin => '0',
    cout => carry); 
    
SUB: full_sub_nbit generic map (N=>N) port map(
    A =>A, 
    B =>B, 
    D => Diff,
    Borout => B_s,
    BorIn => '0');
    
Twos_C: Twos_Complement port map(
    Diff_input => diff, 
    Twos_Comp_out => Twos);
    
    AandB <= A and B; 
    AorB <= A or B; 
    AxorB <= A xor B;
    notA <= not A; 
    slla <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B))));
    srlA <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B))));
    rlA <= A(N-2 downto 0) & A(N-1); 
    rrA <= A(0) & A(N-1 downto 1);  

outputmux: output_Mux port map(
    SEL => Function_Select, 
    add => sum, 
    sub => Diff, 
    Twos_comp =>Twos, 
    AND_F => AandB, 
    OR_F  => AorB,
    XOR_F => AxorB,
    NOT_F => notA,
    SL => sllA,
    SR => srlA,
    RL => rlA,
    RR => rrA,
    output => output); 
    
 ov_MUx: overflowMux port map(
    A => Carry,
    B => B_s,
    SEL => '1', 
    Z => overflow);
 

end Behavioral;
