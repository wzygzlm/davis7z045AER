library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

package Functions is
	function BooleanToStdLogic(BOOL : boolean) return std_logic;

	function SelectInteger(BOOL : boolean; IF_TRUE, IF_FALSE : integer) return integer;

	function SelectReal(BOOL : boolean; IF_TRUE, IF_FALSE : real) return real;

	function SizeCountNTimes(NUM : real) return integer;

	function SizeCountNTimes(NUM : integer) return integer;

	function SizeCountNTimes(NUM : unsigned) return integer;

	function SizeCountNTimes(NUM : signed) return integer;

	function SizeCountUpToN(NUM : real) return integer;

	function SizeCountUpToN(NUM : integer) return integer;

	function SizeCountUpToN(NUM : unsigned) return integer;

	function SizeCountUpToN(NUM : signed) return integer;
end package Functions;

package body Functions is
	function BooleanToStdLogic(BOOL : boolean) return std_logic is
	begin
		if BOOL then
			return '1';
		else
			return '0';
		end if;
	end function BooleanToStdLogic;

	function SelectInteger(BOOL : boolean; IF_TRUE, IF_FALSE : integer) return integer is
	begin
		if BOOL then
			return (IF_TRUE);
		else
			return (IF_FALSE);
		end if;
	end function SelectInteger;

	function SelectReal(BOOL : boolean; IF_TRUE, IF_FALSE : real) return real is
	begin
		if BOOL then
			return (IF_TRUE);
		else
			return (IF_FALSE);
		end if;
	end function SelectReal;

	function SizeCountNTimes(NUM : real) return integer is
	begin
		return integer(ceil(log2(NUM)));
	end function SizeCountNTimes;

	function SizeCountNTimes(NUM : integer) return integer is
	begin
		return integer(ceil(log2(real(NUM))));
	end function SizeCountNTimes;

	function SizeCountNTimes(NUM : unsigned) return integer is
	begin
		return integer(ceil(log2(real(to_integer(NUM)))));
	end function SizeCountNTimes;

	function SizeCountNTimes(NUM : signed) return integer is
	begin
		return integer(ceil(log2(real(to_integer(NUM)))));
	end function SizeCountNTimes;

	function SizeCountUpToN(NUM : real) return integer is
	begin
		return integer(ceil(log2(NUM + 1.0)));
	end function SizeCountUpToN;

	function SizeCountUpToN(NUM : integer) return integer is
	begin
		return integer(ceil(log2(real(NUM + 1))));
	end function SizeCountUpToN;

	function SizeCountUpToN(NUM : unsigned) return integer is
	begin
		return integer(ceil(log2(real(to_integer(NUM) + 1))));
	end function SizeCountUpToN;

	function SizeCountUpToN(NUM : signed) return integer is
	begin
		return integer(ceil(log2(real(to_integer(NUM) + 1))));
	end function SizeCountUpToN;
end package body Functions;
