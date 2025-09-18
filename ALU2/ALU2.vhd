LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is -- ALU unit includes Reg. 3
    port (
        clk, res : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
        R1 : out std_logic_vector(3 downto 0);
		  R2 : out std_logic_vector(3 downto 0);
		  Sign2 : OUT STD_LOGIC;
		  Sign1 : OUT STD_LOGIC
    );
end ALU2;

architecture calculation of ALU2 is
	SIGNAL Result : STD_LOGIC_VECTOR(7 downto 0);
begin
    process (clk, res)
    begin
        if res = '1' then
            Result <= "00000000";
        elsif (clk'EVENT AND clk = '1') then
            case opcode is
					 when "0000000000000010" =>
					 Result<= reg1+2;
                    -- Increase reg1 by 2
                when "0000000000000100" =>
					 Result(7)<='0';
					 Result(6)<='0';
					 Result(5 downto 0)<= reg2(5 downto 0);
                   --shift to right by two and replace the most sig bits by 0
                
					 when "0000000000001000" =>
					 Result(7)<='1';
					 Result(6)<='1';
					 Result(5)<='1';
					 Result(4)<='1';
					 Result(3 downto 0)<= reg1(3 downto 0);
                   --shift to right by two and replace the most sig bits by 0
                
					 when "0000000000010000" =>
                    
						  -- Min between a and b 
							if reg1 < reg2 then
							Result <= reg1;
							else
							Result <= reg2;
							end if;
							
					when "0000000000100000" =>
					    	-- rotate bits of a by 2
                Result(7)<=reg1(1);
					 Result(6)<=reg1(0);
					 Result(5)<=reg1(5);
					 Result(4)<=reg1(4);
					 Result(3)<=reg1(3);
					 Result(2)<=reg1(2);
					 Result(1)<=reg1(7);
					 Result(0)<=reg1(6);
					when "0000000001000000" =>
						  -- Invert bit order for reg2
                Result(7)<=reg2(0);
					 Result(6)<=reg2(1);
					 Result(5)<=reg2(2);
					 Result(4)<=reg2(3);
					 Result(3)<=reg2(4);
					 Result(2)<=reg2(5);
					 Result(1)<=reg2(6);
					 Result(0)<=reg2(7);
               
					when "0000000010000000" =>
					 Result<=(reg1 xor reg2);
                    -- Do Boolean XOR
               
					when "0000000100000000" => 
					 Result<= (reg1 + reg2)-4;
                    -- Produce the summation of reg1 and reg2, then decrease it by 4
                when others =>
					 Result <="--------"; 
                    -- Don't care, do nothing
            end case;
        end if;

    end process;
	 				R1<= Result(3 downto 0);
				R2<=Result(7 downto 4);
				Sign2<=Result(7);
				Sign1<=Result(3);
end calculation;
