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
            when "01" => out0 <= bcd(11 downto 8);  -- Minutes Ones  
            when "10" => out0 <= bcd(7 downto 4);   -- Seconds Tens
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
    sel <= i0 & i1;
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


-- ////////////////////////////////////////// tb ////////////////////////////////////////// --


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component display_driver is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             bcd        : in std_logic_vector(15 downto 0);
             an         : out std_logic_vector(3 downto 0);
             sseg       : out std_logic_vector(6 downto 0)
             );
    end component;
    signal clk, reset_n : std_logic := '0';
    signal bcd : std_logic_vector(15 downto 0);
    signal an : std_logic_vector(3 downto 0);
    signal sseg : std_logic_vector(6 downto 0);
begin
    DD_inst : display_driver port map(clk => clk, reset_n => reset_n, bcd => bcd, an => an, sseg => sseg);
    
    process is
    begin   
        clk <= '0';
        wait for 5ns;
        clk <= '1';
        wait for 5ns;
    end process;
    
    process is
    begin
        bcd <= "0000000000000000";
        wait for 20 ns;
        
        bcd <= "0010001000100011";
        wait for 20 ns;
        
        bcd <= "0000100000000110";
        wait for 20 ns;
        
        bcd <= "0001000100001100";
        wait for 20 ns;
        
        bcd <= "0010000100001000";
        wait for 20 ns;
        
        bcd <= "0000011000010000";
        wait for 20 ns;
        
        bcd <= "1100000000100000";
        wait for 20 ns;
        
        bcd <= "1001000001000100";
        wait for 20 ns;
    end process;
end;
