library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.APSADCConfigRecords.all;
use work.Settings.CHIP_APS_SIZE_COLUMNS;
use work.Settings.CHIP_APS_SIZE_ROWS;
use work.Settings.CHIP_APS_STREAM_START;
use work.Settings.CHIP_APS_AXES_INVERT;
use work.Settings.CHIP_APS_HAS_GLOBAL_SHUTTER;
use work.Settings.CHIP_APS_HAS_INTEGRATED_ADC;

entity APSADCSPIConfig is
	port(
		Clock_CI                   : in  std_logic;
		Reset_RI                   : in  std_logic;
		APSADCConfig_DO            : out tAPSADCConfig;

		-- SPI configuration inputs and outputs.
		ConfigModuleAddress_DI     : in  unsigned(6 downto 0);
		ConfigParamAddress_DI      : in  unsigned(7 downto 0);
		ConfigParamInput_DI        : in  std_logic_vector(31 downto 0);
		ConfigLatchInput_SI        : in  std_logic;
		APSADCConfigParamOutput_DO : out std_logic_vector(31 downto 0));
end entity APSADCSPIConfig;

architecture Behavioral of APSADCSPIConfig is
	signal LatchAPSADCReg_S                       : std_logic;
	signal APSADCOutput_DP, APSADCOutput_DN       : std_logic_vector(31 downto 0);
	signal APSADCConfigReg_DP, APSADCConfigReg_DN : tAPSADCConfig;
begin
	APSADCConfig_DO            <= APSADCConfigReg_DP;
	APSADCConfigParamOutput_DO <= APSADCOutput_DP;

	LatchAPSADCReg_S <= '1' when (ConfigModuleAddress_DI = APS_CONFIG_MODULE_ADDRESS) else '0';

	apsadcIO : process(ConfigParamAddress_DI, ConfigParamInput_DI, APSADCConfigReg_DP)
	begin
		APSADCConfigReg_DN <= APSADCConfigReg_DP;
		APSADCOutput_DN    <= (others => '0');

		case ConfigParamAddress_DI is
			when APS_CONFIG_PARAM_ADDRESSES.SizeColumns_D =>
				APSADCConfigReg_DN.SizeColumns_D                   <= CHIP_APS_SIZE_COLUMNS;
				APSADCOutput_DN(tAPSADCConfig.SizeColumns_D'range) <= std_logic_vector(CHIP_APS_SIZE_COLUMNS);

			when APS_CONFIG_PARAM_ADDRESSES.SizeRows_D =>
				APSADCConfigReg_DN.SizeRows_D                   <= CHIP_APS_SIZE_ROWS;
				APSADCOutput_DN(tAPSADCConfig.SizeRows_D'range) <= std_logic_vector(CHIP_APS_SIZE_ROWS);

			when APS_CONFIG_PARAM_ADDRESSES.OrientationInfo_D =>
				APSADCConfigReg_DN.OrientationInfo_D                   <= CHIP_APS_AXES_INVERT & CHIP_APS_STREAM_START;
				APSADCOutput_DN(tAPSADCConfig.OrientationInfo_D'range) <= CHIP_APS_AXES_INVERT & CHIP_APS_STREAM_START;

			when APS_CONFIG_PARAM_ADDRESSES.ColorFilter_D =>
				-- Only new chips with internal ADC also have optional color filters.
				if CHIP_APS_HAS_INTEGRATED_ADC then
					APSADCConfigReg_DN.ColorFilter_D                   <= ConfigParamInput_DI(tAPSADCConfig.ColorFilter_D'range);
					APSADCOutput_DN(tAPSADCConfig.ColorFilter_D'range) <= APSADCConfigReg_DP.ColorFilter_D;
				end if;

			when APS_CONFIG_PARAM_ADDRESSES.Run_S =>
				APSADCConfigReg_DN.Run_S <= ConfigParamInput_DI(0);
				APSADCOutput_DN(0)       <= APSADCConfigReg_DP.Run_S;

			when APS_CONFIG_PARAM_ADDRESSES.WaitOnTransferStall_S =>
				APSADCConfigReg_DN.WaitOnTransferStall_S <= ConfigParamInput_DI(0);
				APSADCOutput_DN(0)                       <= APSADCConfigReg_DP.WaitOnTransferStall_S;

			when APS_CONFIG_PARAM_ADDRESSES.HasGlobalShutter_S =>
				if CHIP_APS_HAS_GLOBAL_SHUTTER then
					APSADCConfigReg_DN.HasGlobalShutter_S <= CHIP_APS_HAS_GLOBAL_SHUTTER;
					APSADCOutput_DN(0)                    <= CHIP_APS_HAS_GLOBAL_SHUTTER;
				end if;

			when APS_CONFIG_PARAM_ADDRESSES.GlobalShutter_S =>
				-- Allow read/write of parameter only on chips which support it.
				if CHIP_APS_HAS_GLOBAL_SHUTTER then
					APSADCConfigReg_DN.GlobalShutter_S <= ConfigParamInput_DI(0);
					APSADCOutput_DN(0)                 <= APSADCConfigReg_DP.GlobalShutter_S;
				end if;

			when APS_CONFIG_PARAM_ADDRESSES.StartColumn0_D =>
				APSADCConfigReg_DN.StartColumn0_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.StartColumn0_D'range));
				APSADCOutput_DN(tAPSADCConfig.StartColumn0_D'range) <= std_logic_vector(APSADCConfigReg_DP.StartColumn0_D);

			when APS_CONFIG_PARAM_ADDRESSES.StartRow0_D =>
				APSADCConfigReg_DN.StartRow0_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.StartRow0_D'range));
				APSADCOutput_DN(tAPSADCConfig.StartRow0_D'range) <= std_logic_vector(APSADCConfigReg_DP.StartRow0_D);

			when APS_CONFIG_PARAM_ADDRESSES.EndColumn0_D =>
				APSADCConfigReg_DN.EndColumn0_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.EndColumn0_D'range));
				APSADCOutput_DN(tAPSADCConfig.EndColumn0_D'range) <= std_logic_vector(APSADCConfigReg_DP.EndColumn0_D);

			when APS_CONFIG_PARAM_ADDRESSES.EndRow0_D =>
				APSADCConfigReg_DN.EndRow0_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.EndRow0_D'range));
				APSADCOutput_DN(tAPSADCConfig.EndRow0_D'range) <= std_logic_vector(APSADCConfigReg_DP.EndRow0_D);

			when APS_CONFIG_PARAM_ADDRESSES.Exposure_D =>
				APSADCConfigReg_DN.Exposure_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.Exposure_D'range));
				APSADCOutput_DN(tAPSADCConfig.Exposure_D'range) <= std_logic_vector(APSADCConfigReg_DP.Exposure_D);

			when APS_CONFIG_PARAM_ADDRESSES.FrameInterval_D =>
				APSADCConfigReg_DN.FrameInterval_D                   <= unsigned(ConfigParamInput_DI(tAPSADCConfig.FrameInterval_D'range));
				APSADCOutput_DN(tAPSADCConfig.FrameInterval_D'range) <= std_logic_vector(APSADCConfigReg_DP.FrameInterval_D);

			when others => null;
		end case;
	end process apsadcIO;

	apsadcUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then                -- asynchronous reset (active high)
			APSADCOutput_DP <= (others => '0');

			APSADCConfigReg_DP <= tAPSADCConfigDefault;
		elsif rising_edge(Clock_CI) then -- rising clock edge
			APSADCOutput_DP <= APSADCOutput_DN;

			if LatchAPSADCReg_S and ConfigLatchInput_SI then
				APSADCConfigReg_DP <= APSADCConfigReg_DN;
			end if;
		end if;
	end process apsadcUpdate;
end architecture Behavioral;
