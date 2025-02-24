library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for a 4-to-1 multiplexer
entity Mux4To1Exp is
    port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input 
        i2      : in std_logic;     -- Third input
        i3      : in std_logic;     -- Fourth input
        s0      : in std_logic;     -- First select
        s1      : in std_logic;     -- Second select
        out0    : out std_logic     -- Output
        );
end;

architecture Mux4To1Exp_arch of Mux4To1Exp is
    signal T1, T2, T3, T4 : std_logic;      -- Temporary signals to store values
    begin
        -- out0 = i0*s1'*s0' + i1*s1'*s0 + i2*s1*s0' + i3*s1*s0
        T1 <= i0 and (not s1) and (not s0); -- Asign value to T1
        T2 <= i1 and (not s1) and s0;       -- Asign value to T2
        T3 <= i2 and s1 and (not s0);       -- Asign value to T3
        T4 <= i3 and s1 and s0;             -- Asign value to t4
        out0 <= T1 or T2 or T3 or T4;       -- Asign value to output
end architecture;


-- Testbench to verify Mux4To1Exp
library ieee;
use ieee.std_logic_1164.all;

entity test_Mux4To1Exp is end;  -- Empty testbench entity

architecture test_arch of test_Mux4To1Exp is
    component Mux4To1Exp is
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
        test_instance : Mux4To1Exp port map(i0, i1, i2, i3, s0, s1, out0);  -- Map the signals to the connections 
        process is          -- Test with 15 states
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
