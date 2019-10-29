----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2019 12:05:32 PM
-- Design Name: 
-- Module Name: MyBlockRAM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MyBlockRAM is
	generic(
	ADDRESS_DEPTH : integer;
    ADDRESS_WIDTH : integer;
    DATA_WIDTH    : integer;
    RAM_FORMAT     : string);
    port(
    Clock_CI : in  std_logic;
--    Reset_RI : in std_logic;
    
    Enable_SI  : in std_logic;
    WriteEnable_SI : in std_logic;
    Address_DI : in  unsigned(ADDRESS_WIDTH-1 downto 0);
    Data_DI : in std_logic_vector(DATA_WIDTH-1 downto 0);
    Data_DO : out std_logic_vector(DATA_WIDTH-1 downto 0));
    
end MyBlockRAM;

architecture RTL of MyBlockRAM is

   type ram_type is array (0 to (2**ADDRESS_WIDTH)-1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
   signal ram : ram_type := (others => (others => '0'));
   signal read_address : unsigned(ADDRESS_WIDTH - 1 downto 0);
   
   attribute ram_style : string;
   attribute ram_style of ram : signal is RAM_FORMAT;

begin

    RamProc: process(Clock_CI) is
    begin
        if rising_edge(Clock_CI) then
            read_address <= Address_DI;
        
            if Enable_SI = '1' then
                if WriteEnable_SI = '1' then
                    ram(to_integer(unsigned(Address_DI))) <= Data_DI;
                end if;
                Data_DO <= ram(to_integer(unsigned(read_address)));
            end if;
            
        end if;
    end process RamProc;

end architecture RTL;
