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

entity btn_debouncer is
    generic(
            Clk_freq    : integer := 100_000_000;
            Stable_time : integer := 10
            );
    port(
        btnC    : in std_logic;
        clk     : in std_logic;
        reset_n : in std_logic;
        result  : out std_logic
         );
end;

architecture Arch_BD of btn_debouncer is
    signal flipflops    : std_logic_vector(1 downto 0);
    signal counter_set  : std_logic;
begin
    counter_set <= flipflops(0) xor flipflops(1);
    
    process(clk, reset_n) is
        variable count : integer range 0 to Clk_freq*Stable_time/1000;
    begin
        if(reset_n = '0') then 
            flipflops(1 downto 0) <= "00";
            result <= '0';
        elsif (clk'event and clk = '1') then
            flipflops(0) <= btnC;
            flipflops(1) <= flipflops(0);
            if(counter_set = '1') then
                count := 0;
            elsif(count < Clk_freq*Stable_time/1000) then 
                count := count + 1;
            else
                result <= flipflops(1);
            end if;
        end if;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity toggle_process is
    port(
         result : in std_logic;
         clk    : in std_logic;
         led    : out std_logic_vector(15 downto 0)
         );
end;

architecture Arch_TP of toggle_process is
    signal prev_result, led_state : std_logic := '0';
begin
    process(clk) is
    begin
        if(clk'event and clk = '1') then 
            if(result = '1') and (prev_result = '0') then
                led_state <= not led_state;
            end if;
            prev_result <= result;
        end if;
    end process;
    led <= (others => led_state);
end;


library ieee;
use ieee.std_logic_1164.all;

entity puch_led is
    port(
         clk    : in std_logic;
         btnC   : in std_logic;
         led    : out std_logic_vector(15 downto 0)
         );
end;

architecture Arch_PL of puch_led is
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
    
    component btn_debouncer is
        generic(
                Clk_freq    : integer := 100_000_000;
                Stable_time : integer := 10
                );
        port(
            btnC    : in std_logic;
            clk     : in std_logic;
            reset_n : in std_logic;
            result  : out std_logic
             );
    end component;
    
    component toggle_process is
    port(
         result : in std_logic;
         clk    : in std_logic;
         led    : out std_logic_vector(15 downto 0)
         );
    end component;
    
    signal reset_n, result : std_logic;
begin
    reset_gen_inst : reset_generator port map(clk => clk, reset_n => reset_n);
    debouncer_inst : btn_debouncer port map(btnC => btnC, clk => clk, reset_n => reset_n, result => result);
    toggle_inst : toggle_process port map(result => result, clk => clk, led => led);
end;
