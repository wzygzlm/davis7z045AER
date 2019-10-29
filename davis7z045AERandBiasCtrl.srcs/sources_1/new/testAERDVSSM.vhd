----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2019 11:07:13 AM
-- Design Name: 
-- Module Name: testAERDVSSM - Behavioral
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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.EventCodes.all;
use work.Settings.all;
use work.FIFORecords.all;
use work.MultiplexerConfigRecords.all;
use work.DVSAERConfigRecords.all;
use work.APSADCConfigRecords.all;
use work.IMUConfigRecords.all;
use work.ExtInputConfigRecords.all;
use work.ChipBiasConfigRecords.all;
use work.SystemInfoConfigRecords.all;
use work.FX3ConfigRecords.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testAERDVSSM is
	port(
        USBClock_CI                : in    std_logic;
        LogicClk_CI                : in    std_logic;
        ADCClk_CI                  : in    std_logic;
        Reset_RI                   : in    std_logic;
    
        SPISlaveSelect_ABI         : in    std_logic;
        SPIClock_AI                : in    std_logic;
        SPIMOSI_AI                 : in    std_logic;
        SPIMISO_DZO                : out   std_logic;
--        SPIOutputSRegMode_D_Debug : out std_logic_vector(3 - 1 downto 0);
--        SPIInputSRegMode_D_Debug : out std_logic_vector(3 - 1 downto 0);
--        ParamOutput_DP_Debug   : out std_logic_vector(31 downto 0);
--        SPIBitCount_D_Debug : out unsigned(5 downto 0);
--        ReadOperationReg_SP_Debug : out std_logic;  
--        ConfigLatchInput_S_Debug  : out std_logic;
        
		ChipBiasEnable_SO          : out   std_logic;
        ChipBiasDiagSelect_SO      : out   std_logic;
        ChipBiasAddrSelect_SBO     : out   std_logic;
        ChipBiasClock_CBO          : out   std_logic;
        ChipBiasBitIn_DO           : out   std_logic;
        ChipBiasLatch_SBO          : out   std_logic;
        -- ChipBiasBitOut_DI : in std_logic;

        DVSAERData_AI              : in    std_logic_vector(DVS_AER_BUS_WIDTH - 1 downto 0);
        DVSAERReq_ABI              : in    std_logic;
        DVSAERAck_SBO              : out   std_logic;
        DVSAERReset_SBO            : out   std_logic;

		IMUClock_CZO               : out   std_logic;
		IMUData_DZIO               : inout std_logic;
		IMUInterrupt_AI            : in    std_logic;
		IMUFSync_SO                : out   std_logic;

		SyncOutClock_CO            : out   std_logic;
		SyncOutSignal_SO           : out   std_logic;
		SyncInClock_AI             : in    std_logic;
		SyncInSignal_AI            : in    std_logic;
		SyncInSignal1_AI           : in    std_logic;
        SyncInSignal2_AI           : in    std_logic;		        
        
        AERSMFifoAlmostFull_AI     : in    std_logic;
        AERSMFifoFull_AI           : in    std_logic; 
        AERSMOutFifoWrite_SO       : out   std_logic;       
        AERSMOutFifoData_DO        : out   std_logic_vector(FULL_EVENT_WIDTH - 1 downto 0));
end testAERDVSSM;

architecture Behavioral of testAERDVSSM is

	signal USBReset_R   : std_logic;
	signal LogicClock_C : std_logic;
	signal LogicReset_R : std_logic;
	signal ADCClock_C   : std_logic;
	signal ADCReset_R   : std_logic;

	signal USBFifoThr0ReadySync_S, USBFifoThr0WatermarkSync_S, USBFifoThr1ReadySync_S, USBFifoThr1WatermarkSync_S : std_logic;
	signal DVSAERReqSync_SB, IMUInterruptSync_S                                                                   : std_logic;
	signal SyncInClockSync_C, SyncInSignalSync_S, SyncInSignal1Sync_S, SyncInSignal2Sync_S                        : std_logic;
	signal SPISlaveSelectSync_SB, SPIClockSync_C, SPIMOSISync_D                                                   : std_logic;
	signal DeviceIsMaster_S, DeviceIsMasterBuffer_S                                                               : std_logic;

	signal In1Timestamp_S, In2Timestamp_S, In3Timestamp_S, In4Timestamp_S : std_logic;

	signal LogicUSBFifoControlIn_S  : tToFifo;
	signal LogicUSBFifoControlOut_S : tFromFifo;
	signal LogicUSBFifoDataIn_D     : std_logic_vector(FULL_EVENT_WIDTH - 1 downto 0);
	signal LogicUSBFifoDataOut_D    : std_logic_vector(USB_FIFO_WIDTH - 1 downto 0);

	signal DVSAERFifoControlIn_S  : tToFifo;
	signal DVSAERFifoControlOut_S : tFromFifo;
	signal DVSAERFifoDataIn_D     : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal DVSAERFifoDataOut_D    : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	signal APSADCFifoControlIn_S  : tToFifo;
	signal APSADCFifoControlOut_S : tFromFifo;
	signal APSADCFifoDataIn_D     : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal APSADCFifoDataOut_D    : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	signal IMUFifoControlIn_S  : tToFifo;
	signal IMUFifoControlOut_S : tFromFifo;
	signal IMUFifoDataIn_D     : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal IMUFifoDataOut_D    : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	signal ExtInputFifoControlIn_S  : tToFifo;
	signal ExtInputFifoControlOut_S : tFromFifo;
	signal ExtInputFifoDataIn_D     : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal ExtInputFifoDataOut_D    : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	signal ConfigModuleAddress_D : unsigned(6 downto 0);
	signal ConfigParamAddress_D  : unsigned(7 downto 0);
	signal ConfigParamInput_D    : std_logic_vector(31 downto 0);
	signal ConfigLatchInput_S    : std_logic;
	signal ConfigParamOutput_D   : std_logic_vector(31 downto 0);

	signal MultiplexerConfigParamOutput_D : std_logic_vector(31 downto 0);
	signal DVSAERConfigParamOutput_D      : std_logic_vector(31 downto 0);
	signal APSADCConfigParamOutput_D      : std_logic_vector(31 downto 0);
	signal IMUConfigParamOutput_D         : std_logic_vector(31 downto 0);
	signal ExtInputConfigParamOutput_D    : std_logic_vector(31 downto 0);
	signal BiasConfigParamOutput_D        : std_logic_vector(31 downto 0);
	signal ChipConfigParamOutput_D        : std_logic_vector(31 downto 0);
	signal SystemInfoConfigParamOutput_D  : std_logic_vector(31 downto 0);
	signal FX3ConfigParamOutput_D         : std_logic_vector(31 downto 0);

	signal MultiplexerConfig_D, MultiplexerConfigReg_D, MultiplexerConfigReg2_D : tMultiplexerConfig;
	signal DVSAERConfig_D, DVSAERConfigReg_D, DVSAERConfigReg2_D                : tDVSAERConfig;
	signal APSADCConfig_D, APSADCConfigReg_D, APSADCConfigReg2_D                : tAPSADCConfig;
	signal IMUConfig_D, IMUConfigReg_D, IMUConfigReg2_D                         : tIMUConfig;
	signal ExtInputConfig_D, ExtInputConfigReg_D, ExtInputConfigReg2_D          : tExtInputConfig;
	signal FX3Config_D, FX3ConfigReg_D, FX3ConfigReg2_D                         : tFX3Config;

	signal DVSAERConfigInfoOut_D, DVSAERConfigInfoOutReg_D, DVSAERConfigInfoOutReg2_D                : tDVSAERConfigInfoOut;
	signal MultiplexerConfigInfoOut_D, MultiplexerConfigInfoOutReg_D, MultiplexerConfigInfoOutReg2_D : tMultiplexerConfigInfoOut;
	
	
	-- added by Min to adapt it to vivado
	signal DVSAERConfig_DRun_SORAPSADCConfig_DRun_S   : std_logic;
	signal NOTSPISlaveSelectSync_SB                   : std_logic;
	signal DVSAERConfig_DRun_SORAPSADCConfig_DRun_SORMultiplexerConfig_DForceChipBiasEnable_S : std_logic;
	
begin
--    ConfigLatchInput_S_Debug <= ConfigLatchInput_S;
    
    LogicClock_C <= LogicClk_CI;
    logiecResetSync : entity work.ResetSynchronizer
    port map(
        ExtClock_CI  => LogicClock_C,
        ExtReset_RI  => Reset_RI,
        SyncReset_RO => LogicReset_R);
    
	syncInputsToLogicClock : entity work.LogicClockSynchronizer
    port map(
        LogicClock_CI          => LogicClock_C,
        LogicReset_RI          => LogicReset_R,
        SPISlaveSelect_SBI     => SPISlaveSelect_ABI,
        SPISlaveSelectSync_SBO => SPISlaveSelectSync_SB,
        SPIClock_CI            => SPIClock_AI,
        SPIClockSync_CO        => SPIClockSync_C,
        SPIMOSI_DI             => SPIMOSI_AI,
        SPIMOSISync_DO         => SPIMOSISync_D,
        DVSAERReq_SBI          => DVSAERReq_ABI,
        DVSAERReqSync_SBO      => DVSAERReqSync_SB,
        IMUInterrupt_SI        => IMUInterrupt_AI,
        IMUInterruptSync_SO    => IMUInterruptSync_S,
        SyncInClock_CI         => SyncInClock_AI,
        SyncInClockSync_CO     => SyncInClockSync_C,
        SyncInSignal_SI        => SyncInSignal_AI,
        SyncInSignalSync_SO    => SyncInSignalSync_S,
        SyncInSignal1_SI       => SyncInSignal1_AI,
        SyncInSignal1Sync_SO   => SyncInSignal1Sync_S,
        SyncInSignal2_SI       => SyncInSignal2_AI,
        SyncInSignal2Sync_SO   => SyncInSignal2Sync_S);

	-- Instantiate one FIFO to hold all the events coming out of the mixer-producer state machine.
--	normalFIFO : if USB_FIFO_WIDTH = 16 generate
--		logicUSBFifo : entity work.FIFODualClock
--			generic map(
--				DATA_WIDTH        => USB_FIFO_WIDTH,
--				DATA_DEPTH        => USBLOGIC_FIFO_SIZE,
--				ALMOST_EMPTY_FLAG => USBLOGIC_FIFO_ALMOST_EMPTY_SIZE,
--				ALMOST_FULL_FLAG  => USBLOGIC_FIFO_ALMOST_FULL_SIZE)
--			port map(
--				WrClock_CI     => LogicClock_C,
--				WrReset_RI     => LogicReset_R,
--				RdClock_CI     => USBClock_CI,
--				RdReset_RI     => USBReset_R,
--				FifoControl_SI => LogicUSBFifoControlIn_S,
--				FifoControl_SO => LogicUSBFifoControlOut_S,
--				FifoData_DI    => LogicUSBFifoDataIn_D,
--				FifoData_DO    => LogicUSBFifoDataOut_D);
--	end generate normalFIFO;

	-- Always enable chip if it is needed (for DVS or APS or forced).
	DVSAERConfig_DRun_SORAPSADCConfig_DRun_S <= DVSAERConfig_D.Run_S or APSADCConfig_D.Run_S or MultiplexerConfig_D.RunChip_S;
--	DVSAERConfig_DRun_SORAPSADCConfig_DRun_SORMultiplexerConfig_DForceChipBiasEnable_S <= DVSAERConfig_D.Run_S or APSADCConfig_D.Run_S or MultiplexerConfig_D.ForceChipBiasEnable_S;
	chipBiasEnableBuffer : entity work.SimpleRegister
		port map(
			Clock_CI     => LogicClock_C,
			Reset_RI     => LogicReset_R,
			Enable_SI    => '1',
			Input_SI(0)  => DVSAERConfig_DRun_SORAPSADCConfig_DRun_S,
			Output_SO(0) => ChipBiasEnable_SO);
			
	-- In1 is DVS, TS Y addresses. In2 is APS, TS special. In3 is IMU, TS special. In4 is ExtInput, TS all.
	In1Timestamp_S <= '1' when DVSAERFifoDataOut_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) = EVENT_CODE_Y_ADDR else '0';
	In2Timestamp_S <= '1' when APSADCFifoDataOut_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) = EVENT_CODE_SPECIAL else '0';
	In3Timestamp_S <= '1' when IMUFifoDataOut_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) = EVENT_CODE_SPECIAL else '0';
	In4Timestamp_S <= '1';
	
	LogicUSBFifoControlOut_S.WriteSide.AlmostFull_S <= AERSMFifoAlmostFull_AI;
    LogicUSBFifoControlOut_S.WriteSide.Full_S <= AERSMFifoFull_AI; 
    AERSMOutFifoWrite_SO <= LogicUSBFifoControlIn_S.WriteSide.Write_S;
    multiplexerSM : entity work.MultiplexerStateMachine
        generic map(
            ENABLE_STATISTICS => true)
        port map(
            Clock_CI                    => LogicClock_C,
            Reset_RI                    => LogicReset_R,
            SyncInClock_CI              => SyncInClockSync_C,
            SyncOutClock_CO             => SyncOutClock_CO,
            DeviceIsMaster_SO           => DeviceIsMaster_S,
            OutFifoControl_SI           => LogicUSBFifoControlOut_S.WriteSide,
            OutFifoControl_SO           => LogicUSBFifoControlIn_S.WriteSide,
            OutFifoData_DO              => AERSMOutFifoData_DO,
            IMUFifoControl_SI           => (others => '1'),
            IMUFifoControl_SO           => open,
            IMUFifoData_DI              => (others => '0'),
            IMUTimestamp_SI             => '0',
            ExtInputFifoControl_SI      => (others => '1'),
            ExtInputFifoControl_SO      => open,
            ExtInputFifoData_DI         => (others => '0'),
            ExtInputTimestamp_SI        => '0',
            DVSFifoControl_SI           => DVSAERFifoControlOut_S.ReadSide,
            DVSFifoControl_SO           => DVSAERFifoControlIn_S.ReadSide,
            DVSFifoData_DI              => DVSAERFifoDataOut_D,
            DVSTimestamp_SI             => In1Timestamp_S,            
            APSFifoControl_SI           => (others => '1'),
            APSFifoControl_SO           => open,
            APSFifoData_DI              => (others => '0'),
            APSTimestamp_SI             => '0',
            MultiplexerConfig_DI        => MultiplexerConfigReg2_D,
            MultiplexerConfigInfoOut_DO => MultiplexerConfigInfoOutReg2_D);

	multiplexerSPIConfig : entity work.MultiplexerSPIConfig
		generic map(
			ENABLE_STATISTICS => true)
		port map(
			Clock_CI                        => LogicClock_C,
			Reset_RI                        => LogicReset_R,
			MultiplexerConfig_DO            => MultiplexerConfig_D,
			MultiplexerConfigInfoOut_DI     => MultiplexerConfigInfoOut_D,
			ConfigModuleAddress_DI          => ConfigModuleAddress_D,
			ConfigParamAddress_DI           => ConfigParamAddress_D,
			ConfigParamInput_DI             => ConfigParamInput_D,
			ConfigLatchInput_SI             => ConfigLatchInput_S,
			MultiplexerConfigParamOutput_DO => MultiplexerConfigParamOutput_D);

	dvsAerFifo : entity work.FIFO
		generic map(
			DATA_WIDTH        => EVENT_WIDTH,
			DATA_DEPTH        => DVSAER_FIFO_SIZE,
			ALMOST_EMPTY_FLAG => DVSAER_FIFO_ALMOST_EMPTY_SIZE,
			ALMOST_FULL_FLAG  => DVSAER_FIFO_ALMOST_FULL_SIZE)
		port map(
			Clock_CI       => LogicClock_C,
			Reset_RI       => LogicReset_R,
			FifoControl_SI => DVSAERFifoControlIn_S,
			FifoControl_SO => DVSAERFifoControlOut_S,
			FifoData_DI    => DVSAERFifoDataIn_D,
			FifoData_DO    => DVSAERFifoDataOut_D); 
                        
    dvsAerSMTest : entity work.DVSAERStateMachine
    generic map(
        ENABLE_ROI_FILTERING       => true,
        ENABLE_PIXEL_FILTERING     => true,
        ENABLE_BA_REFR_FILTERING   => DVS_BAFILTER_ENABLE,
        BA_FILTER_SUBSAMPLE_COLUMN => DVS_BAFILTER_SUBSAMPLE_COL,
        BA_FILTER_SUBSAMPLE_ROW    => DVS_BAFILTER_SUBSAMPLE_ROW,
        ENABLE_SKIP_FILTERING      => true,
        ENABLE_POLARITY_FILTERING  => true,
        ENABLE_STATISTICS          => true)
    port map(
        Clock_CI               => LogicClk_CI,
        Reset_RI               => LogicReset_R,
        OutFifoControl_SI      => DVSAERFifoControlOut_S.WriteSide,
        OutFifoControl_SO      => DVSAERFifoControlIn_S.WriteSide,
        OutFifoData_DO         => DVSAERFifoDataIn_D,
        DVSAERData_DI          => DVSAERData_AI,
        DVSAERReq_SBI          => DVSAERReq_ABI,
        DVSAERAck_SBO          => DVSAERAck_SBO,
        DVSAERReset_SBO        => DVSAERReset_SBO,
        DVSAERConfig_DI        => DVSAERConfigReg2_D,
        DVSAERConfigInfoOut_DO => DVSAERConfigInfoOutReg2_D);

	dvsaerSPIConfig : entity work.DVSAERSPIConfig
		generic map(
			ENABLE_ROI_FILTERING      => true,
            ENABLE_PIXEL_FILTERING    => true,
            ENABLE_BA_REFR_FILTERING  => DVS_BAFILTER_ENABLE,
            ENABLE_SKIP_FILTERING     => true,
            ENABLE_POLARITY_FILTERING => true,
            ENABLE_STATISTICS         => true)
		port map(
			Clock_CI                   => LogicClock_C,
			Reset_RI                   => LogicReset_R,
			DVSAERConfig_DO            => DVSAERConfig_D,
			DVSAERConfigInfoOut_DI     => DVSAERConfigInfoOut_D,
			ConfigModuleAddress_DI     => ConfigModuleAddress_D,
			ConfigParamAddress_DI      => ConfigParamAddress_D,
			ConfigParamInput_DI        => ConfigParamInput_D,
			ConfigLatchInput_SI        => ConfigLatchInput_S,
			DVSAERConfigParamOutput_DO => DVSAERConfigParamOutput_D);

	deviceIsMasterBuffer : entity work.SimpleRegister
		generic map(
			SIZE => 1)
		port map(
			Clock_CI     => LogicClock_C,
			Reset_RI     => LogicReset_R,
			Enable_SI    => '1',
			Input_SI(0)  => DeviceIsMaster_S,
			Output_SO(0) => DeviceIsMasterBuffer_S);

	systemInfoSPIConfig : entity work.SystemInfoSPIConfig
		generic map(
			CLOCK_LOGIC => LOGIC_CLOCK_FREQ,
			CLOCK_SUPPL => ADC_CLOCK_FREQ,
			CLOCK_COMM  => USB_CLOCK_FREQ)
		port map(
			Clock_CI                       => LogicClock_C,
			Reset_RI                       => LogicReset_R,
			DeviceIsMaster_SI              => DeviceIsMasterBuffer_S,
			ConfigParamAddress_DI          => ConfigParamAddress_D,
			SystemInfoConfigParamOutput_DO => SystemInfoConfigParamOutput_D);

	configRegisters : process(LogicClock_C, LogicReset_R) is
	begin
		if LogicReset_R = '1' then
			MultiplexerConfigReg2_D <= tMultiplexerConfigDefault;
			DVSAERConfigReg2_D      <= tDVSAERConfigDefault;
			APSADCConfigReg2_D      <= tAPSADCConfigDefault;
			IMUConfigReg2_D         <= tIMUConfigDefault;
			ExtInputConfigReg2_D    <= tExtInputConfigDefault;
			FX3ConfigReg2_D         <= tFX3ConfigDefault;

			MultiplexerConfigReg_D <= tMultiplexerConfigDefault;
			DVSAERConfigReg_D      <= tDVSAERConfigDefault;
			APSADCConfigReg_D      <= tAPSADCConfigDefault;
			IMUConfigReg_D         <= tIMUConfigDefault;
			ExtInputConfigReg_D    <= tExtInputConfigDefault;
			FX3ConfigReg_D         <= tFX3ConfigDefault;
		elsif rising_edge(LogicClock_C) then
			MultiplexerConfigReg2_D <= MultiplexerConfigReg_D;
			DVSAERConfigReg2_D      <= DVSAERConfigReg_D;
			APSADCConfigReg2_D      <= APSADCConfigReg_D;
			IMUConfigReg2_D         <= IMUConfigReg_D;
			ExtInputConfigReg2_D    <= ExtInputConfigReg_D;
			FX3ConfigReg2_D         <= FX3ConfigReg_D;

			MultiplexerConfigReg_D <= MultiplexerConfig_D;
			DVSAERConfigReg_D      <= DVSAERConfig_D;
			APSADCConfigReg_D      <= APSADCConfig_D;
			IMUConfigReg_D         <= IMUConfig_D;
			ExtInputConfigReg_D    <= ExtInputConfig_D;
			FX3ConfigReg_D         <= FX3Config_D;
		end if;
	end process configRegisters;

	-- Data flows the other way here!
	configInfoOutRegisters : process(LogicClock_C, LogicReset_R) is
	begin
		if LogicReset_R = '1' then
			MultiplexerConfigInfoOut_D <= tMultiplexerConfigInfoOutDefault;
			DVSAERConfigInfoOut_D      <= tDVSAERConfigInfoOutDefault;

			MultiplexerConfigInfoOutReg_D <= tMultiplexerConfigInfoOutDefault;
			DVSAERConfigInfoOutReg_D      <= tDVSAERConfigInfoOutDefault;
		elsif rising_edge(LogicClock_C) then
			MultiplexerConfigInfoOut_D <= MultiplexerConfigInfoOutReg_D;
			DVSAERConfigInfoOut_D      <= DVSAERConfigInfoOutReg_D;

			MultiplexerConfigInfoOutReg_D <= MultiplexerConfigInfoOutReg2_D;
			DVSAERConfigInfoOutReg_D      <= DVSAERConfigInfoOutReg2_D;
		end if;
	end process configInfoOutRegisters;
	
    spiConfiguration : entity work.SPIConfig
        port map(
            Clock_CI               => LogicClock_C,
            Reset_RI               => LogicReset_R,
            SPISlaveSelect_SBI     => SPISlaveSelectSync_SB,
            SPIClock_CI            => SPIClockSync_C,
            SPIMOSI_DI             => SPIMOSISync_D,
            SPIMISO_DZO            => SPIMISO_DZO,
            ConfigModuleAddress_DO => ConfigModuleAddress_D,
            ConfigParamAddress_DO  => ConfigParamAddress_D,
            ConfigParamInput_DO    => ConfigParamInput_D,
            ConfigLatchInput_SO    => ConfigLatchInput_S,
            ConfigParamOutput_DI   => ConfigParamOutput_D);
    
    spiConfigurationOutputSelect : process(ConfigModuleAddress_D, ConfigParamAddress_D, MultiplexerConfigParamOutput_D, DVSAERConfigParamOutput_D, APSADCConfigParamOutput_D, IMUConfigParamOutput_D, ExtInputConfigParamOutput_D, BiasConfigParamOutput_D, ChipConfigParamOutput_D, SystemInfoConfigParamOutput_D, FX3ConfigParamOutput_D)
    begin
        -- Output side select.
        ConfigParamOutput_D <= (others => '0');

        case ConfigModuleAddress_D is
            when MULTIPLEXER_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= MultiplexerConfigParamOutput_D;

            when DVS_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= DVSAERConfigParamOutput_D;

            when APS_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= APSADCConfigParamOutput_D;

            when IMUCONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= IMUConfigParamOutput_D;

            when EXTINPUT_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= ExtInputConfigParamOutput_D;

            when CHIPBIASCONFIG_MODULE_ADDRESS =>
                if ConfigParamAddress_D(7) = '0' then
                    ConfigParamOutput_D <= BiasConfigParamOutput_D;
                else
                    ConfigParamOutput_D <= ChipConfigParamOutput_D;
                end if;

            when SYSTEM_INFO_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= SystemInfoConfigParamOutput_D;

            when FX3_CONFIG_MODULE_ADDRESS =>
                ConfigParamOutput_D <= FX3ConfigParamOutput_D;

            when others => null;
        end case;
    end process spiConfigurationOutputSelect;
    
	chipBiasSelector : entity work.ChipBiasSelector
        generic map(
            ADD_REGISTERS_FOR_TIMING => 2)
        port map(
            Clock_CI                 => LogicClock_C,
            Reset_RI                 => LogicReset_R,
            ChipBiasDiagSelect_SO    => ChipBiasDiagSelect_SO,
            ChipBiasAddrSelect_SBO   => ChipBiasAddrSelect_SBO,
            ChipBiasClock_CBO        => ChipBiasClock_CBO,
            ChipBiasBitIn_DO         => ChipBiasBitIn_DO,
            ChipBiasLatch_SBO        => ChipBiasLatch_SBO,
            ConfigModuleAddress_DI   => ConfigModuleAddress_D,
            ConfigParamAddress_DI    => ConfigParamAddress_D,
            ConfigParamInput_DI      => ConfigParamInput_D,
            ConfigLatchInput_SI      => ConfigLatchInput_S,
            BiasConfigParamOutput_DO => BiasConfigParamOutput_D,
            ChipConfigParamOutput_DO => ChipConfigParamOutput_D);

end Behavioral;
