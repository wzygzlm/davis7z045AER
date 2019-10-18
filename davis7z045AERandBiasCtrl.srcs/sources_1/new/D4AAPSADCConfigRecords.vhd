library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountUpToN;
use work.Functions.SelectInteger;
use work.Settings.CHIP_APS_SIZE_COLUMNS;
use work.Settings.CHIP_APS_SIZE_ROWS;
use work.Settings.CHIP_APS_STREAM_START;
use work.Settings.CHIP_APS_AXES_INVERT;
use work.Settings.ADC_CLOCK_FREQ;

package D4AAPSADCConfigRecords is
	constant APS_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(2, 7);

	constant APS_CLOCK_FREQ_SIZE : integer := SizeCountUpToN(ADC_CLOCK_FREQ);

	constant APS_EXPOSURE_SIZE       : integer := 22 + APS_CLOCK_FREQ_SIZE; -- Up to about four seconds.
	constant APS_FRAME_INTERVAL_SIZE : integer := 23 + APS_CLOCK_FREQ_SIZE; -- Up to about eight seconds.

	-- Col/Row size as seen by user input depends on AXES_INVERT.
	constant APS_USER_LENGTH_COLUMNS : integer := SelectInteger(CHIP_APS_AXES_INVERT = '0', CHIP_APS_SIZE_COLUMNS'length, CHIP_APS_SIZE_ROWS'length);
	constant APS_USER_LENGTH_ROWS    : integer := SelectInteger(CHIP_APS_AXES_INVERT = '0', CHIP_APS_SIZE_ROWS'length, CHIP_APS_SIZE_COLUMNS'length);
	constant APS_USER_VALUE_COLUMNS  : integer := SelectInteger(CHIP_APS_AXES_INVERT = '0', to_integer(CHIP_APS_SIZE_COLUMNS), to_integer(CHIP_APS_SIZE_ROWS));
	constant APS_USER_VALUE_ROWS     : integer := SelectInteger(CHIP_APS_AXES_INVERT = '0', to_integer(CHIP_APS_SIZE_ROWS), to_integer(CHIP_APS_SIZE_COLUMNS));

	-- DAVIS RGB specific timings.
	constant APS_TRANSFERTIME_SIZE    : integer := 11 + APS_CLOCK_FREQ_SIZE; -- Up to about 2 miliseconds.
	constant APS_RSFDSETTLETIME_SIZE  : integer := 7 + APS_CLOCK_FREQ_SIZE; -- Up to about 128 microseconds.
	constant APS_GSPDRESETTIME_SIZE   : integer := 7 + APS_CLOCK_FREQ_SIZE; -- Up to about 128 microseconds.
	constant APS_GSRESETFALLTIME_SIZE : integer := 7 + APS_CLOCK_FREQ_SIZE; -- Up to about 128 microseconds.
	constant APS_GSTXFALLTIME_SIZE    : integer := 7 + APS_CLOCK_FREQ_SIZE; -- Up to about 128 microseconds.
	constant APS_GSFDRESETTIME_SIZE   : integer := 7 + APS_CLOCK_FREQ_SIZE; -- Up to about 128 microseconds.

	type tD4AAPSADCConfigParamAddresses is record
		SizeColumns_D         : unsigned(7 downto 0);
		SizeRows_D            : unsigned(7 downto 0);
		OrientationInfo_D     : unsigned(7 downto 0);
		ColorFilter_D         : unsigned(7 downto 0);
		Run_S                 : unsigned(7 downto 0);
		WaitOnTransferStall_S : unsigned(7 downto 0);
		HasGlobalShutter_S    : unsigned(7 downto 0);
		GlobalShutter_S       : unsigned(7 downto 0);
		StartColumn0_D        : unsigned(7 downto 0);
		StartRow0_D           : unsigned(7 downto 0);
		EndColumn0_D          : unsigned(7 downto 0);
		EndRow0_D             : unsigned(7 downto 0);
		Exposure_D            : unsigned(7 downto 0);
		FrameInterval_D       : unsigned(7 downto 0);
		Transfer_D            : unsigned(7 downto 0);
		RSFDSettle_D          : unsigned(7 downto 0);
		GSPDReset_D           : unsigned(7 downto 0);
		GSResetFall_D         : unsigned(7 downto 0);
		GSTXFall_D            : unsigned(7 downto 0);
		GSFDReset_D           : unsigned(7 downto 0);
	end record tD4AAPSADCConfigParamAddresses;

	constant APS_CONFIG_PARAM_ADDRESSES : tD4AAPSADCConfigParamAddresses := (
		SizeColumns_D         => to_unsigned(0, 8),
		SizeRows_D            => to_unsigned(1, 8),
		OrientationInfo_D     => to_unsigned(2, 8),
		ColorFilter_D         => to_unsigned(3, 8),
		Run_S                 => to_unsigned(4, 8),
		WaitOnTransferStall_S => to_unsigned(5, 8),
		HasGlobalShutter_S    => to_unsigned(6, 8),
		GlobalShutter_S       => to_unsigned(7, 8),
		StartColumn0_D        => to_unsigned(8, 8),
		StartRow0_D           => to_unsigned(9, 8),
		EndColumn0_D          => to_unsigned(10, 8),
		EndRow0_D             => to_unsigned(11, 8),
		Exposure_D            => to_unsigned(12, 8),
		FrameInterval_D       => to_unsigned(13, 8),
		Transfer_D            => to_unsigned(14, 8),
		RSFDSettle_D          => to_unsigned(15, 8),
		GSPDReset_D           => to_unsigned(16, 8),
		GSResetFall_D         => to_unsigned(17, 8),
		GSTXFall_D            => to_unsigned(18, 8),
		GSFDReset_D           => to_unsigned(19, 8));

	type tD4AAPSADCConfig is record
		SizeColumns_D         : unsigned(CHIP_APS_SIZE_COLUMNS'range);
		SizeRows_D            : unsigned(CHIP_APS_SIZE_ROWS'range);
		OrientationInfo_D     : std_logic_vector(2 downto 0);
		ColorFilter_D         : std_logic_vector(3 downto 0);
		Run_S                 : std_logic;
		WaitOnTransferStall_S : std_logic; -- Wether to wait when the FIFO is full or not.
		HasGlobalShutter_S    : std_logic;
		GlobalShutter_S       : std_logic; -- Enable global shutter instead of rolling shutter.
		StartColumn0_D        : unsigned(APS_USER_LENGTH_COLUMNS - 1 downto 0);
		StartRow0_D           : unsigned(APS_USER_LENGTH_ROWS - 1 downto 0);
		EndColumn0_D          : unsigned(APS_USER_LENGTH_COLUMNS - 1 downto 0);
		EndRow0_D             : unsigned(APS_USER_LENGTH_ROWS - 1 downto 0);
		Exposure_D            : unsigned(APS_EXPOSURE_SIZE - 1 downto 0); -- in cycles at ADC frequency
		FrameInterval_D       : unsigned(APS_FRAME_INTERVAL_SIZE - 1 downto 0); -- in cycles at ADC frequency
		Transfer_D            : unsigned(APS_TRANSFERTIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
		RSFDSettle_D          : unsigned(APS_RSFDSETTLETIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
		GSPDReset_D           : unsigned(APS_GSPDRESETTIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
		GSResetFall_D         : unsigned(APS_GSRESETFALLTIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
		GSTXFall_D            : unsigned(APS_GSTXFALLTIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
		GSFDReset_D           : unsigned(APS_GSFDRESETTIME_SIZE - 1 downto 0); -- in cycles at ADC frequency
	end record tD4AAPSADCConfig;

	constant tD4AAPSADCConfigDefault : tD4AAPSADCConfig := (
		SizeColumns_D         => CHIP_APS_SIZE_COLUMNS,
		SizeRows_D            => CHIP_APS_SIZE_ROWS,
		OrientationInfo_D     => CHIP_APS_AXES_INVERT & CHIP_APS_STREAM_START,
		ColorFilter_D         => "0000",
		Run_S                 => '0',
		WaitOnTransferStall_S => '1',
		HasGlobalShutter_S    => '1',
		GlobalShutter_S       => '1',
		StartColumn0_D        => to_unsigned(0, APS_USER_LENGTH_COLUMNS),
		StartRow0_D           => to_unsigned(0, APS_USER_LENGTH_ROWS),
		EndColumn0_D          => to_unsigned(APS_USER_VALUE_COLUMNS - 1, APS_USER_LENGTH_COLUMNS),
		EndRow0_D             => to_unsigned(APS_USER_VALUE_ROWS - 1, APS_USER_LENGTH_ROWS),
		Exposure_D            => to_unsigned(integer(4000.0 * ADC_CLOCK_FREQ), APS_EXPOSURE_SIZE),
		FrameInterval_D       => to_unsigned(integer(50000.0 * ADC_CLOCK_FREQ), APS_FRAME_INTERVAL_SIZE),
		Transfer_D            => to_unsigned(integer(ADC_CLOCK_FREQ * 25.0), APS_TRANSFERTIME_SIZE),
		RSFDSettle_D          => to_unsigned(integer(ADC_CLOCK_FREQ * 15.0), APS_RSFDSETTLETIME_SIZE),
		GSPDReset_D           => to_unsigned(integer(ADC_CLOCK_FREQ * 15.0), APS_GSPDRESETTIME_SIZE),
		GSResetFall_D         => to_unsigned(integer(ADC_CLOCK_FREQ * 15.0), APS_GSRESETFALLTIME_SIZE),
		GSTXFall_D            => to_unsigned(integer(ADC_CLOCK_FREQ * 15.0), APS_GSTXFALLTIME_SIZE),
		GSFDReset_D           => to_unsigned(integer(ADC_CLOCK_FREQ * 15.0), APS_GSFDRESETTIME_SIZE));
end package D4AAPSADCConfigRecords;
