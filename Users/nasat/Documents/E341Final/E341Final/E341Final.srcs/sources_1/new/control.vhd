----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 09:42:49 AM
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
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
end control;



architecture Behavioral of control is


signal state, nextstate: integer range 0 to 3 := 0;
begin
        
    process(clk, rst)
    begin
        if rst = '1' then 
            state <= 0;
        elsif clk'event and clk = '1' then  
            state <= nextstate; 
        end if;  
    end process; 

process(state, rst)
begin 
    if rst = '1' then 
        nextstate <= 1; 
    end if; 
    case state is
        when 0 => nextstate <= state +1; -- fetch  and clear flags
            ld <='0'; 
            
            mem <='0'; 
            pc_add_imm <='0'; 
            pcupdate <='0'; 
        when 1 => nextstate <= state +1; -- decode

            if alus = '1' then 
                regw <= '1'; 
            elsif is_imm = '1' then 
                regw <= '1';
            elsif mem_s = '1' then 
                if ldstr_s = '0' then 
                    ld <= '1';  
                    regw<='1'; 
                else 
                    mem <='1'; 
                end if; 
            elsif jump = '1' then 
                pc_add_imm <='1'; 
            elsif setlt = '1' then 
                dr_ss <= "000000000000000" & negative; 
                regw<='1'; 
            elsif BEQ_s = '1' then 
                if alu_result = "0000000000000000" then 
                    pc_add_imm <='1';  
                end if; 
             end if;     
        when 2 => nextstate <= state +1; -- execute
            regw <= '0';
            if mem_s='1'  then 
                if  ldstr_s = '1' then 
                    mem <='0';  
                 else 
                    ld<='0'; 
                    regw<='0';  
                 end if; 
            end if; 
        when 3 => nextstate <= 0; -- update pc
               regw<='0'; 
            pcupdate <='1'; 
        end case;            
    end process; 
end Behavioral;
