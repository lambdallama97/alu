----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 06:16:05 PM
-- Design Name: 
-- Module Name: cpu - Behavioral
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

entity cpu is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end cpu;

architecture Behavioral of cpu is
component control is
    Port ( clk : in STD_LOGIC; 
    rst: in std_logic; 
    alu_result: in std_logic_vector(15 downto 0);
    dr_ss : out std_logic_vector(15 downto 0);
           mem : out STD_LOGIC;
           alus : in STD_LOGIC;
           is_imm: in std_logic; 
           mem_s: in std_logic; 
           pc_add_imm : out STD_LOGIC;
           jump : in STD_LOGIC;
           bEQ_s, ldstr_s : in STD_LOGIC;
           setlt: in STD_LOGIC; 
           ld, regw, pcupdate : out STD_LOGIC; 
           negative: in std_logic);
end component;

component decode_unit is
    Port ( instruction : in std_logic_vector(15 downto 0);
           mem : out STD_LOGIC;
           alu : out STD_LOGIC;
           aluop: out std_logic_vector(2 downto 0);
           jump : out STD_LOGIC;
           bEQ : out STD_LOGIC;
           alui : out STD_LOGIC;
           ldstr: out STD_LOGIC;
           setlt : out STD_LOGIC;
           regaddress: out std_logic;
           rd : out std_logic_vector(2 downto 0);
           sr1 : out std_logic_vector(2 downto 0);
           immediate : out std_logic_vector(5 DOWNTO 0);
           program_address: out std_logic_vector(6 downto 0); 
           ADDRESS: out std_logic_vector(7 DOWNTO 0);
           sr2 : out std_logic_vector(2 downto 0));
end component;

component PM is
    Port ( address : in std_logic_vector(7 downto 0);
           data : out std_logic_vector(7 downto 0));
end component;

component ALU is
    generic(N: positive := 16); 
    Port ( A : in std_logic_vector(N-1 downto 0); 
           B : in std_logic_vector(N-1 downto 0);
           Function_Select : in std_logic_vector(2 downto 0);
           overflow : out STD_LOGIC;
           output : out std_logic_vector(N-1 downto 0));
end component;

component reg_unit is
    port(CLK: in std_logic;
    RegW: in std_logic;
    DR, SR1, SR2: in std_logic_vector(2 downto 0); 
    Reg_in: in std_logic_vector(15 downto 0); 
    out1, out2: out std_logic_vector(15 downto 0)); 
end component;
component sign_extend is
    Port ( input : in std_logic_vector(5 downto 0);
           output : out std_logic_vector(15 downto 0));
end component;
component src2_mux is
    Port ( reg2 : in std_logic_vector(15 downto 0);
           imm : in std_logic_vector(15 downto 0);
           I : in STD_LOGIC;
           src_2 : out std_logic_vector(15 downto 0));
end component;
component RAM_model is
generic(N: positive:= 8);
port(
clk, rst : in std_logic;
WE : in std_logic; -- Write Enable
A: in std_logic_vector( N-1 downto 0); -- Address
DI: in std_logic_vector(15 downto 0); -- Data In
DO: out std_logic_vector(15 downto 0) -- Data Out
);
end component; 
component pc_mux is
 Port ( pc_p2 : in std_logic_vector(7 downto 0);
           pc_pimm : in std_logic_vector(7 downto 0);
           sel : in STD_LOGIC;
           pc_out : out std_logic_vector(7 downto 0));
end component;
component full_adder_Nbit is
    generic(N : positive := 8); 
    Port ( A, B : in std_logic_vector ( N -1 downto 0);
           Cin : in STD_LOGIC;
           S : out std_logic_vector (N-1 downto 0);
           Cout : out STD_LOGIC);
end component;
component pc_reg is
    port(CLK: in std_logic;
    rst: in std_logic; 
    pc_update: in std_logic;
    Reg_in: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)); 
end component;

component mem_mux is
    Port ( sr1 : in std_logic_vector(7 downto 0);
           sr2 : in std_logic_vector(7 downto 0);
           imm : in std_logic_vector(7 downto 0);
           address : out std_logic_vector(7 downto 0);
           sel, l : in STD_LOGIC);
end component;
component regin_mux is
    Port ( alu : in std_logic_vector(15 downto 0);
           dr_ss : in std_logic_vector(15 downto 0);
           mem : in std_logic_vector(15 downto 0);
           regin : out std_logic_vector(15 downto 0);
           sel: in std_logic; 
           setlt_s : in STD_LOGIC);
end component;
component twos_8bit is
    Port ( Diff_Input : in STD_LOGIC_VECTOR (7 downto 0);
           Twos_Comp_Out : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal alu_result: std_logic_vector(15 downto 0):="0000000000000000"; 
signal pc, pcp1, pcp2_s, pcpi_s, next_pc, upperbyte, lowerbyte,  mem_address, mem_address_s,address_ss, address_sss, address_ssss: std_logic_vector(7 downto 0):="00000000"; 
signal sr1_s, sr2_s, dr_ss, dr_s, reg2out, sign_extended_immediate, regin_s, di_s, do_s, instruction: std_logic_vector(15 downto 0):="0000000000000000"; 
signal imm_s: std_logic_vector( 5 downto 0):="000000"; 
signal aluop_s: std_logic_vector(2 downto 0); 
signal address_s: std_logic_vector(6 downto 0); 
signal negative, is_imm, pc_add_imm, jump_s, BEQ_s, ldstr_s, regaddress, regin_sel: std_logic; 
signal regw_s, mem_s, MemWE_s, setlt_s, alu_s, pc_update_s: std_logic:='0'; 
signal reg1, reg2, regd: std_logic_vector( 2 downto 0); 
begin
        address_ss <= address_s & '0'; -- Address to jump to gets shifted 1bit by appending 0
        pcp1 <= pc or "00000001"; -- Second part of instruction is one address up
        instruction <= lowerbyte & upperbyte; 
        
        
twos: twos_8bit port map(
    diff_input=>address_ss, 
    twos_comp_out=>address_sss); 
    
control_unit: control port map(
    clk =>clk,  
    rst=>rst, 
    alu_result=>alu_result, 
    dr_ss =>dr_ss, 
    mem => MemWE_s, 
    alus => alu_s, 
    is_imm => is_imm, 
    mem_s=>mem_s,  
    pc_add_imm => pc_add_imm, 
    jump =>jump_s, 
    bEQ_s=>beq_s, 
    ldstr_s =>ldstr_s, 
    setlt=>setlt_s,  
    ld=>regin_sel, 
    regw=>regw_s, 
    pcupdate =>pc_update_s, 
    negative=>negative);
    
reg_in_mux: regin_mux port map(
            dr_ss =>dr_ss,
            setlt_s=>setlt_s,  
            alu=>alu_result, 
            mem=>do_s, 
            sel => regin_sel,
            regin=>regin_s); 
memmux: mem_mux port map(
    sr1=>sr1_s(7 downto 0), 
    sr2=>sr2_s(7 downto 0), 
    l=>ldstr_s, 
    imm=>mem_address_s, 
    sel=>regAddress, 
    address=>mem_address); 
        
pcPM: pc_reg port map(
    rst=>rst, 
    clk=>clk, 
    pc_update=>pc_update_s, 
    reg_in=>next_pc, 
    out1=>pc); 
    
pcp2: full_adder_Nbit port map(
    cin=>'0',
    A=>pc, 
    B=>"00000010", 
    S=>pcp2_s); 
pcpi: full_adder_Nbit port map(
    cin=>'0',
    A=>pc, 
    B=>address_sss, 
    S=>pcpi_s); 
pcmux: pc_mux port map (
    pc_p2=>pcp2_s, 
    pc_pimm=>address_ss, 
    sel=>pc_add_imm,  
    pc_out=>next_pc); 
       
s2: src2_mux port map(
    reg2=>reg2out, 
    imm=>sign_extended_immediate, 
    I=>is_imm,
    src_2=>sr2_s); 
    
decode: decode_unit port map(
           instruction => instruction,
           mem => mem_s,
           alu =>alu_s, 
           aluop => aluop_s,
           jump =>jump_s, 
           bEQ => BEQ_s, 
           alui => is_imm, 
           ldstr => ldstr_s, 
           setlt => setlt_s, 
           rd => regd,
           sr1 => reg1, 
           regaddress=>regaddress,
           immediate => imm_s, 
           address=>mem_address_s,
           program_address => address_s, 
           sr2 => reg2); 

pm_upperbyte: pm port map(
    address => pcp1,
    data => upperbyte);
     
pm_lowerbyte: pm port map(
    address => pc, 
    data => lowerbyte); 
    
regs: reg_unit port map(
    reg_in =>regin_s, 
    clk=>clk, 
    Regw=>regw_s, 
    dr=>regd, 
    sr1=>reg1, 
    sr2=>reg2, 
    out1=>sr1_s, 
    out2=>reg2out); 
sign: sign_extend port map(
    input=>imm_s,
    output=>sign_extended_immediate); 
         
alupm: ALU  Port map (  
           A=>sr1_s,  
           B=>sr2_s,
           Function_Select =>aluop_s,
           overflow => negative,           
           output => alu_result);
           
DM: ram_model port map (
        rst=>rst,
        clk=>clk, 
        DI=> sr1_s, 
        DO=> do_s, 
        A=>mem_address, 
        WE=>memWE_s);  


end Behavioral;
