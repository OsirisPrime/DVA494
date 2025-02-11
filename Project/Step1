library ieee;
use ieee.std_logic_1164.all;

entity Counter is
    port( clk           : in std_logic;
          reset         : in std_logic;
          en            : in std_logic;
          counter_out   : out integer
        );
end;

architecture Arch_Counter of Counter is
    signal counter : integer := 0;
begin
    process(clk) is
    begin
        if clk'event and clk = '0' then
            if reset = '1' then
                counter <= 0;
            elsif en = '1' then 
                counter <= counter + 1;
            end if;
        end if;        
    end process;
    
    counter_out <= counter;
end; 


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component Counter is
        port( clk           : in std_logic;
          reset         : in std_logic;
          en            : in std_logic;
          counter_out   : out integer
        );
    end component;
signal clk, reset, en : std_logic;
signal counter_out : integer;
begin
    Counter_inst : Counter port map(clk, reset, en, counter_out);
    
    clk_process : process
    begin
        clk <= '1';
        wait for 5ps;
        
        clk <= '0';
        wait for 5ps;
    end process;
    
    process is
    begin
        reset <= '1';
        en <= '0';
        wait for 20ps;
        
        reset <= '0';
        wait for 10ps;
        
        en <= '1';
        wait for 100ps;
        
        en <= '0';
        wait for 40ps;
        
        reset <= '1';
        wait for 20ps;        
    end process;
end;
