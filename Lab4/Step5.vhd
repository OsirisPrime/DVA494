library ieee;
use ieee.std_logic_1164.all;

entity reset_generator is
    generic(
            Clk_freq    : integer := 100_000_000;
            Delay_time  : integer := 10
            );
    port(
         clk        : in std_logic;
         reset_n    : out std_logic
         );
end;

architecture Arch_RG of reset_generator is
    signal temp : std_logic := '0';
begin
    process(clk) is
        variable count : integer range 0 to Clk_freq*Delay_time/1000;
    begin
        if(clk'event and clk = '1') then
            if(count < Clk_freq*Delay_time/1000) then 
                count := count + 1;
            else
                count := 0;
                temp <= '1';
            end if;
        end if;
    end process;
    reset_n <= temp;
end;


library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
    port(
         clk        : in std_logic;     
         reset_n    : in std_logic;      
         clk_1hz    : out std_logic     
         );
end;

architecture Arch_CD of clock_divider is
    signal counter : integer := 0;
    signal clk_div : std_logic := '1';    
    constant MAX_COUNT : integer := 100_000_000; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '1' then
                counter <= 0;
                clk_div <= '1';
            elsif counter >= (MAX_COUNT/2)-1 then
                counter <= 0;                
                clk_div <= not clk_div;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_1hz <= clk_div;
end;


library ieee;
use ieee.std_logic_1164.all;

entity seconds_counter is
    port(
         clk        : in std_logic;    
         reset_n    : in std_logic;    
         ss         : out integer range 0 to 59;
         mm         : out integer range 0 to 59  
         );
end;

architecture Arch_SC of seconds_counter is
    signal clk_1hz : std_logic;
    signal sec : integer range 0 to 59 := 0;
    signal min : integer range 0 to 59 := 0;
    
    component clock_divider is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             clk_1hz    : out std_logic
             );
    end component;
    
begin
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


library ieee;
use ieee.std_logic_1164.all;

entity Mux4To1Exp is
    port(
        bcd     : in std_logic_vector(15 downto 0);  
        s0      : in std_logic;     
        s1      : in std_logic;     
        out0    : out std_logic_vector(3 downto 0)    
        );
end;

architecture Mux4To1Exp_arch of Mux4To1Exp is
    signal sel : std_logic_vector(1 downto 0);  
begin
    sel(0) <= s0;
    sel(1) <= s1;
    
    process(sel, bcd)
    begin   
        case sel is
            when "00" =>
                out0 <= bcd(3 downto 0);
            when "01" =>
                out0 <= bcd(7 downto 4);
            when "10" =>
                out0 <= bcd(11 downto 8);
            when "11" =>
                out0 <= bcd(15 downto 12);
            when others =>
                out0 <= "0000";
       end case;
    end process;           
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_counter is
    port(
         clk        : in std_logic;
         reset_n    : in std_logic;
         B0         : out std_logic;
         B1         : out std_logic
         );
end;

architecture ARCH_BC of bit_counter is
    signal count : unsigned(1 downto 0) := "00"; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                count <= "00"; 
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    
    B0 <= count(0);
    B1 <= count(1);
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
    signal input : std_logic_vector(1 downto 0);
begin
    input(0) <= i0;
    input(1) <= i1;
    
    process(input) is
    begin
        case (input) is  -- Concatenate i0 and i1 to form a 2-bit input
            when "00" =>
                an <= "0001";
            when "01" =>
                an <= "0010";
            when "10" =>
                an <= "0100";
            when "11" =>
                an <= "1000";
            when others =>
                an <= "0000";
        end case;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity Seg_Decoder is
    port(
         input : in std_logic_vector(3 downto 0);
         sseg  : out std_logic_vector(6 downto 0)
         );
end;

architecture Arch_SD of Seg_Decoder is
begin
    with input select
        sseg <= "0000001" when "0000",  -- 0
                "1001111" when "0001",  -- 1
                "0010010" when "0010",  -- 2
                "0000110" when "0011",  -- 3
                "1001100" when "0100",  -- 4
                "0100100" when "0101",  -- 5
                "0100000" when "0110",  -- 6
                "0001111" when "0111",  -- 7
                "0000000" when "1000",  -- 8
                "0000100" when "1001",  -- 9
                "0001000" when "1010",  -- A
                "1100000" when "1011",  -- B
                "0110001" when "1100",  -- C
                "1000010" when "1101",  -- D
                "0110001" when "1110",  -- E
                "0111000" when "1111",  -- F
                "1111111" when others;  -- turn off all LEDs
end;


library ieee;
use ieee.std_logic_1164.all;

entity display_driver is
    port(
         clk        : in std_logic;
         reset_n    : in std_logic;
         bcd        : in std_logic_vector(15 downto 0);
         an         : out std_logic_vector(3 downto 0);
         sseg       : out std_logic_vector(6 downto 0)
         );
end;

architecture Arch_DD of display_driver is
    component Mux4To1Exp is
        port(
            bcd     : in std_logic_vector(15 downto 0);  
            s0      : in std_logic;     
            s1      : in std_logic;     
            out0    : out std_logic_vector(3 downto 0)    
            );
    end component;
    
    component bit_counter is
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
    
    component Seg_Decoder is
        port(
             input : in std_logic_vector(3 downto 0);
             sseg  : out std_logic_vector(6 downto 0)
             );
    end component;
    signal B0, B1 : std_logic;
    signal mux_out : std_logic_vector(3 downto 0);
begin
    bit_counter_inst : bit_counter port map(clk => clk, reset_n => reset_n, B0 => B0, B1 => B1);    
    mux_inst : Mux4To1Exp port map(bcd => bcd, s0 => B0, s1 => B1, out0 => mux_out);
    decoder_inst : decoder port map(i0 => B0, i1 => B1, an => an);
    seg_decoder_inst : Seg_Decoder port map(input => mux_out, sseg => sseg);
end;

-- /////////////////////////////// New /////////////////////////////// --

library ieee;
use ieee.std_logic_1164.all;

entity Timer is 
    port(
         clk    : in std_logic;
         an     : out std_logic_vector(3 downto 0);
         sseg   : out std_logic_vector(6 downto 0)
         );
end;

architecture Arch_Timer of Timer is
    component reset_generator is
        generic(
                Clk_freq    : integer := 100_000_000;
                Delay_time  : integer := 10
                );
        port(
             clk        : in std_logic;
             reset_n    : out std_logic
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
              seconds : in integer range 0 to 59;          
              minutes : in integer range 0 to 59;
              bcd : out std_logic_vector(15 downto 0)
              );
    end component;
    
    component display_driver is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             bcd        : in std_logic_vector(15 downto 0);
             an         : out std_logic_vector(3 downto 0);
             sseg       : out std_logic_vector(6 downto 0)
             );
    end component;
    signal reset_n : std_logic;
    signal ss, mm : integer range 0 to 59;
    signal bcd : std_logic_vector(15 downto 0);
begin
    reset_gen_inst : reset_generator port map(clk => clk, reset_n => reset_n);
    secound_counter_inst : seconds_counter port map(clk => clk, reset_n => reset_n, ss => ss, mm => mm);
    BCD_inst : BCD_Converter port map(seconds => ss, minutes => mm, bcd => bcd);
    display_inst : display_driver port map(clk => clk, reset_n => reset_n, bcd => bcd, an => an, sseg => sseg);
end;
