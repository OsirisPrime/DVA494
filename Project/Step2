library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
    generic(N : natural);
    port( cmp_in1 : in std_logic_vector(N-1 downto 0);
          cmp_in2 : in std_logic_vector(N-1 downto 0);
          cmp_out : out std_logic
        );
end;

architecture Arch_Comp of Comparator is
begin 
    process(cmp_in1, cmp_in2) is
    begin
        if cmp_in1 = cmp_in2 then
           cmp_out <= '0';
        else
            cmp_out <= '1';
        end if;
    end process;
end;

library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component Comparator is
        generic(N : natural);
        port( cmp_in1 : in std_logic_vector(N-1 downto 0);
              cmp_in2 : in std_logic_vector(N-1 downto 0);
              cmp_out : out std_logic
        );
    end component;
    signal cmp_in1, cmp_in2 : std_logic_vector(3 downto 0);
    signal cmp_out : std_logic;
begin 
    Comp_inst : Comparator generic map (4) port map(cmp_in1, cmp_in2, cmp_out);
    
    process is
    begin
        cmp_in1 <= "0000";
        cmp_in2 <= "0000";
        wait for 10ps;
        
        cmp_in1 <= "0001";
        cmp_in2 <= "0000";
        wait for 10ps;
        
        cmp_in1 <= "1010";
        cmp_in2 <= "1010";
        wait for 10ps;
        
        cmp_in1 <= "1100";
        cmp_in2 <= "1100";
        wait for 10ps;
        
        cmp_in1 <= "0110";
        cmp_in2 <= "0111";
        wait for 10ps;
        
        cmp_in1 <= "1011";
        cmp_in2 <= "1010";
        wait for 10ps;
    end process;
end;
