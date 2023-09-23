----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:42 05/08/2023 
-- Design Name: 
-- Module Name:    fulladdercomp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladdercomp is
	 generic( n:integer:=8);
    Port ( a : in  STD_LOGIC_VECTOR (n-1 downto 0);
           b : in  STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (n-1 downto 0);
           cout : out  STD_LOGIC);
end fulladdercomp;

architecture Behavioral of fulladdercomp is

component fulladder is
 Port (    a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);

end component;
signal c : std_logic_vector(n-2 downto 0) ; 
begin

firstadder: fulladder port map(a(0),b(0),cin,sum(0),c(0));
FA: for i in 1 to n-2 generate
FA_inst: fulladder
port map(a(i),b(i),c(i-1),sum(i),c(i));

end generate FA;
lastadder: fulladder port map(a(n-1),b(n-1),c(n-2),sum(n-1),cout);


end Behavioral;

