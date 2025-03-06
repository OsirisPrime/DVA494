library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Generates an initail reset signal
entity reset_generator is
    port(
        clk     : in std_logic;
        reset_n : out std_logic
    );
end reset_generator;

architecture Arch_reset_generator of reset_generator is
signal reset_internal: std_logic := '1'; -- Internal reset signal 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            reset_internal <= '0';  -- Reset = 0 after first clock edge
        end if;
    end process;
    
    reset_n <= reset_internal;
end;


library ieee;
use ieee.std_logic_1164.all;

-- Generates a stable 1 Hz clock from a 100MHz clock
entity clock_divider is
    port(
         clk        : in std_logic;     -- Input clock (100MHz)
         reset_n    : in std_logic;     -- Reset signal       
         clk_1hz    : out std_logic     -- Output clock (1HZ)
         );
end;

architecture Arch_CD of clock_divider is
    signal counter : integer := 0;                  -- Counter of clock cycles
    signal clk_div : std_logic := '1';              -- Internal divided clock
    constant MAX_COUNT : integer := 100_000_000;    -- 100MHz to 1 Hz division
begin
    process(clk)
    begin
        if falling_edge(clk) then
            if reset_n = '1' then
                counter <= 0;
                clk_div <= '1';
            elsif counter >= (MAX_COUNT/2)-1 then
                counter <= 0;                
                clk_div <= not clk_div;     -- Toggle clock every half cycle
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_1hz <= clk_div;
end;


library ieee;
use ieee.std_logic_1164.all;

-- Counts seconds and minutes
entity seconds_counter is
    port(
         clk        : in std_logic;                 -- Clock input
         reset_n    : in std_logic;                 -- Reset signal
         ss         : out integer range 0 to 59;    -- Seconds output
         mm         : out integer range 0 to 59     -- Minutes output
         );
end;

architecture Arch_SC of seconds_counter is
    component clock_divider is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             clk_1hz    : out std_logic
             );
    end component;
    
    signal clk_1hz : std_logic;
    signal sec : integer range 0 to 59 := 0;    -- Seconds counter
    signal min : integer range 0 to 59 := 0;    -- Minutes counter 
       
begin
    -- Generate a stable 1 Hz clock
    clock_divider_inst : clock_divider port map(clk => clk, reset_n => reset_n, clk_1hz => clk_1hz);
    
    process(clk_1hz, reset_n)
    begin
        if reset_n = '1' then
                sec <= 0;
                min <= 0;
        elsif rising_edge(clk_1hz) then 
            if sec = 59 then
                sec <= 0;
                if min = 59 then
                    min <= 0;
                else
                    min <= min + 1;
                end if;
            else
                sec <= sec + 1;
            end if;
        end if;
    end process;
    ss <= sec;
    mm <= min;
end;


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


library ieee;
use ieee.std_logic_1164.all;

entity Mux4To1 is
    port(
        bcd     : in std_logic_vector(15 downto 0);  
        s0      : in std_logic;     
        s1      : in std_logic;     
        out0    : out std_logic_vector(3 downto 0)    
        );
end;

architecture Arch_mux of Mux4To1 is
    signal sel : std_logic_vector(1 downto 0);  
begin  
    process(sel, bcd)
    begin   
        sel <= s1 & s0;
        case sel is
            when "00" => out0 <= bcd(3 downto 0);   -- Seconds Ones
            when "01" => out0 <= bcd(7 downto 4);   -- Seconds Tens
            when "10" => out0 <= bcd(11 downto 8);  -- Minutes Ones
            when "11" => out0 <= bcd(15 downto 12); -- Minutes Tens
            when others => out0 <= (others => '0');
       end case;
    end process;           
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_2bit is
    port(
         clk        : in std_logic;
         reset_n    : in std_logic;
         B0         : out std_logic;
         B1         : out std_logic
         );
end;

architecture ARCH_C2B of counter_2bit is
    signal clk_counter : integer range 0 to 500000 := 0;    -- 50 MHz clock
    signal counter : std_logic_vector(1 downto 0) := "00"; 
begin
    process(clk, reset_n) is
    begin
        if reset_n = '1' then
            clk_counter <= 0;
            counter <= "00";
        elsif rising_edge(clk) then 
            if clk_counter = 500000 - 1 then 
                clk_counter <= 0;
                counter <= std_logic_vector(unsigned(counter) + 1);
            else
                clk_counter <= clk_counter + 1;
            end if;
        end if;
    end process;
    B0 <= counter(0);
    B1 <= counter(1);
end;


library ieee;
use ieee.std_logic_1164.all;

entity decoder is
    port(
         i0     : in std_logic;
         i1     : in std_logic;
         an     : out std_logic_vector(3 downto 0)
         );
end;

architecture ARCH_DC of decoder is
    signal sel : std_logic_vector(1 downto 0);
begin
    sel <= i1 & i0;
    process(sel) is
    begin
        case (sel) is 
            when "00" => an <= "1110";
            when "01" => an <= "1101";
            when "10" => an <= "1011";
            when "11" => an <= "0111";
            when others => an <= "0000";
        end case;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity Segment_Decoder is
    port(
         bcd : in std_logic_vector(3 downto 0);
         sseg  : out std_logic_vector(7 downto 0)
         );
end;

architecture Arch_SD of Segment_Decoder is
begin
    process(bcd) is
    begin
        case (bcd) is
            when "0000" => sseg <= "00000011"; -- "0"     
            when "0001" => sseg <= "10011111"; -- "1" 
            when "0010" => sseg <= "00100101"; -- "2" 
            when "0011" => sseg <= "00001101"; -- "3" 
            when "0100" => sseg <= "10011001"; -- "4" 
            when "0101" => sseg <= "01001001"; -- "5" 
            when "0110" => sseg <= "01000001"; -- "6" 
            when "0111" => sseg <= "00011111"; -- "7" 
            when "1000" => sseg <= "00000001"; -- "8"     
            when "1001" => sseg <= "00001001"; -- "9" 
            when others => sseg <= "00000000"; -- Default
        end case;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity display_driver is
    port(
         clk        : in std_logic;
         reset_n    : in std_logic;
         bcd        : in std_logic_vector(15 downto 0);
         an         : out std_logic_vector(3 downto 0);
         sseg       : out std_logic_vector(7 downto 0)
         );
end;

architecture Arch_DD of display_driver is
    component Mux4To1 is
        port(
            bcd     : in std_logic_vector(15 downto 0);  
            s0      : in std_logic;     
            s1      : in std_logic;     
            out0    : out std_logic_vector(3 downto 0)    
            );
    end component;
    
    component counter_2bit is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             B0         : out std_logic;
             B1         : out std_logic
             );
    end component;
    
    component decoder is
        port(
             i0     : in std_logic;
             i1     : in std_logic;
             an     : out std_logic_vector(3 downto 0)
             );
    end component;
    
    component Segment_Decoder is
        port(
             bcd : in std_logic_vector(3 downto 0);
             sseg  : out std_logic_vector(7 downto 0)
             );
    end component;
    
    signal B0, B1 : std_logic;
    signal mux_out : std_logic_vector(3 downto 0);

begin
    counter_inst : counter_2bit port map(clk => clk, reset_n => reset_n, B0 => B0, B1 => B1);    
    mux_inst : Mux4To1 port map(bcd => bcd, s0 => B0, s1 => B1, out0 => mux_out);
    decoder_inst : decoder port map(i0 => B0, i1 => B1, an => an);
    seg_decoder_inst : Segment_Decoder port map(bcd => mux_out, sseg => sseg);
end;


-- /////////////////////////////// New /////////////////////////////// --


library ieee;
use ieee.std_logic_1164.all;

-- Top-level integration
entity Timer is 
    port(
         clk    : in std_logic;
         an     : out std_logic_vector(3 downto 0);
         sseg   : out std_logic_vector(7 downto 0)
         );
end;

architecture Arch_Timer of Timer is
    component reset_generator is
        port(
            clk     : in std_logic;
            reset_n : out std_logic
        );
    end component;
    
    component seconds_counter is
        port(
             clk        : in std_logic;    
             reset_n    : in std_logic;    
             ss         : out integer range 0 to 59;
             mm         : out integer range 0 to 59  
             );
    end component;
    
    component BCD_Converter is
        Port ( 
              ss : in integer range 0 to 59;          
              mm : in integer range 0 to 59;
              bcd : out std_logic_vector(15 downto 0)
              );
    end component;
    
    component display_driver is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             bcd        : in std_logic_vector(15 downto 0);
             an         : out std_logic_vector(3 downto 0);
             sseg       : out std_logic_vector(7 downto 0)
             );
    end component;
    
    signal reset_n : std_logic;
    signal ss, mm : integer range 0 to 59;
    signal bcd : std_logic_vector(15 downto 0);
    
begin
    reset_gen_inst : reset_generator port map(clk => clk, reset_n => reset_n);
    secound_counter_inst : seconds_counter port map(clk => clk, reset_n => reset_n, ss => ss, mm => mm);
    BCD_inst : BCD_Converter port map(ss => ss, mm => mm, bcd => bcd);
    display_inst : display_driver port map(clk => clk, reset_n => reset_n, bcd => bcd, an => an, sseg => sseg);
end;
