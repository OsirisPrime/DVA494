library ieee;
use ieee.std_logic_1164.all;

entity TMR is
    generic(N : natural);
    port( tmr_in1 : in std_logic_vector(N-1 downto 0);
          tmr_in2 : in std_logic_vector(N-1 downto 0);
          tmr_in3 : in std_logic_vector(N-1 downto 0);
          tmr_out : out std_logic_vector(N-1 downto 0)
        );
end;

architecture Arch_TMR of TMR is
begin
    tmr_out <= tmr_in1 when tmr_in1 = tmr_in2
               else tmr_in1 when tmr_in1 = tmr_in3
               else tmr_in2 when tmr_in2 = tmr_in3
               else tmr_in1;
end;


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component TMR is
    generic(N : natural);
    port( tmr_in1 : in std_logic_vector(N-1 downto 0);
          tmr_in2 : in std_logic_vector(N-1 downto 0);
          tmr_in3 : in std_logic_vector(N-1 downto 0);
          tmr_out : out std_logic_vector(N-1 downto 0)
        );
    end component;
    signal tmr_in1, tmr_in2, tmr_in3, tmr_out : std_logic_vector(2 downto 0);
begin
    TMR_inst : TMR generic map (3) port map(tmr_in1, tmr_in2, tmr_in3, tmr_out);
        process is
        begin
            tmr_in1 <= "000";
            tmr_in2 <= "000";
            tmr_in3 <= "000";
            wait for 10ps;
            
            tmr_in1 <= "100";
            tmr_in2 <= "100";
            tmr_in3 <= "001";
            wait for 10ps;
            
            tmr_in1 <= "011";
            tmr_in2 <= "100";
            tmr_in3 <= "011";
            wait for 10ps;
            
            tmr_in1 <= "010";
            tmr_in2 <= "111";
            tmr_in3 <= "111";
            wait for 10ps;
            
            tmr_in1 <= "100";
            tmr_in2 <= "010";
            tmr_in3 <= "001";
            wait for 10ps;
            
            tmr_in1 <= "101";
            tmr_in2 <= "010";
            tmr_in3 <= "101";
            wait for 10ps;
            
            tmr_in1 <= "010";
            tmr_in2 <= "010";
            tmr_in3 <= "010";
            wait for 10ps;
            
            tmr_in1 <= "110";
            tmr_in2 <= "011";
            tmr_in3 <= "011";
            wait for 10ps;
        end process;
end;
