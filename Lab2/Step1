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

entity test_Max4Bit8To1 is end;

architecture test_arch of test_Max4Bit8To1 is
    component Max4Bit8To1 is
        port( 
            i0 : in std_logic_vector(3 downto 0);
            i1 : in std_logic_vector(3 downto 0);
            i2 : in std_logic_vector(3 downto 0);
            i3 : in std_logic_vector(3 downto 0);
            i4 : in std_logic_vector(3 downto 0);
            i5 : in std_logic_vector(3 downto 0);
            i6 : in std_logic_vector(3 downto 0);
            i7 : in std_logic_vector(3 downto 0);
            sel : in std_logic_vector(2 downto 0);
            out0: out std_logic_vector(3 downto 0)
        );
    end component;
    signal i0, i1, i2, i3, i4, i5, i6, i7 : std_logic_vector(3 downto 0);
    signal sel : std_logic_vector(2 downto 0);
    signal out0 : std_logic_vector(3 downto 0);
begin
    entity_inst : Max4Bit8To1 port map(i0, i1, i2, i3, i4, i5, i6, i7, sel, out0);
    process is
    begin
        i0 <= "0100";
        i1 <= "0000";
        i2 <= "1001";
        i3 <= "0000";
        i4 <= "0110";
        i5 <= "1110";
        i6 <= "0010";
        i7 <= "0100";
        sel <= "000";
        wait for 10 ps;
        
        i0 <= "1000";
        i1 <= "1101";
        i2 <= "0101";
        i3 <= "0101";
        i4 <= "0001";
        i5 <= "0100";
        i6 <= "1100";
        i7 <= "0011";
        sel <= "001";
        wait for 10 ps;
        
        i0 <= "0100";
        i1 <= "1001";
        i2 <= "0110";
        i3 <= "1000";
        i4 <= "0010";
        i5 <= "0111";
        i6 <= "1010";
        i7 <= "0101";
        sel <= "010";
        wait for 10 ps;
        
        i0 <= "0001";
        i1 <= "0101";
        i2 <= "0011";
        i3 <= "1111";
        i4 <= "0000";
        i5 <= "1101";
        i6 <= "0101";
        i7 <= "1110";
        sel <= "011";
        wait for 10 ps;
        
        i0 <= "1110";
        i1 <= "0111";
        i2 <= "1010";
        i3 <= "0101";
        i4 <= "0000";
        i5 <= "0011";
        i6 <= "0100";
        i7 <= "1101";
        sel <= "100";
        wait for 10 ps;
        
        i0 <= "1001";
        i1 <= "1100";
        i2 <= "0010";
        i3 <= "0100";
        i4 <= "0000";
        i5 <= "1000";
        i6 <= "0111";
        i7 <= "0100";
        sel <= "101";
        wait for 10 ps;
        
        i0 <= "0000";
        i1 <= "0000";
        i2 <= "0000";
        i3 <= "0000";
        i4 <= "0000";
        i5 <= "0000";
        i6 <= "0001";
        i7 <= "0000";
        sel <= "110";
        wait for 10 ps;
        
        i0 <= "0101";
        i1 <= "0011";
        i2 <= "1001";
        i3 <= "0010";
        i4 <= "0101";
        i5 <= "1101";
        i6 <= "0111";
        i7 <= "0001";
        sel <= "111";
        wait for 10 ps;
        
        i0 <= "0011";
        i1 <= "0111";
        i2 <= "0110";
        i3 <= "0100";
        i4 <= "0010";
        i5 <= "0110";
        i6 <= "0100";
        i7 <= "1001";
        sel <= "111";
        wait for 10 ps;
        
        i0 <= "0110";
        i1 <= "1111";
        i2 <= "1010";
        i3 <= "0110";
        i4 <= "0001";
        i5 <= "0001";
        i6 <= "1100";
        i7 <= "0100";
        sel <= "000";
        wait for 10 ps;
    end process;
end;
