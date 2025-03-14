library ieee;
use ieee.std_logic_1164.all;

entity Max4Bit8To1 is
    port( 
        i0      : in std_logic_vector(3 downto 0);
        i1      : in std_logic_vector(3 downto 0);
        i2      : in std_logic_vector(3 downto 0);
        i3      : in std_logic_vector(3 downto 0);
        i4      : in std_logic_vector(3 downto 0);
        i5      : in std_logic_vector(3 downto 0);
        i6      : in std_logic_vector(3 downto 0);
        i7      : in std_logic_vector(3 downto 0);
        sel     : in std_logic_vector(2 downto 0);
        out0    : out std_logic_vector(3 downto 0)
        );
end;

architecture Arch_Max4Bit8T01 of Max4Bit8To1 is
    
begin
    with sel select
        out0 <= i0 when "000",
                i1 when "001",
                i2 when "010",
                i3 when "011",
                i4 when "100",
                i5 when "101",
                i6 when "110",
                i7 when others;
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ArithLogic is
    port(
        A           : in signed(3 downto 0);
        B           : in signed(3 downto 0);
        AplusB      : out signed(3 downto 0);
        AandB       : out signed(3 downto 0);
        AxorB       : out signed(3 downto 0);
        AnandB      : out signed(3 downto 0);
        APlusOne    : out signed(3 downto 0);
        Ao          : out signed(3 downto 0);
        Bo          : out signed(3 downto 0);
        AllZero     : out signed(3 downto 0)
        );
end;

architecture Arch_ArithLogic of ArithLogic is

begin
    AplusB <= A + B;
    AandB <= A and B;
    AxorB <= A xor B;
    AnandB <= A nand B;
    APlusOne <= A + 1;
    Ao <= A;
    Bo <= B;
    AllZero <= "0000";
end;


library ieee;
use ieee.std_logic_1164.all;

entity FaultInjector is
    port(
        A               : in std_logic_vector(3 downto 0);
        B               : in std_logic_vector(3 downto 0);
        Operation       : in std_logic_vector(2 downto 0);
        FaultLocation   : in std_logic_vector(3 downto 0);
        FaultyA         : out std_logic_vector(3 downto 0);
        FaultyB         : out std_logic_vector(3 downto 0);
        FaultyOp        : out std_logic_vector(2 downto 0)
        );
end;

architecture Arch_FaultInjector of FaultInjector is
begin
    process (A, B, Operation, FaultLocation) is 
    begin
        FaultyA <= A;
        FaultyB <= B;
        FaultyOp <= Operation;
        
        if FaultLocation = "0000" then
            FaultyA(0) <= not A(0);
            
        elsif FaultLocation = "0001" then
            FaultyA(1) <= not A(1);
            
        elsif FaultLocation = "0010" then
            FaultyA(2) <= not A(2);
            
        elsif FaultLocation = "0011" then
            FaultyA(3) <= not A(3);
            
        elsif FaultLocation = "0100" then
            FaultyB(0) <= not B(0);
            
        elsif FaultLocation = "0101" then
            FaultyB(1) <= not B(1);
            
        elsif FaultLocation = "0110" then
            FaultyB(2) <= not B(2);
            
        elsif FaultLocation = "0111" then
            FaultyB(3) <= not B(3);
            
        elsif FaultLocation = "1000" then
            FaultyOp(0) <= not Operation(0);
            
        elsif FaultLocation = "1001" then
            FaultyOp(1) <= not Operation(1);
            
        elsif FaultLocation = "1010" then
            FaultyOp(2) <= not Operation(2);
            
        else
            FaultyA <= A;
            FaultyB <= B;
            FaultyOp <= Operation;
        end if;      
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FaultyALU is
    port(
        A               : in std_logic_vector(3 downto 0);
        B               : in std_logic_vector(3 downto 0);
        Operation       : in std_logic_vector(2 downto 0);
        FaultLocation   : in std_logic_vector(3 downto 0);
        Result          : out std_logic_vector(3 downto 0)
        );
end;

architecture Arch_FaultyALU of FaultyALU is
    component Max4Bit8To1 is
        port( 
            i0      : in std_logic_vector(3 downto 0);
            i1      : in std_logic_vector(3 downto 0);
            i2      : in std_logic_vector(3 downto 0);
            i3      : in std_logic_vector(3 downto 0);
            i4      : in std_logic_vector(3 downto 0);
            i5      : in std_logic_vector(3 downto 0);
            i6      : in std_logic_vector(3 downto 0);
            i7      : in std_logic_vector(3 downto 0);
            sel     : in std_logic_vector(2 downto 0);
            out0    : out std_logic_vector(3 downto 0)
        );
    end component;

    component ArithLogic is
        port(
            A           : in signed(3 downto 0);
            B           : in signed(3 downto 0);
            AplusB      : out signed(3 downto 0);
            AandB       : out signed(3 downto 0);
            AxorB       : out signed(3 downto 0);
            AnandB      : out signed(3 downto 0);
            APlusOne    : out signed(3 downto 0);
            Ao          : out signed(3 downto 0);
            Bo          : out signed(3 downto 0);
            AllZero     : out signed(3 downto 0)
            );    
    end component;
    
    component FaultInjector is
        port(
            A               : in std_logic_vector(3 downto 0);
            B               : in std_logic_vector(3 downto 0);
            Operation       : in std_logic_vector(2 downto 0);
            FaultLocation   : in std_logic_vector(3 downto 0);
            FaultyA         : out std_logic_vector(3 downto 0);
            FaultyB         : out std_logic_vector(3 downto 0);
            FaultyOp        : out std_logic_vector(2 downto 0)
            );
    end component;
    signal AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero : signed(3 downto 0);
    signal FaultyA, FaultyB : std_logic_vector(3 downto 0);
    signal FaultyOp : std_logic_vector(2 downto 0);
begin
    FaultInjector_inst : FaultInjector port map(A, B, Operation, FaultLocation, FaultyA, FaultyB, FaultyOp);
    ArithLogic_inst : ArithLogic port map(signed(FaultyA), signed(FaultyB), AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero);
    Max4Bit8To1_inst : Max4Bit8To1 port map(std_logic_vector(AplusB), std_logic_vector(AandB), std_logic_vector(AxorB), 
                                            std_logic_vector(AnandB), std_logic_vector(APlusOne), std_logic_vector(Ao), 
                                            std_logic_vector(Bo), std_logic_vector(AllZero), FaultyOp, Result);
end;


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
        CLK : in std_logic;
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
use ieee.math_real.all;
use ieee.numeric_std.all;

entity fault_location_generator is
    generic(fault_probability : real; seed : positive);
    port(
        clk            : in std_logic;
        fault_location : out std_logic_vector(3 downto 0)
    );
end;

architecture arch of fault_location_generator is 
begin
    process(clk)
        variable seed1, seed2 : positive;
        variable rand : real;
    begin
        if (clk = '1') then
            seed1 := seed1 + seed;
            seed2 := seed2 + 2 * seed + 1;
            uniform(seed1, seed2, rand);
            if (rand < fault_probability) then 
                seed1 := seed1 + seed;
                seed2 := seed2 + 2 * seed + 1;
                uniform(seed1, seed2, rand);
                fault_location <= std_logic_vector(to_unsigned(integer(floor(rand * real(11))), 4));
            else
                fault_location <= "1111";
            end if;
        end if;
    end process;
end;


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

--/////////////////////////////////////////////////////////////////////////--


library ieee;
use ieee.std_logic_1164.all;

entity FaultyALUTesterTMR is
    generic(Fault_probability : real);
    port( FAT_out : out integer);
end;

architecture Arch_FAT of FaultyALUTesterTMR is
    component FaultyALU is
        port(
            A               : in std_logic_vector(3 downto 0);
            B               : in std_logic_vector(3 downto 0);
            Operation       : in std_logic_vector(2 downto 0);
            FaultLocation   : in std_logic_vector(3 downto 0);
            Result          : out std_logic_vector(3 downto 0)
            );
    end component;
    
    component LFSR is
        generic(N: natural := 8);
        port(
            Clk         : in std_logic;
            seed_en     : in std_logic;
            seed_in     : in std_logic;
            data_out    : out std_logic_vector(N-1 downto 0)
            );
    end component;
    
    component Inequality_Counter is
        generic(N : natural := 4);
        port( in1       : in std_logic_vector(N-1 downto 0);
              in2       : in std_logic_vector(N-1 downto 0);
              clk       : in std_logic;
              reset     : in std_logic;
              ineq_counter_out  : out integer
            );
    end component;
    
    component fault_location_generator is
        generic(fault_probability : real; seed : positive);
        port(
            clk            : in std_logic;
            fault_location : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component TMR is
        generic(N : natural := 4);
        port( tmr_in1 : in std_logic_vector(N-1 downto 0);
              tmr_in2 : in std_logic_vector(N-1 downto 0);
              tmr_in3 : in std_logic_vector(N-1 downto 0);
              tmr_out : out std_logic_vector(N-1 downto 0)
            );
    end component;
    
    signal FALU1_out, FALU2_out, FALU3_out, FALU4_out, TMR_out : std_logic_vector(3 downto 0);  
    signal Fault_Location1, Fault_Location2, Fault_Location3 : std_logic_vector(3 downto 0);   
    signal LFSR_out : std_logic_vector(10 downto 0);
    signal A, B : std_logic_vector(3 downto 0);
    signal Op : std_logic_vector(2 downto 0);
    signal Seed_in : std_logic := '1';    
    signal Seed_en : std_logic := '1';    
    signal Clk : std_logic := '0';
    signal Reset : std_logic := '0';        
    signal counter : integer := 0;

begin
    LSFR_inst : LFSR generic map (11) port map( Clk => Clk, seed_en => Seed_en, 
                                                seed_in => Seed_in, data_out => LFSR_out);
    
    A   <= LFSR_out(3 downto 0);
    B   <= LFSR_out(7 downto 4);
    Op  <= LFSR_out(10 downto 8);
    
    FLG_inst1 : fault_location_generator generic map (Fault_probability, 1) port map(clk => Clk, fault_location => Fault_Location1);
    FLG_inst2 : fault_location_generator generic map (Fault_probability, 2) port map(clk => Clk, fault_location => Fault_Location2);
    FLG_inst3 : fault_location_generator generic map (Fault_probability, 3) port map(clk => Clk, fault_location => Fault_Location3);
    
    FALU1_inst : FaultyALU port map(A => A, B => B, Operation => Op, FaultLocation => Fault_Location1, Result => FALU1_out);
    FALU2_inst : FaultyALU port map(A => A, B => B, Operation => Op, FaultLocation => Fault_Location2, Result => FALU2_out);
    FALU3_inst : FaultyALU port map(A => A, B => B, Operation => Op, FaultLocation => Fault_Location3, Result => FALU3_out);
    FALU4_inst : FaultyALU port map(A => A, B => B, Operation => Op, FaultLocation => "1111", Result => FALU4_out);
    
    TMR_inst : TMR generic map (4) port map (FALU1_out, FALU2_out, FALU3_out, TMR_out);

    Ineq_inst : Inequality_Counter generic map (4) port map(in1 => TMR_out, in2 => FALU4_out, clk => Clk, reset => Reset, ineq_counter_out => FAT_out);
    
    process is
    begin
        if counter > 11 then
            Seed_en <= '0';
        elsif Clk = '1' then
            counter <= counter + 1;
        end if;
        Clk <= not Clk;
        wait for 1ps;
    end process;
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb1 is end;

architecture Arch_tb of tb1 is
    component FaultyALUTesterTMR is
        generic(Fault_probability : real);
        port( FAT_out : out integer);
    end component;
    
    signal FAT_out : integer;
begin
    tester : FaultyALUTesterTMR generic map (0.2) port map (FAT_out);
end;


entity tb2 is end;

architecture Arch_tb of tb2 is
    component FaultyALUTesterTMR is
        generic(Fault_probability : real);
        port( FAT_out : out integer);
    end component;
    
    signal FAT_out : integer;
begin
    tester : FaultyALUTesterTMR generic map (0.5) port map (FAT_out);
end;


entity tb3 is end;

architecture Arch_tb of tb3 is
    component FaultyALUTesterTMR is
        generic(Fault_probability : real);
        port( FAT_out : out integer);
    end component;
    
    signal FAT_out : integer;
begin
    tester : FaultyALUTesterTMR generic map (1.0) port map (FAT_out);
end;
