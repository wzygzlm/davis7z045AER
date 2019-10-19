library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package MultiplexerConfigRecords is
	constant MULTIPLEXER_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(0, 7);

	type tMultiplexerConfigParamAddresses is record
		Run_S                         : unsigned(7 downto 0);
		TimestampRun_S                : unsigned(7 downto 0);
		TimestampReset_S              : unsigned(7 downto 0);
		RunChip_S                     : unsigned(7 downto 0);
		DropExtInputOnTransferStall_S : unsigned(7 downto 0);
		DropDVSOnTransferStall_S      : unsigned(7 downto 0);
		HasStatistics_S               : unsigned(7 downto 0);
		StatisticsExtInputDropped64_D : unsigned(7 downto 0);
		StatisticsExtInputDropped32_D : unsigned(7 downto 0);
		StatisticsDVSDropped64_D      : unsigned(7 downto 0);
		StatisticsDVSDropped32_D      : unsigned(7 downto 0);
	end record tMultiplexerConfigParamAddresses;

	constant MULTIPLEXERCONFIG_PARAM_ADDRESSES : tMultiplexerConfigParamAddresses := (
		Run_S                         => to_unsigned(0, 8),
		TimestampRun_S                => to_unsigned(1, 8),
		TimestampReset_S              => to_unsigned(2, 8),
		RunChip_S                     => to_unsigned(3, 8),
		DropExtInputOnTransferStall_S => to_unsigned(4, 8),
		DropDVSOnTransferStall_S      => to_unsigned(5, 8),
		HasStatistics_S               => to_unsigned(80, 8),
		StatisticsExtInputDropped64_D => to_unsigned(81, 8),
		StatisticsExtInputDropped32_D => to_unsigned(82, 8),
		StatisticsDVSDropped64_D      => to_unsigned(83, 8),
		StatisticsDVSDropped32_D      => to_unsigned(84, 8));

	type tMultiplexerConfig is record
		Run_S                         : std_logic;
		TimestampRun_S                : std_logic;
		TimestampReset_S              : std_logic;
		RunChip_S                     : std_logic;
		DropExtInputOnTransferStall_S : std_logic;
		DropDVSOnTransferStall_S      : std_logic;
	end record tMultiplexerConfig;

	constant tMultiplexerConfigDefault : tMultiplexerConfig := (
		Run_S                         => '0',
		TimestampRun_S                => '0',
		TimestampReset_S              => '0',
		RunChip_S                     => '0',
		DropExtInputOnTransferStall_S => '0',
		DropDVSOnTransferStall_S      => '0');

	constant TRANSACTION_COUNTER_WIDTH : integer := 40;

	type tMultiplexerConfigInfoOut is record
		StatisticsExtInputDropped_D : unsigned(TRANSACTION_COUNTER_WIDTH - 1 downto 0);
		StatisticsDVSDropped_D      : unsigned(TRANSACTION_COUNTER_WIDTH - 1 downto 0);
	end record tMultiplexerConfigInfoOut;

	constant tMultiplexerConfigInfoOutDefault : tMultiplexerConfigInfoOut := (
		StatisticsExtInputDropped_D => (others => '0'),
		StatisticsDVSDropped_D      => (others => '0'));
end package MultiplexerConfigRecords;
