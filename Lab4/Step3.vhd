library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_Converter is
    Port ( 
          seconds : in integer range 0 to 59;          
          minutes : in integer range 0 to 59;
          bcd : out std_logic_vector(15 downto 0)
          );
end bcd_converter;

architecture Arch_BCD of BCD_Converter is
begin
    process (minutes, seconds)
    begin
        -- Convert minutes to BCD
        bcd(15 downto 12) <= std_logic_vector(to_unsigned(minutes / 10, 4));    -- tens place of minutes
        bcd(11 downto 8)  <= std_logic_vector(to_unsigned(minutes mod 10, 4));  -- Ones place of minutes
        
        -- Convert seconds to BCD
        bcd(7 downto 4)   <= std_logic_vector(to_unsigned(seconds / 10, 4));    -- tens place of seconds
        bcd(3 downto 0)   <= std_logic_vector(to_unsigned(seconds mod 10, 4));  -- Ones place of seconds
    end process;
end;

-- //////////////////////////////////////////////// tb //////////////////////////////////////////////// --

library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture ARCH_tb of tb is
    component BCD_Converter is
        Port ( 
              seconds : in integer range 0 to 59;        
              minutes : in integer range 0 to 59;
              bcd : out std_logic_vector(15 downto 0)
              );
    end component;
    signal seconds, minutes : integer range 0 to 59;
    signal bcd : std_logic_vector(15 downto 0);
begin
    BCD_inst : BCD_Converter port map(seconds => seconds, minutes => minutes, bcd => bcd);
    
    process is
    begin
        seconds <= 0;
        minutes <= 0;
        wait for 5 ns;
        
        seconds <= 30;
        minutes <= 11;
        wait for 5 ns;
        
        seconds <= 55;
        minutes <= 2;
        wait for 5 ns;
        
        seconds <= 1;
        minutes <= 37;
        wait for 5 ns;
        
        seconds <= 59;
        minutes <= 59;
        wait for 5 ns;
    end process;
end;
