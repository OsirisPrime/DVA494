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

entity tb is end;

architecture arch_tb of tb is 

    component LFSR is
    generic(N: natural);
    port(
        Clk         : in std_logic;
        seed_en     : in std_logic;
        seed_in     : in std_logic;
        data_out    : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
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

signal out0, out1 : std_logic;
signal Seed_in, Seed_en, Clk : std_logic := '0';
signal data_out : std_logic_vector(5 downto 0);

begin 
    LFSR_inst : LFSR generic map (6) port map(Clk, Seed_en, Seed_in, data_out);
    Double_mux_inst : double_mux port map(data_out(0), 
                                          data_out(1), 
                                          data_out(2), 
                                          data_out(3),
                                          data_out(4),
                                          data_out(5),
                                          out0,
                                          out1
                                          );
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
         wait for 10 ps;
         
         Seed_in <= '0';
         Seed_en <= '0';   
         wait for 400ps;  
     end process;
end;
