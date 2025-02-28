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
        if rising_edge(clk) then
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


-- ///////////////////////////////////////// tb /////////////////////////////////////////


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    signal clk : std_logic := '0';
    signal reset_n : std_logic := '0'; 
    signal ss : integer range 0 to 59; 
    signal mm : integer range 0 to 59;
    
    component seconds_counter is
        port(
             clk        : in std_logic;
             reset_n    : in std_logic;
             ss         : out integer range 0 to 59;
             mm         : out integer range 0 to 59
             );
    end component; 
begin
    SC_inst : seconds_counter port map(clk => clk, reset_n => reset_n, ss => ss, mm => mm);
    
    process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    process
    begin
        wait for 3 sec; 
        reset_n <= '1';  
        wait for 0.5 sec;        
        reset_n <= '0';    
        wait for 1 sec;     
    end process;
end;
