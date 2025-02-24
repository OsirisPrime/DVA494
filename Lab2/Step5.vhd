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

entity RedundantALU is
    port(
        A               : in std_logic_vector(3 downto 0);
        B               : in std_logic_vector(3 downto 0);
        Operation       : in std_logic_vector(2 downto 0);
        FaultLocation   : in std_logic_vector(3 downto 0);
        Result0         : out std_logic_vector(3 downto 0);
        Result1         : out std_logic_vector(3 downto 0)
        );
end;

architecture Arch_RedundantALU of RedundantALU is
    component FaultyALU is
        port(
        A               : in std_logic_vector(3 downto 0);
        B               : in std_logic_vector(3 downto 0);
        Operation       : in std_logic_vector(2 downto 0);
        FaultLocation   : in std_logic_vector(3 downto 0);
        Result          : out std_logic_vector(3 downto 0)
        );
    end component;
begin
    ALU0 : FaultyALU port map(A, B, Operation, FaultLocation, Result0);
    ALU1 : FaultyALU port map(A, B, Operation, "1111", Result1);
end;


library ieee;
use ieee.std_logic_1164.all;

entity test_RedundantALU is end;

architecture test_arch of test_RedundantALU is
    component RedundantALU is 
        port(
            A               : in std_logic_vector(3 downto 0);
            B               : in std_logic_vector(3 downto 0);
            Operation       : in std_logic_vector(2 downto 0);
            FaultLocation   : in std_logic_vector(3 downto 0);
            Result0         : out std_logic_vector(3 downto 0);
            Result1         : out std_logic_vector(3 downto 0)
        );
    end component;
    signal A, B, FaultLocation : std_logic_vector(3 downto 0);
    signal Operation : std_logic_vector(2 downto 0);
    signal Result0, Result1 : std_logic_vector(3 downto 0);
begin
    entity_inst : RedundantALU port map(A,B, Operation, FaultLocation, Result0, Result1);
    process is
    begin
        A <= "0000";
        B <= "0000";
        Operation <= "000";
        FaultLocation <= "0000";
        wait for 10 ps;
        
        A <= "0010";
        B <= "0010";
        Operation <= "100";
        FaultLocation <= "0101";
        wait for 10 ps;
        
        A <= "1010";
        B <= "1110";
        Operation <= "111";
        FaultLocation <= "1001";
        wait for 10 ps;
        
        A <= "1010";
        B <= "1110";
        Operation <= "111";
        FaultLocation <= "1101";
        wait for 10 ps;
        
        A <= "0110";
        B <= "0001";
        Operation <= "101";
        FaultLocation <= "0010";
        wait for 10 ps;
        
        A <= "1011";
        B <= "0110";
        Operation <= "010";
        FaultLocation <= "1111";
        wait for 10 ps;
        
        A <= "0101";
        B <= "1010";
        Operation <= "101";
        FaultLocation <= "0011";
        wait for 10 ps;
        
        A <= "1010";
        B <= "0101";
        Operation <= "001";
        FaultLocation <= "1000";
        wait for 10 ps;
        
        A <= "1100";
        B <= "0011";
        Operation <= "110";
        FaultLocation <= "0100";
        wait for 10 ps;
        
        A <= "1110";
        B <= "0001";
        Operation <= "000";
        FaultLocation <= "1011";
        wait for 10 ps;        
        
        -- 10 new inputs
        A <= "1110";
        B <= "0001";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "0001";
        B <= "0110";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "0100";
        B <= "0100";
        Operation <= "100";
        FaultLocation <= "0101";
        wait for 10 ps;  
        
        A <= "1010";
        B <= "1110";
        Operation <= "111";
        FaultLocation <= "1101";
        wait for 10 ps;  
        
        A <= "1011";
        B <= "0110";
        Operation <= "010";
        FaultLocation <= "1111";
        wait for 10 ps;  
        
        A <= "0110";
        B <= "1111";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "0000";
        B <= "1111";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "1111";
        B <= "0000";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "0110";
        B <= "1001";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
        
        A <= "1001";
        B <= "0110";
        Operation <= "111";
        FaultLocation <= "0010";
        wait for 10 ps;  
    end process;
end;

