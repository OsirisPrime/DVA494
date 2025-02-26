library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for an AND gate
entity hello_and is 
    port(
        in1     : in std_logic;     -- First input of the AND gate
        in2     : in std_logic;     -- Second input of the AND gate
        result  : out std_logic     -- Output of the AND gate
        );
end;

architecture rtl of hello_and is
    signal temp : std_logic;    -- Temporary signal to store value
begin
    temp    <= in1 and in2;     -- Asign value to temp
    result  <= temp;            -- Asign temp value to result
end;


-- Testbench to verify hello_and entity
library ieee;
use ieee.std_logic_1164.all;

entity tb is end;                   -- Empty testbench entity
architecture tb_arch of tb is
    component hello_and is
        port(
        in1     : in std_logic;
        in2     : in std_logic;
        result  : out std_logic
        );
    end component;
        
        -- Signals to connect to the inputs and output 
        signal in1 : std_logic;     -- First test input
        signal in2 : std_logic;     -- Second test input
        signal result : std_logic;  -- Test output
begin
    entity_instance_1 : hello_and
        port map(in1, in2, result); -- Map the signal to the AND gate connections
    process is                      -- Test with four states
    begin
        in1 <= '0';
        in2 <= '0';
        wait for 10 ps;
        
        in1 <= '0';
        in2 <= '1';
        wait for 10 ps;
        
        in1 <= '1';
        in2 <= '0';
        wait for 10 ps;
        
        in1 <= '1';
        in2 <= '1';
        wait for 10 ps;                        
    end process;
end;
