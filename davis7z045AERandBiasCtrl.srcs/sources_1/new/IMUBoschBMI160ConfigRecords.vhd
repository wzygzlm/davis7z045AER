library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package IMUBoschBMI160ConfigRecords is
	constant IMU_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(3, 7);

	constant IMU_TYPE : unsigned(2 downto 0) := to_unsigned(3, 3);

	type tIMUConfigParamAddresses is record
		IMUType_D         : unsigned(7 downto 0);
		OrientationInfo_D : unsigned(7 downto 0);
		RunAccel_S        : unsigned(7 downto 0);
		RunGyro_S         : unsigned(7 downto 0);
		RunTemp_S         : unsigned(7 downto 0);
		AccelDataRate_D   : unsigned(7 downto 0);
		AccelFilter_D     : unsigned(7 downto 0);
		AccelRange_D      : unsigned(7 downto 0);
		GyroDataRate_D    : unsigned(7 downto 0);
		GyroFilter_D      : unsigned(7 downto 0);
		GyroRange_D       : unsigned(7 downto 0);
	end record tIMUConfigParamAddresses;

	constant IMU_CONFIG_PARAM_ADDRESSES : tIMUConfigParamAddresses := (
		IMUType_D         => to_unsigned(0, 8),
		OrientationInfo_D => to_unsigned(1, 8),
		RunAccel_S        => to_unsigned(2, 8),
		RunGyro_S         => to_unsigned(3, 8),
		RunTemp_S         => to_unsigned(4, 8),
		AccelDataRate_D   => to_unsigned(5, 8),
		AccelFilter_D     => to_unsigned(6, 8),
		AccelRange_D      => to_unsigned(7, 8),
		GyroDataRate_D    => to_unsigned(8, 8),
		GyroFilter_D      => to_unsigned(9, 8),
		GyroRange_D       => to_unsigned(10, 8));

	type tIMUConfig is record
		IMUType_D         : unsigned(2 downto 0);
		OrientationInfo_D : std_logic_vector(2 downto 0);
		RunAccel_S        : std_logic;
		RunGyro_S         : std_logic;
		RunTemp_S         : std_logic;
		AccelDataRate_D   : unsigned(2 downto 0); -- 8 choices, from 5 to 12, so add 5.
		AccelFilter_D     : unsigned(1 downto 0); -- 3 choices: 0: OSR4, 1: OSR2, 2: Normal. Add 0 in front of register.
		AccelRange_D      : unsigned(1 downto 0); -- 4 choices: 0: +- 2g, 1: +- 4g, 2: +- 8g, 3: +- 16g.
		GyroDataRate_D    : unsigned(2 downto 0); -- 8 choices, from 6 to 13, so add 6.
		GyroFilter_D      : unsigned(1 downto 0); -- 3 choices: 0: OSR4, 1: OSR2, 2: Normal.
		GyroRange_D       : unsigned(2 downto 0); -- 5 choices, from 0 to 4.
	end record tIMUConfig;

	constant tIMUConfigDefault : tIMUConfig := (
		IMUType_D         => IMU_TYPE,
		OrientationInfo_D => "000",
		RunAccel_S        => '0',
		RunGyro_S         => '0',
		RunTemp_S         => '0',
		AccelDataRate_D   => to_unsigned(6, tIMUConfig.AccelDataRate_D'length), -- 6, plus 5, is 11 = 800 Hz.
		AccelFilter_D     => to_unsigned(2, tIMUConfig.AccelFilter_D'length), -- Normal mode.
		AccelRange_D      => to_unsigned(0, tIMUConfig.AccelRange_D'length), -- +- 2g.
		GyroDataRate_D    => to_unsigned(5, tIMUConfig.GyroDataRate_D'length), -- 5, plus 6, is 11 = 800 Hz.
		GyroFilter_D      => to_unsigned(2, tIMUConfig.GyroFilter_D'length), -- Normal mode.
		GyroRange_D       => to_unsigned(4, tIMUConfig.GyroRange_D'length)); -- +- 125°/s.

	type tSPIRegisterAddresses is record
		Command         : unsigned(6 downto 0);
		GyroData        : unsigned(6 downto 0);
		AccelData       : unsigned(6 downto 0);
		TempData        : unsigned(6 downto 0);
		FastCalibration : unsigned(6 downto 0);
		InterruptMap    : unsigned(6 downto 0);
		InterruptLatch  : unsigned(6 downto 0);
		InterruptOutput : unsigned(6 downto 0);
		InterruptEnable : unsigned(6 downto 0);
		GyroConfig      : unsigned(6 downto 0);
		GyroRange       : unsigned(6 downto 0);
		AccelConfig     : unsigned(6 downto 0);
		AccelRange      : unsigned(6 downto 0);
	end record tSPIRegisterAddresses;

	constant SPI_REGISTER_ADDRESSES : tSPIRegisterAddresses := (
		Command         => to_unsigned(126, 7),
		GyroData        => to_unsigned(12, 7),
		AccelData       => to_unsigned(18, 7),
		TempData        => to_unsigned(32, 7),
		FastCalibration => to_unsigned(105, 7),
		InterruptMap    => to_unsigned(86, 7),
		InterruptLatch  => to_unsigned(84, 7),
		InterruptOutput => to_unsigned(83, 7),
		InterruptEnable => to_unsigned(81, 7),
		GyroConfig      => to_unsigned(66, 7),
		GyroRange       => to_unsigned(67, 7),
		AccelConfig     => to_unsigned(64, 7),
		AccelRange      => to_unsigned(65, 7));

	type tSPICommands is record
		StartFastCalibration : unsigned(7 downto 0);
		AccelPowerModeOn     : unsigned(7 downto 0);
		AccelPowerModeOff    : unsigned(7 downto 0);
		AccelPowerMode       : unsigned(6 downto 0);
		GyroPowerModeOn      : unsigned(7 downto 0);
		GyroPowerModeOff     : unsigned(7 downto 0);
		GyroPowerMode        : unsigned(6 downto 0);
	end record tSPICommands;

	constant SPI_COMMANDS : tSPICommands := (
		StartFastCalibration => to_unsigned(3, 8),
		AccelPowerModeOn     => to_unsigned(17, 8),
		AccelPowerModeOff    => to_unsigned(16, 8),
		AccelPowerMode       => to_unsigned(16, 7),
		GyroPowerModeOn      => to_unsigned(21, 8),
		GyroPowerModeOff     => to_unsigned(20, 8),
		GyroPowerMode        => to_unsigned(20, 7));
end package IMUBoschBMI160ConfigRecords;
