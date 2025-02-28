library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Converts seconds and minutes to BCD
entity BCD_Converter is
    Port ( 
          ss : in integer range 0 to 59;            -- Seconds input          
          mm : in integer range 0 to 59;            -- Minutes input
          bcd : out std_logic_vector(15 downto 0)   -- BCD output
          );
end;

architecture Arch_BCD of BCD_Converter is
begin
    process(ss, mm) is
    begin
        bcd(3 downto 0)   <= std_logic_vector(to_unsigned(ss mod 10, 4));  -- Seconds Ones digit   
        bcd(7 downto 4)   <= std_logic_vector(to_unsigned(ss/10, 4));      -- Seconds Tens digit
        bcd(11 downto 8)  <= std_logic_vector(to_unsigned(mm mod 10, 4));  -- Minutes Ones digit       
        bcd(15 downto 12) <= std_logic_vector(to_unsigned(mm/10, 4));      -- Minutes Tens digit
    end process;
end;


-- //////////////////////////////////////////////// tb //////////////////////////////////////////////// --


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture ARCH_tb of tb is
    component BCD_Converter is
        Port ( 
              ss : in integer range 0 to 59;        
              mm : in integer range 0 to 59;
              bcd : out std_logic_vector(15 downto 0)
              );
    end component;
    signal ss, mm : integer range 0 to 59;
    signal bcd : std_logic_vector(15 downto 0);
begin
    BCD_inst : BCD_Converter port map(ss => ss, mm => mm, bcd => bcd);
    
    process is
    begin
        ss <= 0;
        mm <= 0;
        wait for 5 ns;
        
        ss <= 45;
        mm <= 23;
        wait for 5 ns;
        
        ss <= 55;
        mm <= 2;
        wait for 5 ns;
        
        ss <= 1;
        mm <= 37;
        wait for 5 ns;
        
        ss <= 59;
        mm <= 59;
        wait for 5 ns;
    end process;
end;
