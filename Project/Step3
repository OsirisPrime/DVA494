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

entity Inequality_Counter is
    generic(N : natural);
    port( in1       : in std_logic_vector(N-1 downto 0);
          in2       : in std_logic_vector(N-1 downto 0);
          clk       : in std_logic;
          reset     : in std_logic;
          ineq_counter_out  : out integer
        );
end;

architecture Arch_ineq of Inequality_Counter is
    component Counter is
        port( clk           : in std_logic;
              reset         : in std_logic;
              en            : in std_logic;
              counter_out   : out integer
        );
    end component;
    
    component Comparator is
        generic(N : natural);
        port( cmp_in1 : in std_logic_vector(N-1 downto 0);
              cmp_in2 : in std_logic_vector(N-1 downto 0);
              cmp_out : out std_logic
        );
    end component;
   
    signal cmp_out : STD_LOGIC;
    
begin
    Comp_inst : Comparator generic map (4) port map(cmp_in1 => in1, cmp_in2 => in2, cmp_out => cmp_out);
    
    Counter_inst : Counter port map(clk => clk, reset => reset, en => cmp_out, counter_out => ineq_counter_out);
end;


library ieee;
use ieee.std_logic_1164.all;

entity tb is end;

architecture Arch_tb of tb is
    component Inequality_Counter is
        generic(N : natural);
        port( in1       : in std_logic_vector(N-1 downto 0);
              in2       : in std_logic_vector(N-1 downto 0);
              clk       : in std_logic;
              reset     : in std_logic;
              ineq_counter_out  : out integer
        );
    end component;
    
    signal in1, in2 : std_logic_vector(3 downto 0);
    signal clk, reset : std_logic;
    signal ineq_counter_out: integer;
begin
    Ineq_Counter_inst : Inequality_Counter generic map (4) port map(
                                                                    clk => clk, 
                                                                    reset => reset, 
                                                                    in1 => in1, 
                                                                    in2 => in2, 
                                                                    ineq_counter_out => ineq_counter_out
                                                                    );
                                                                    
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
        in1 <= "0000";
        in2 <= "0000";
        wait for 10ps;
        
        reset <= '0';
        wait for 10ps;
        
        in1 <= "0001";
        in2 <= "0000";
        wait for 30ps;
        
        in1 <= "1010";
        in2 <= "1010";
        wait for 10ps;
        
        in1 <= "1111";
        in2 <= "0111";
        wait for 20ps;
        
        in1 <= "1010";
        in2 <= "1010";
        wait for 10ps;
        
        in1 <= "1111";
        in2 <= "1111";
        wait for 20ps;
    end process;
end;
