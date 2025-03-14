library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for a 2-to-1 multiplexer
entity Mux2To1 is
    port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input
        s0      : in std_logic;     -- First select
        out0    : out std_logic     -- Output
        );
end Mux2To1;

architecture Mux2To1_arch of Mux2To1 is
    signal T1, T2 : std_logic; 
    begin
        -- out0 = i0*s0' + i1*s0 (Same as step2)
        T1 <= i1 and s0;        -- Asign value to T1
        T2 <= i0 and not s0;    -- Asign value to T2
        out0 <= T1 or T2;       -- Asign value to output
    end architecture;


library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for a 4-to-1 multiplexer
entity Mux4To1Inst is
    port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input
        i2      : in std_logic;     -- Third input
        i3      : in std_logic;     -- Fourth input
        s0      : in std_logic;     -- First select
        s1      : in std_logic;     -- Seconf select
        out0    : out std_logic     -- Output
        );
end Mux4To1Inst;

architecture Mux4To1Inst_arch of Mux4To1Inst is
    component Mux2To1 is    -- Use 2-to-1 multiplexer
        port(
        i0      : in std_logic;
        i1      : in std_logic;
        s0      : in std_logic;
        out0    : out std_logic
        );
    end component;
    
    signal y0, y1 :std_logic;   -- Temporary output signals from 2-to-1 multiplexer
    begin
        -- Map according to figure (b) in lab description
        Mux1: Mux2To1 port map(i0, i1, s0, y0);
        Mux2: Mux2To1 port map(i2, i3, s0, y1);     
        Mux3: Mux2To1 port map(y0, y1, s1, out0);   -- Last 2-to-1 multiplexer
    end architecture;
    

-- Testbench to verify Mux4To1Inst entity    
library ieee;
use ieee.std_logic_1164.all;
 
entity Test_Mux4To1Inst is end;     -- Empty testbench entity

architecture test_arch of test_Mux4To1Inst is
    component Mux4To1Inst is 
        port(
        i0      : in std_logic;
        i1      : in std_logic;
        i2      : in std_logic;
        i3      : in std_logic;
        s0      : in std_logic;
        s1      : in std_logic;
        out0    : out std_logic
        );
    end component;
    signal i0, i1, i2, i3, s0, s1, out0 : std_logic;    -- Signals to connect to the inputs and output
    begin
        test_instance : Mux4To1Inst port map(i0, i1, i2, i3, s0, s1, out0); -- Map the signals to the connections 
        process is          -- Test with 15 states (Same as step3)
            begin
                s1 <= '0';
                s0 <= '0';
                i0 <= '0';
                i1 <= '1';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '0';
                i0 <= '1';
                i1 <= '0';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '1';
                i0 <= '0';
                i1 <= '1';
                i2 <= '0';
                i3 <= '0';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                i2 <= '0';
                i3 <= '0';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '0';
                i0 <= '1';
                i1 <= '1';
                i2 <= '0';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '0';
                i1 <= '1';
                i2 <= '1';
                i3 <= '0';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '0';
                i1 <= '0';
                i2 <= '0';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                i2 <= '0';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                i2 <= '1';
                i3 <= '0';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '1';
                i0 <= '0';
                i1 <= '1';
                i2 <= '0';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '0';
                i0 <= '1';
                i1 <= '1';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '0';
                i0 <= '1';
                i1 <= '1';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '0';
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                i2 <= '1';
                i3 <= '1';
                wait for 10 ps;
                
                s1 <= '1';
                s0 <= '1';
                i0 <= '0';
                i1 <= '0';
                i2 <= '0';
                i3 <= '0';
                wait for 10 ps;            
            end process;
    end;