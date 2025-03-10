library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for Mux0 (Same as step3 Mux4To1Exp)
entity Mux0 is
    port(
        i0      : in std_logic;     
        i1      : in std_logic;     
        i2      : in std_logic;     
        i3      : in std_logic;     
        s0      : in std_logic;     
        s1      : in std_logic;     
        out0    : out std_logic     
        );
end;

architecture Mux4to1Exp_arch of Mux0 is
    signal T1, T2, T3, T4 : std_logic;
    begin
        T1 <= i0 and (not s1) and (not s0);
        T2 <= i1 and (not s1) and s0;
        T3 <= i2 and s1 and (not s0);
        T4 <= i3 and s1 and s0;
        out0 <= T1 or T2 or T3 or T4;
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity Mux2To1 is
    port(
        i0      : in std_logic;
        i1      : in std_logic;
        s0      : in std_logic;
        out0    : out std_logic
        );
end Mux2To1;

architecture Mux2To1_arch of Mux2To1 is
    signal T1, T2 : std_logic;
    begin
        T1 <= i1 and s0;
        T2 <= i0 and not s0;
        out0 <= T1 or T2;
    end architecture;


library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for Mux1 (Same as step4 Mux4To1Inst)
entity Mux1 is
    port(
        i0      : in std_logic;
        i1      : in std_logic;
        i2      : in std_logic;
        i3      : in std_logic;
        s0      : in std_logic;
        s1      : in std_logic;
        out0    : out std_logic
        );
end;

architecture Mux4To1Inst_arch of Mux1 is
    component Mux2To1 is
        port(
        i0      : in std_logic;
        i1      : in std_logic;
        s0      : in std_logic;
        out0    : out std_logic
        );
    end component;
    
    signal y0, y1 :std_logic;
    begin
        Mux1: Mux2To1 port map(i0, i1, s0, y0);
        Mux2: Mux2To1 port map(i2, i3, s0, y1);
        Mux3: Mux2To1 port map(y0, y1, s1, out0);
    end architecture;


library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for double_mux
entity double_mux is
    port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input
        i2      : in std_logic;     -- Third input
        i3      : in std_logic;     -- Fourth input
        s0      : in std_logic;     -- First select
        s1      : in std_logic;     -- Second select 
        out0    : out std_logic;    -- First output
        out1    : out std_logic     -- Second output
        );
end double_mux;

architecture double_mux_arch of double_mux is
    component Mux0 is       -- Use Mux0
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
    
    component Mux1 is       -- Use Mux1
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

    begin
        -- Map the same inputs to Mux0 and Mux1
        Mux0_inst : Mux0 port map(i0, i1, i2, i3, s0, s1, out0);    -- Map to out0 
        Mux1_inst : Mux1 port map(i0, i1, i2, i3, s0, s1, out1);    -- Map to out1
    end architecture;
    
 
-- Testbench to verify double_mux entity 
library ieee;
use ieee.std_logic_1164.all;

entity test_double_mux is end;  -- Empty testbench entity

architecture test_arch of test_double_mux is
    component double_mux is
        port(
            i0      : in std_logic;
            i1      : in std_logic;
            i2      : in std_logic;
            i3      : in std_logic;
            s0      : in std_logic;
            s1      : in std_logic;
            out0    : out std_logic;
            out1    : out std_logic
            );
    end component;
    signal i0, i1, i2, i3, s0, s1, out0, out1 : std_logic;  -- Signals to connect the inputs and outputs
    begin
        test_instance : double_mux port map(i0, i1, i2, i3, s0, s1, out0, out1); -- Map the signals to the connections
        process is          -- Test with 15 states (Same as step3 and step4)
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
    