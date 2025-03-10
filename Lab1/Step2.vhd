library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for a 2-to-1 multiplexer
entity Mux2To1 is
    port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input
        s0      : in std_logic;     -- First selection input
        out0    : out std_logic     -- Output
        );
end;

architecture Mux2To1_arch of Mux2To1 is
    signal T1, T2 : std_logic;  -- Temporary signals to store values
    begin
        T1 <= s0 and i1;        -- Asign value of s0 AND i1 to T1
        T2 <= i0 and not s0;    -- Asign value of i0 AND (not s0) to T2
        out0 <= T1 or T2;       -- Asign value of T1 AND T2 to output
end architecture;


-- Testbench to verify Mux2To1 entity
library ieee;
use ieee.std_logic_1164.all;

entity test_Mux2To1 is end;     -- Empty testbench entity

architecture test_arch of test_Mux2To1 is
    component Mux2To1 is
        port(
        i0      : in std_logic;
        i1      : in std_logic;
        s0      : in std_logic;
        out0    : out std_logic
        );
    end component;
    signal i0, i1, s0, out0 : std_logic;    -- Signals to connect to the inputs and output
    begin
        test_instance : Mux2To1 port map(i0, i1, s0, out0); -- Map the signals to the connections
        process is          -- Test with 8 states
            begin
                s0 <= '0';
                i0 <= '0';
                i1 <= '0';
                wait for 10 ps;
                
                s0 <= '0';
                i0 <= '0';
                i1 <= '1';
                wait for 10 ps;
                
                s0 <= '0';
                i0 <= '1';
                i1 <= '0';
                wait for 10 ps;
                
                s0 <= '0';
                i0 <= '1';
                i1 <= '1';
                wait for 10 ps;
                
                s0 <= '1';
                i0 <= '0';
                i1 <= '0';
                wait for 10 ps;
                
                s0 <= '1';
                i0 <= '0';
                i1 <= '1';
                wait for 10 ps;
                
                s0 <= '1';
                i0 <= '1';
                i1 <= '0';
                wait for 10 ps;
                
                s0 <= '1';
                i0 <= '1';
                i1 <= '1';
                wait for 10 ps;
            end process;
    end;
