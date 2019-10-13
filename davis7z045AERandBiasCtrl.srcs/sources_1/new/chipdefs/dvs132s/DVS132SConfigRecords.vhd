library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountUpToN;
use work.Settings.LOGIC_CLOCK_FREQ;
use work.Settings.CHIP_DVS_SIZE_COLUMNS;
use work.Settings.CHIP_DVS_SIZE_ROWS;
use work.Settings.CHIP_DVS_AXES_INVERT;
use work.Settings.CHIP_DVS_ORIGIN_POINT;

package DVS132SConfigRecords is
	constant DVS_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(1, 7);

	constant LOGIC_CLOCK_FREQ_SIZE  : integer := SizeCountUpToN(LOGIC_CLOCK_FREQ);
	constant DVS_RESTART_TIME_WIDTH : integer := 7 + LOGIC_CLOCK_FREQ_SIZE; -- Time unit: cycles, up to ~128 us.
	constant DVS_CAPTURE_TIME_WIDTH : integer := 21 + LOGIC_CLOCK_FREQ_SIZE; -- Time unit: cycles, up to ~2 s.

	constant TRANSACTION_COUNTER_WIDTH : integer := 40;
	constant DEBUG_COUNTER_WIDTH       : integer := 20;

	type tDVS132SConfigParamAddresses is record
		SizeColumns_D                     : unsigned(7 downto 0);
		SizeRows_D                        : unsigned(7 downto 0);
		OrientationInfo_D                 : unsigned(7 downto 0);
		Run_S                             : unsigned(7 downto 0);
		WaitOnTransferStall_S             : unsigned(7 downto 0);
		FilterAtLeast2Unsigned_S          : unsigned(7 downto 0);
		FilterNotAll4Unsigned_S           : unsigned(7 downto 0);
		FilterAtLeast2Signed_S            : unsigned(7 downto 0);
		FilterNotAll4Signed_S             : unsigned(7 downto 0);
		RestartTime_D                     : unsigned(7 downto 0);
		CaptureInterval_D                 : unsigned(7 downto 0);
		RowEnable31To0_S                  : unsigned(7 downto 0);
		RowEnable63To32_S                 : unsigned(7 downto 0);
		RowEnable65To64_S                 : unsigned(7 downto 0);
		ColumnEnable31To0_S               : unsigned(7 downto 0);
		ColumnEnable51To32_S              : unsigned(7 downto 0);
		HasStatistics_S                   : unsigned(7 downto 0);
		StatisticsTransactionsSuccess64_D : unsigned(7 downto 0);
		StatisticsTransactionsSuccess32_D : unsigned(7 downto 0);
		StatisticsTransactionsSkipped64_D : unsigned(7 downto 0);
		StatisticsTransactionsSkipped32_D : unsigned(7 downto 0);
		StatisticsTransactionsErrored_D   : unsigned(7 downto 0);
		DebugErrorTooManyZeroes_D         : unsigned(7 downto 0);
		DebugErrorTooManyOnes_D           : unsigned(7 downto 0);
		DebugErrorInvalidAddress_D        : unsigned(7 downto 0);
		DebugErrorPolaritiesZero_D        : unsigned(7 downto 0);
		DebugErrorPolaritiesBoth_D        : unsigned(7 downto 0);
	end record tDVS132SConfigParamAddresses;

	constant DVS_CONFIG_PARAM_ADDRESSES : tDVS132SConfigParamAddresses := (
		SizeColumns_D                     => to_unsigned(0, 8),
		SizeRows_D                        => to_unsigned(1, 8),
		OrientationInfo_D                 => to_unsigned(2, 8),
		Run_S                             => to_unsigned(3, 8),
		WaitOnTransferStall_S             => to_unsigned(4, 8),
		FilterAtLeast2Unsigned_S          => to_unsigned(5, 8),
		FilterNotAll4Unsigned_S           => to_unsigned(6, 8),
		FilterAtLeast2Signed_S            => to_unsigned(7, 8),
		FilterNotAll4Signed_S             => to_unsigned(8, 8),
		RestartTime_D                     => to_unsigned(9, 8),
		CaptureInterval_D                 => to_unsigned(10, 8),
		RowEnable31To0_S                  => to_unsigned(20, 8),
		RowEnable63To32_S                 => to_unsigned(21, 8),
		RowEnable65To64_S                 => to_unsigned(22, 8),
		ColumnEnable31To0_S               => to_unsigned(50, 8),
		ColumnEnable51To32_S              => to_unsigned(51, 8),
		HasStatistics_S                   => to_unsigned(80, 8),
		StatisticsTransactionsSuccess64_D => to_unsigned(81, 8),
		StatisticsTransactionsSuccess32_D => to_unsigned(82, 8),
		StatisticsTransactionsSkipped64_D => to_unsigned(83, 8),
		StatisticsTransactionsSkipped32_D => to_unsigned(84, 8),
		StatisticsTransactionsErrored_D   => to_unsigned(91, 8),
		DebugErrorTooManyZeroes_D         => to_unsigned(92, 8),
		DebugErrorTooManyOnes_D           => to_unsigned(93, 8),
		DebugErrorInvalidAddress_D        => to_unsigned(94, 8),
		DebugErrorPolaritiesZero_D        => to_unsigned(95, 8),
		DebugErrorPolaritiesBoth_D        => to_unsigned(96, 8));

	type tDVS132SConfig is record
		SizeColumns_D            : unsigned(CHIP_DVS_SIZE_COLUMNS'range);
		SizeRows_D               : unsigned(CHIP_DVS_SIZE_ROWS'range);
		OrientationInfo_D        : std_logic_vector(2 downto 0);
		Run_S                    : std_logic;
		WaitOnTransferStall_S    : std_logic;
		FilterAtLeast2Unsigned_S : std_logic;
		FilterNotAll4Unsigned_S  : std_logic;
		FilterAtLeast2Signed_S   : std_logic;
		FilterNotAll4Signed_S    : std_logic;
		RestartTime_D            : unsigned(DVS_RESTART_TIME_WIDTH - 1 downto 0);
		CaptureInterval_D        : unsigned(DVS_CAPTURE_TIME_WIDTH - 1 downto 0);
		RowEnable31To0_S         : std_logic_vector(31 downto 0);
		RowEnable63To32_S        : std_logic_vector(31 downto 0);
		RowEnable65To64_S        : std_logic_vector(1 downto 0);
		ColumnEnable31To0_S      : std_logic_vector(31 downto 0);
		ColumnEnable51To32_S     : std_logic_vector(19 downto 0);
	end record tDVS132SConfig;

	constant tDVSConfigDefault : tDVS132SConfig := (
		SizeColumns_D            => CHIP_DVS_SIZE_COLUMNS,
		SizeRows_D               => CHIP_DVS_SIZE_ROWS,
		OrientationInfo_D        => CHIP_DVS_AXES_INVERT & CHIP_DVS_ORIGIN_POINT,
		Run_S                    => '0',
		WaitOnTransferStall_S    => '1',
		FilterAtLeast2Unsigned_S => '0',
		FilterNotAll4Unsigned_S  => '0',
		FilterAtLeast2Signed_S   => '0',
		FilterNotAll4Signed_S    => '0',
		RestartTime_D            => to_unsigned(integer(100.0 * LOGIC_CLOCK_FREQ), tDVS132SConfig.RestartTime_D'length),
		CaptureInterval_D        => to_unsigned(integer(500.0 * LOGIC_CLOCK_FREQ), tDVS132SConfig.CaptureInterval_D'length),
		RowEnable31To0_S         => (others => '1'),
		RowEnable63To32_S        => (others => '1'),
		RowEnable65To64_S        => (others => '1'),
		ColumnEnable31To0_S      => (others => '1'),
		ColumnEnable51To32_S     => (others => '1'));

	type tDVS132SConfigInfoOut is record
		StatisticsTransactionsSuccess_D : unsigned(TRANSACTION_COUNTER_WIDTH - 1 downto 0);
		StatisticsTransactionsSkipped_D : unsigned(TRANSACTION_COUNTER_WIDTH - 1 downto 0);
		StatisticsTransactionsErrored_D : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
		DebugErrorTooManyZeroes_D       : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
		DebugErrorTooManyOnes_D         : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
		DebugErrorInvalidAddress_D      : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
		DebugErrorPolaritiesZero_D      : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
		DebugErrorPolaritiesBoth_D      : unsigned(DEBUG_COUNTER_WIDTH - 1 downto 0);
	end record tDVS132SConfigInfoOut;

	constant tDVSConfigInfoOutDefault : tDVS132SConfigInfoOut := (
		StatisticsTransactionsSuccess_D => (others => '0'),
		StatisticsTransactionsSkipped_D => (others => '0'),
		StatisticsTransactionsErrored_D => (others => '0'),
		DebugErrorTooManyZeroes_D       => (others => '0'),
		DebugErrorTooManyOnes_D         => (others => '0'),
		DebugErrorInvalidAddress_D      => (others => '0'),
		DebugErrorPolaritiesZero_D      => (others => '0'),
		DebugErrorPolaritiesBoth_D      => (others => '0'));
end package DVS132SConfigRecords;
