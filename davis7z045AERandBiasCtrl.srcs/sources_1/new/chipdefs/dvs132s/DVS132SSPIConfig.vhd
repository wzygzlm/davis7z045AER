library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.DVS132SConfigRecords.all;
use work.Settings.CHIP_DVS_SIZE_COLUMNS;
use work.Settings.CHIP_DVS_SIZE_ROWS;
use work.Settings.CHIP_DVS_AXES_INVERT;
use work.Settings.CHIP_DVS_ORIGIN_POINT;

entity DVS132SSPIConfig is
	generic(
		ENABLE_STATISTICS : boolean := false;
		ENABLE_DEBUG      : boolean := false);
	port(
		Clock_CI                    : in  std_logic;
		Reset_RI                    : in  std_logic;

		DVS132SConfig_DO            : out tDVS132SConfig;
		DVS132SConfigInfoOut_DI     : in  tDVS132SConfigInfoOut;

		-- SPI configuration inputs and outputs.
		ConfigModuleAddress_DI      : in  unsigned(6 downto 0);
		ConfigParamAddress_DI       : in  unsigned(7 downto 0);
		ConfigParamInput_DI         : in  std_logic_vector(31 downto 0);
		ConfigLatchInput_SI         : in  std_logic;
		DVS132SConfigParamOutput_DO : out std_logic_vector(31 downto 0));
end entity DVS132SSPIConfig;

architecture Behavioral of DVS132SSPIConfig is
	signal LatchDVS132SReg_S                        : std_logic;
	signal DVS132SOutput_DP, DVS132SOutput_DN       : std_logic_vector(31 downto 0);
	signal DVS132SConfigReg_DP, DVS132SConfigReg_DN : tDVS132SConfig;
begin
	DVS132SConfig_DO            <= DVS132SConfigReg_DP;
	DVS132SConfigParamOutput_DO <= DVS132SOutput_DP;

	LatchDVS132SReg_S <= '1' when (ConfigModuleAddress_DI = DVS_CONFIG_MODULE_ADDRESS) else '0';

	dvsSyncIO : process(ConfigParamAddress_DI, ConfigParamInput_DI, DVS132SConfigReg_DP, DVS132SConfigInfoOut_DI)
	begin
		DVS132SConfigReg_DN <= DVS132SConfigReg_DP;
		DVS132SOutput_DN    <= (others => '0');

		case ConfigParamAddress_DI is
			when DVS_CONFIG_PARAM_ADDRESSES.SizeColumns_D =>
				DVS132SConfigReg_DN.SizeColumns_D                    <= CHIP_DVS_SIZE_COLUMNS;
				DVS132SOutput_DN(tDVS132SConfig.SizeColumns_D'range) <= std_logic_vector(CHIP_DVS_SIZE_COLUMNS);

			when DVS_CONFIG_PARAM_ADDRESSES.SizeRows_D =>
				DVS132SConfigReg_DN.SizeRows_D                    <= CHIP_DVS_SIZE_ROWS;
				DVS132SOutput_DN(tDVS132SConfig.SizeRows_D'range) <= std_logic_vector(CHIP_DVS_SIZE_ROWS);

			when DVS_CONFIG_PARAM_ADDRESSES.OrientationInfo_D =>
				DVS132SConfigReg_DN.OrientationInfo_D                    <= CHIP_DVS_AXES_INVERT & CHIP_DVS_ORIGIN_POINT;
				DVS132SOutput_DN(tDVS132SConfig.OrientationInfo_D'range) <= CHIP_DVS_AXES_INVERT & CHIP_DVS_ORIGIN_POINT;

			when DVS_CONFIG_PARAM_ADDRESSES.Run_S =>
				DVS132SConfigReg_DN.Run_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)       <= DVS132SConfigReg_DP.Run_S;

			when DVS_CONFIG_PARAM_ADDRESSES.WaitOnTransferStall_S =>
				DVS132SConfigReg_DN.WaitOnTransferStall_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)                       <= DVS132SConfigReg_DP.WaitOnTransferStall_S;

			when DVS_CONFIG_PARAM_ADDRESSES.FilterAtLeast2Unsigned_S =>
				DVS132SConfigReg_DN.FilterAtLeast2Unsigned_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)                          <= DVS132SConfigReg_DP.FilterAtLeast2Unsigned_S;

			when DVS_CONFIG_PARAM_ADDRESSES.FilterNotAll4Unsigned_S =>
				DVS132SConfigReg_DN.FilterNotAll4Unsigned_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)                         <= DVS132SConfigReg_DP.FilterNotAll4Unsigned_S;

			when DVS_CONFIG_PARAM_ADDRESSES.FilterAtLeast2Signed_S =>
				DVS132SConfigReg_DN.FilterAtLeast2Signed_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)                        <= DVS132SConfigReg_DP.FilterAtLeast2Signed_S;

			when DVS_CONFIG_PARAM_ADDRESSES.FilterNotAll4Signed_S =>
				DVS132SConfigReg_DN.FilterNotAll4Signed_S <= ConfigParamInput_DI(0);
				DVS132SOutput_DN(0)                       <= DVS132SConfigReg_DP.FilterNotAll4Signed_S;

			when DVS_CONFIG_PARAM_ADDRESSES.RestartTime_D =>
				DVS132SConfigReg_DN.RestartTime_D                    <= unsigned(ConfigParamInput_DI(tDVS132SConfig.RestartTime_D'range));
				DVS132SOutput_DN(tDVS132SConfig.RestartTime_D'range) <= std_logic_vector(DVS132SConfigReg_DP.RestartTime_D);

			when DVS_CONFIG_PARAM_ADDRESSES.CaptureInterval_D =>
				DVS132SConfigReg_DN.CaptureInterval_D                    <= unsigned(ConfigParamInput_DI(tDVS132SConfig.CaptureInterval_D'range));
				DVS132SOutput_DN(tDVS132SConfig.CaptureInterval_D'range) <= std_logic_vector(DVS132SConfigReg_DP.CaptureInterval_D);

			when DVS_CONFIG_PARAM_ADDRESSES.RowEnable31To0_S =>
				DVS132SConfigReg_DN.RowEnable31To0_S                    <= ConfigParamInput_DI(tDVS132SConfig.RowEnable31To0_S'range);
				DVS132SOutput_DN(tDVS132SConfig.RowEnable31To0_S'range) <= DVS132SConfigReg_DP.RowEnable31To0_S;

			when DVS_CONFIG_PARAM_ADDRESSES.RowEnable63To32_S =>
				DVS132SConfigReg_DN.RowEnable63To32_S                    <= ConfigParamInput_DI(tDVS132SConfig.RowEnable63To32_S'range);
				DVS132SOutput_DN(tDVS132SConfig.RowEnable63To32_S'range) <= DVS132SConfigReg_DP.RowEnable63To32_S;

			when DVS_CONFIG_PARAM_ADDRESSES.RowEnable65To64_S =>
				DVS132SConfigReg_DN.RowEnable65To64_S                    <= ConfigParamInput_DI(tDVS132SConfig.RowEnable65To64_S'range);
				DVS132SOutput_DN(tDVS132SConfig.RowEnable65To64_S'range) <= DVS132SConfigReg_DP.RowEnable65To64_S;

			when DVS_CONFIG_PARAM_ADDRESSES.ColumnEnable31To0_S =>
				DVS132SConfigReg_DN.ColumnEnable31To0_S                    <= ConfigParamInput_DI(tDVS132SConfig.ColumnEnable31To0_S'range);
				DVS132SOutput_DN(tDVS132SConfig.ColumnEnable31To0_S'range) <= DVS132SConfigReg_DP.ColumnEnable31To0_S;

			when DVS_CONFIG_PARAM_ADDRESSES.ColumnEnable51To32_S =>
				DVS132SConfigReg_DN.ColumnEnable51To32_S                    <= ConfigParamInput_DI(tDVS132SConfig.ColumnEnable51To32_S'range);
				DVS132SOutput_DN(tDVS132SConfig.ColumnEnable51To32_S'range) <= DVS132SConfigReg_DP.ColumnEnable51To32_S;

			when DVS_CONFIG_PARAM_ADDRESSES.HasStatistics_S =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(0) <= '1';
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.StatisticsTransactionsSuccess64_D =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(TRANSACTION_COUNTER_WIDTH - 1 - 32 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.StatisticsTransactionsSuccess_D(TRANSACTION_COUNTER_WIDTH - 1 downto 32));
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.StatisticsTransactionsSuccess32_D =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(31 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.StatisticsTransactionsSuccess_D(31 downto 0));
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.StatisticsTransactionsSkipped64_D =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(TRANSACTION_COUNTER_WIDTH - 1 - 32 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.StatisticsTransactionsSkipped_D(TRANSACTION_COUNTER_WIDTH - 1 downto 32));
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.StatisticsTransactionsSkipped32_D =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(31 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.StatisticsTransactionsSkipped_D(31 downto 0));
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.StatisticsTransactionsErrored_D =>
				if ENABLE_STATISTICS then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.StatisticsTransactionsErrored_D);
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.DebugErrorTooManyZeroes_D =>
				if ENABLE_STATISTICS and ENABLE_DEBUG then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.DebugErrorTooManyZeroes_D);
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.DebugErrorTooManyOnes_D =>
				if ENABLE_STATISTICS and ENABLE_DEBUG then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.DebugErrorTooManyOnes_D);
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.DebugErrorInvalidAddress_D =>
				if ENABLE_STATISTICS and ENABLE_DEBUG then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.DebugErrorInvalidAddress_D);
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.DebugErrorPolaritiesZero_D =>
				if ENABLE_STATISTICS and ENABLE_DEBUG then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.DebugErrorPolaritiesZero_D);
				end if;

			when DVS_CONFIG_PARAM_ADDRESSES.DebugErrorPolaritiesBoth_D =>
				if ENABLE_STATISTICS and ENABLE_DEBUG then
					DVS132SOutput_DN(DEBUG_COUNTER_WIDTH - 1 downto 0) <= std_logic_vector(DVS132SConfigInfoOut_DI.DebugErrorPolaritiesBoth_D);
				end if;

			when others => null;
		end case;
	end process dvsSyncIO;

	dvsSyncUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then                -- asynchronous reset (active high)
			DVS132SOutput_DP <= (others => '0');

			DVS132SConfigReg_DP <= tDVSConfigDefault;
		elsif rising_edge(Clock_CI) then -- rising clock edge
			DVS132SOutput_DP <= DVS132SOutput_DN;

			if LatchDVS132SReg_S and ConfigLatchInput_SI then
				DVS132SConfigReg_DP <= DVS132SConfigReg_DN;
			end if;
		end if;
	end process dvsSyncUpdate;
end architecture Behavioral;
