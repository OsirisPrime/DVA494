library ieee;
use ieee.std_logic_1164.all;

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

entity LFSR is
    generic(N: natural);
    port(
        Clk         : in std_logic;
        seed_en     : in std_logic;
        seed_in     : in std_logic;
        data_out    : out std_logic_vector(N-1 downto 0)
        );
end;

architecture LFSR_Arch of LFSR is
    component Mux2To1 is
        port(
        i0      : in std_logic;     -- First input
        i1      : in std_logic;     -- Second input
        s0      : in std_logic;     -- First selection input
        out0    : out std_logic     -- Output
        );
    end component;
    
    component DFF is
        port(   
        D   : in std_logic;
        Clk : in std_logic;
        Q   : out std_logic
        );
    end component;
    
    signal shift_reg : std_logic_vector(N-1 downto 0);
    signal mux_out, feedback : std_logic;
    
begin
        feedback <= shift_reg(0) xor shift_reg(1);
        Mux_inst : Mux2To1 port map(i0 => feedback, i1 => seed_in, s0 => seed_en, out0 => mux_out);
       
       DFF_first : DFF port map(mux_out, Clk, Shift_reg(N-1));
       
        gen_DFFs : for i in N-1 downto 1 generate
            DFF_inst : DFF port map(Clk => Clk, D => Shift_reg(i), Q => shift_reg(i-1));
        end generate;
        
        data_out <= shift_reg;
end;
        

library ieee;
use ieee.std_logic_1164.all;

entity tb_LFSR is end;

architecture arch_tb_LFSR of tb_LFSR is 

    component LFSR is
    generic(N: natural);
    port(
        Clk         : in std_logic;
        seed_en     : in std_logic;
        seed_in     : in std_logic;
        data_out    : out std_logic_vector(N-1 downto 0)
        );
    end component;

signal Seed_in, Seed_en, Clk : std_logic := '0';
signal data_out : std_logic_vector(7 downto 0);

begin 
    LFSR_inst : LFSR generic map (8) port map(Clk, Seed_en, Seed_in, data_out);

    process is
    begin
         Clk <= not Clk;
         wait for 5ps;
    end process;
         
    process is
    begin
         Seed_en <= '1';
         Seed_in <= '1';
         wait for 10ps;
         
         Seed_in <= '0';
         wait for 20 ps;
         
         Seed_in <= '1';
         wait for 10 ps;
         
         Seed_in <= '0';
         wait for 10 ps;
         
         Seed_in <= '1';
         wait for 30 ps;
         
         Seed_in <= '0';
         Seed_en <= '0';   
         wait for 400ps;  
     end process;
end;
