----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 10:03:03 AM
-- Design Name: 
-- Module Name: PM - Behavioral
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

entity PM is
    Port ( address : in std_logic_vector(7 downto 0);
           data : out std_logic_vector(7 downto 0));
end PM;

architecture Behavioral of PM is
    type ROM is array (0 to 255) of std_logic_vector(7 downto 0);
     --          Put program in here
    signal ROM1 : ROM:= (                    
		
		0   => "001" & '0' & "000" & '0',                          
		1   => "01" & "000111",                 --addi r0, r1, 000111
        2   => "010" & '1' & "000" & '0',                            
		3   => "0000000" & '0',                 --str r0, 00000000

		4   => "001" & '0' & "000" & '0',                           
		5   => "01" & "001000",                 --addi r0, r1, 001000
        6   => "010" & '1' & "000" & '0',                           
		7   => "0000001" & '0',                 --str r0, 00000001

        8   => "010" & '0' & "001" & '0',                           
		9   => "0000000" & '0',                 --ldr r1, 00000000
        10  => "010" & '0' & "010" & '0',                           
		11  => "0000001" & '0',                 --ldr r2, 00000000
		12  => "000" & "000" & "00", 
		13  => '0' & "001" & "010" & '0',        --add r0, r1, r2
        14  => "010" & '1' & "000" & '0',                           
		15  => "0000010" & '0',                --str r0, 00000010

		16  => "000" & "011" & "00", 
		17  => '0' & "001" & "010" & '0',        --or r0, r1, r2
        18  => "010" & '1' & "000" & '0',                           
		19  => "0000011" & '0',                --str r0, 00000011

		20  => "000" & "010" & "00", 
		21  => '0' & "001" & "010" & '0',         --and r0, r1, r2
        22  => "010" & '1' & "000" & '0',                           
		23  => "0000100" & '0',                 --str r0, 000001000

        24  => "010" & '0' & "001" & '0',                           
		25  => "0000011" & '0',                 --ldr r1, 00000011
        26  => "010" & '0' & "010" & '0',                           
		27  => "0000100" & '0',                 --ldr r2, 00000100
		28  => "000" & "001" & "00", 
		29  => '0' & "001" & "010" & '0',        --sub r0, r1, r2
        30  => "010" & '1' & "000" & '0',                           
		31  => "0000101" & '0',                 --str r0, 00000100
		
		
		-- Program Two
		32   => "001" & '1' & "100" & '1',                          
		33   => "00" & "000000",                 --andi r4, r4, 000000
		
		34   => "001" & '0' & "011" & '1',                          
		35   => "00" & "001111",                 --addi r3, r4, 001111
		
		36   => "001" & '0' & "110" & '1',                          
		37   => "00" & "000001",                 --addi r6, r4, 000001
		
		38   => "001" & '0' & "000" & '1',                          
		39   => "00" & "000000",                 --addi r0, r4, 000000
		
		40   => "001" & '0' & "001" & '1',                          
		41   => "00" & "000001",                 --addi r1, r4, 000001
		
		42   => "001" & '0' & "100" & '1',                          
		43   => "00" & "000110",                 --addi r4, r4, 0000110
		
		44  => "010" & '1' & "000" & '0',                           
		45  => "100" & "0100" & '1',                 --strr r0, r4
		
		46   => "001" & '0' & "100" & '1',                          
		47   => "00" & "000001",                 --addi r4, r4, 000001
		
		48  => "010" & '1' & "001" & '0',                           
		49  => "100" & "0100" & '1',                 --strr r1, r4
		
		
		50 => "101" & "100" & "01",
		51 => '1' & "0100001",                     --beq r4, r3, halt (replace halt with pm address) address 66 for now
		
		52  => "010" & '0' & "000" & '1',                           
		53  => "10" & "00000" & '1',                 --ldrr r0, r4
		
		54  => "000" & "001" & "10", 
		55  => '0' & "100" & "110" & '0',        --sub r4, r4, r6
		
		56  => "010" & '0' & "001" & '1',                           
		57  => "00" & "00000" & '1',                 --ldrr r1, r4
		
		58  => "000" & "000" & "01", 
		59  => '0' & "000" & "001" & '0',        --add r2, r0, r1
		
		60   => "001" & '0' & "100" & '1',                          
		61   => "00" & "000010",                 --addi r4, r4, 000010
		
		62  => "010" & '1' & "010" & '0',                           
		63  => "100" & "0100" & '1',                 --strr r2, r4
		
		64 => "011" & "00110", 
		65 => "01" &  "000000",              --jmp to line 50
		
        others => (others =>'1')           --halt/no op
               
	);
begin

    data
     <= ROM1(to_integer(unsigned(Address)));

end Behavioral;
