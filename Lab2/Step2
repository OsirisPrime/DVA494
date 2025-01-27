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
use ieee.numeric_std.all;

entity test_ArithLogic is end;

architecture test_arch of test_ArithLogic is
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
    signal A, B, AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero : signed(3 downto 0);
    
begin
    entity_inst : ArithLogic port map(A, B, AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero);
    process is 
    begin
        A <= "0000";
        B <= "0000";
        wait for 10 ps;
        
        A <= "0001";
        B <= "0001";
        wait for 10 ps;
        
        A <= "0010";
        B <= "0001";
        wait for 10 ps;
        
        A <= "1001";
        B <= "0010";
        wait for 10 ps;
        
        A <= "0101";
        B <= "1001";
        wait for 10 ps;
        
        A <= "1000";
        B <= "1001";
        wait for 10 ps;
        
        A <= "0101";
        B <= "0101";
        wait for 10 ps;
        
        A <= "1010";
        B <= "0101";
        wait for 10 ps;
        
        A <= "1000";
        B <= "0110";
        wait for 10 ps;
        
        A <= "1001";
        B <= "0110";
        wait for 10 ps;
    end process;
end;
