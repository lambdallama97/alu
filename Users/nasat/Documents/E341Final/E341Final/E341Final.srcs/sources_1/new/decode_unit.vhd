----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2021 12:17:47 PM
-- Design Name: 
-- Module Name: decode_unit - Behavioral
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

entity decode_unit is
    Port ( instruction : in std_logic_vector(15 downto 0);
           mem : out STD_LOGIC;
           alu : out STD_LOGIC;
           aluop: out std_logic_vector(2 downto 0);
           jump : out STD_LOGIC;
           bEQ : out STD_LOGIC;
           alui : out STD_LOGIC;
           ldstr : out STD_LOGIC;
           setlt : out STD_LOGIC;
           regaddress: out std_logic; 
           rd : out std_logic_vector(2 downto 0);
           sr1 : out std_logic_vector(2 downto 0);
           immediate : out std_logic_vector(5 DOWNTO 0);
           program_address: out std_logic_vector(6 downto 0); 
           ADDRESS: out std_logic_vector(7 DOWNTO 0);
           sr2 : out std_logic_vector(2 downto 0));
end decode_unit;

architecture Behavioral of decode_unit is
signal op: std_logic_vector(2 downto 0); 
signal instruction_s :std_logic_vector(15 downto 0);
begin  
process(instruction)
begin
    case instruction(15 downto 13) is
        when "000" =>   
            ALU <= '1'; 
                ALUOP <= INSTRUCTION(12 DOWNTO 10); 
                RD <= INSTRUCTION(9 DOWNTO 7); 
                sr1 <= INSTRUCTION(6 DOWNTO 4);
                sr2 <= INSTRUCTION(3 DOWNTO 1);
        ALUI <= '0'; 
        JUMP <='0'; 
        BEQ <='0'; 
        SETLT <='0'; 
        mem<='0'; 
        when "001" =>   
            ALU <= '1'; 
            ALUI<='1'; 
                if INSTRUCTION(12) = '0' then 
                    aluop <= "000"; 
                else 
                    aluop <="010"; 
                end if;  
                RD <= INSTRUCTION(11 DOWNTO 9); 
                sr1 <= INSTRUCTION(8 DOWNTO 6);
                IMMEDIATE <= INSTRUCTION(5 DOWNTO 0); 
        JUMP <='0'; 
        BEQ <='0'; 
        SETLT <='0'; 
        mem<='0'; 
        when "010" =>   
            MEM <= '1'; 
                ldstr <= INSTRUCTION(12); 
                if INSTRUCTION(12) = '1' then 
                    
                    sr1 <= INSTRUCTION(11 DOWNTO 9); 
                    sr2 <= INSTRUCTION(7 DOWNTO 5);
                else 
                    rd <= INSTRUCTION(11 DOWNTO 9);
                    sr2 <= INSTRUCTION(7 DOWNTO 5);
                end if; 
                 
                ADDRESS <= INSTRUCTION(8 DOWNTO 1);
                regAddress <=INSTRUCTION(0); 
        ALU <= '0'; 
        JUMP <='0'; 
        BEQ <='0'; 
        SETLT <='0';
        ALUI <= '0'; 
        when "011" =>   
            JUMP <= '1'; 
                program_address <= INSTRUCTION(12 DOWNTO 6);
        ALU <= '0'; 
        BEQ <='0'; 
        SETLT <='0';
        mem<='0'; 
        ALUI <= '0'; 
        when "100" =>   
            SETLT <= '1'; 
                RD <=  INSTRUCTION(12 DOWNTO 10); 
                sr1 <= INSTRUCTION(9 DOWNTO 7);
                sr2 <= INSTRUCTION(6 DOWNTO 4);
                aluop <="001"; 
        ALU <= '0'; 
        BEQ <='0'; 
        mem<='0'; 
        jump<='0'; 
        ALUI <= '0'; 
        when "101" =>   
            BEQ <= '1'; 
 
                sr1 <= INSTRUCTION(12 DOWNTO 10);
                sr2 <= INSTRUCTION(9 DOWNTO 7);  
                aluop<="001"; 
                program_address <= INSTRUCTION(6 DOWNTO 0); 
        ALU <= '0'; 
        SETLT <='0';
        mem<='0'; 
        jump<='0'; 
        ALUI <= '0'; 
        when "111" => op<="000";    -- no op
        ALU <= '0'; 
        SETLT <='0';
        mem<='0'; 
        jump<='0'; 
        ALUI <= '0'; 
        BEQ <= '0'; 
        when others => ALU <= '0';
end case;


end process; 
end Behavioral;
