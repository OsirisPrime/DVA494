library ieee;
use ieee.std_logic_1164.all;

entity DFF is
    port(   
        D   : in std_logic;
        Clk : in std_logic;
        Q   : out std_logic
        );
end;

architecture Arch_DFF of DFF is
begin
    process(Clk) is
    begin
        if Clk' event and Clk = '1' then
            Q <= D;
        end if;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture arch_tb_arch of tb is
    component DFF is
        port(
            D   : in std_logic;
            Clk : in std_logic;
            Q   : out std_logic
            );
    end component;
signal D, Clk, Q: std_logic;
begin
    DFF_inst : DFF port map(D, Clk, Q);

    process is
    begin
        D <= '1';
        Clk <= '1';
        wait for 1 ps;
        
        D <= '0';
        Clk <= '0';
        wait for 1 ps;
        
        D <= '0';        
        CLK <= '1';
        wait for 1 ps;
        
        Clk <= '0';
        wait for 1 ps;
    end process;
end;
