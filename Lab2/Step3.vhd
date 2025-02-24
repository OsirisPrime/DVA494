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

entity test_FaultInjector is end;

architecture test_arch of test_FaultInjector is
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
    signal A, B, FaultLocation, FaultyA, FaultyB : std_logic_vector(3 downto 0);
    signal Operation, FaultyOp : std_logic_vector(2 downto 0);
begin
    entity_inst : FaultInjector port map(A, B, Operation, FaultLocation, FaultyA, FaultyB, FaultyOp);
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
    end process;
end;
