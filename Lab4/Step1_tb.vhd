library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component puch_led is
        port(
             clk    : in std_logic;
             btnC   : in std_logic;
             led    : out std_logic_vector(15 downto 0)
             );
    end component;
    signal clk, btnC : std_logic := '0';
    signal led : std_logic_vector(15 downto 0);
begin
    led_inst : puch_led port map(clk => clk, btnC => btnC, led => led);
    
    Clock_process : process is
    begin
        clk <= not clk;
        wait for 5ns;
    end process;
    
    process is
    begin
        btnC <= '0';
        wait for 10ms;
        -- wait for reset generator
        
        -- First activity
        btnC <= '1';    wait for 2ms;
        btnC <= '0';    wait for 3ms;
        btnC <= '1';    wait for 1ms;
        btnC <= '0';    wait for 5ms;
        
        -- Second activity
        btnC <= '1';    wait for 1ms;
        btnC <= '0';    wait for 1ms;
        btnC <= '1';    wait for 20ms;
        btnC <= '0';    wait for 2ms;
        btnC <= '1';    wait for 1ms;
        btnC <= '0';    wait for 2ms;
    end process;
end;
