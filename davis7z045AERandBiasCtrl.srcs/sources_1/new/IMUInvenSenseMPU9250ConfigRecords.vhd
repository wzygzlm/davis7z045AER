library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package IMUInvenSenseMPU9250ConfigRecords is
	constant IMU_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(3, 7);

	constant IMU_TYPE : unsigned(2 downto 0) := to_unsigned(2, 3);

	type tIMUConfigParamAddresses is record
		IMUType_D           : unsigned(7 downto 0);
		OrientationInfo_D   : unsigned(7 downto 0);
		RunAccel_S          : unsigned(7 downto 0);
		RunGyro_S           : unsigned(7 downto 0);
		RunTemp_S           : unsigned(7 downto 0);
		SampleRateDivider_D : unsigned(7 downto 0);
		AccelDLPF_D         : unsigned(7 downto 0);
		AccelFullScale_D    : unsigned(7 downto 0);
		GyroDLPF_D          : unsigned(7 downto 0);
		GyroFullScale_D     : unsigned(7 downto 0);
	end record tIMUConfigParamAddresses;

	constant IMU_CONFIG_PARAM_ADDRESSES : tIMUConfigParamAddresses := (
		IMUType_D           => to_unsigned(0, 8),
		OrientationInfo_D   => to_unsigned(1, 8),
		RunAccel_S          => to_unsigned(2, 8),
		RunGyro_S           => to_unsigned(3, 8),
		RunTemp_S           => to_unsigned(4, 8),
		SampleRateDivider_D => to_unsigned(5, 8),
		AccelDLPF_D         => to_unsigned(6, 8),
		AccelFullScale_D    => to_unsigned(7, 8),
		GyroDLPF_D          => to_unsigned(9, 8),
		GyroFullScale_D     => to_unsigned(10, 8));

	type tIMUConfig is record
		IMUType_D           : unsigned(2 downto 0);
		OrientationInfo_D   : std_logic_vector(2 downto 0);
		RunAccel_S          : std_logic;
		RunGyro_S           : std_logic;
		RunTemp_S           : std_logic;
		SampleRateDivider_D : unsigned(7 downto 0);
		AccelDLPF_D         : unsigned(2 downto 0);
		AccelFullScale_D    : unsigned(1 downto 0);
		GyroDLPF_D          : unsigned(2 downto 0);
		GyroFullScale_D     : unsigned(1 downto 0);
	end record tIMUConfig;

	constant tIMUConfigDefault : tIMUConfig := (
		IMUType_D           => IMU_TYPE,
		OrientationInfo_D   => "000",
		RunAccel_S          => '0',
		RunGyro_S           => '0',
		RunTemp_S           => '0',
		SampleRateDivider_D => to_unsigned(0, tIMUConfig.SampleRateDivider_D'length),
		AccelDLPF_D         => to_unsigned(1, tIMUConfig.AccelDLPF_D'length),
		AccelFullScale_D    => to_unsigned(1, tIMUConfig.AccelFullScale_D'length),
		GyroDLPF_D          => to_unsigned(1, tIMUConfig.GyroDLPF_D'length),
		GyroFullScale_D     => to_unsigned(1, tIMUConfig.GyroFullScale_D'length));

	type tSPIRegisterAddresses is record
		AccelData         : unsigned(6 downto 0);
		TempData          : unsigned(6 downto 0);
		GyroData          : unsigned(6 downto 0);
		UserConfig        : unsigned(6 downto 0);
		PowerManagement1  : unsigned(6 downto 0);
		PowerManagement2  : unsigned(6 downto 0);
		InterruptConfig   : unsigned(6 downto 0);
		InterruptEnable   : unsigned(6 downto 0);
		SampleRateDivider : unsigned(6 downto 0);
		GyroDLPFConfig    : unsigned(6 downto 0);
		GyroConfig        : unsigned(6 downto 0);
		AccelConfig       : unsigned(6 downto 0);
		AccelDLPFConfig   : unsigned(6 downto 0);
	end record tSPIRegisterAddresses;

	constant SPI_REGISTER_ADDRESSES : tSPIRegisterAddresses := (
		AccelData         => to_unsigned(59, 7),
		TempData          => to_unsigned(65, 7),
		GyroData          => to_unsigned(67, 7),
		UserConfig        => to_unsigned(106, 7),
		PowerManagement1  => to_unsigned(107, 7),
		PowerManagement2  => to_unsigned(108, 7),
		InterruptConfig   => to_unsigned(55, 7),
		InterruptEnable   => to_unsigned(56, 7),
		SampleRateDivider => to_unsigned(25, 7),
		GyroDLPFConfig    => to_unsigned(26, 7),
		GyroConfig        => to_unsigned(27, 7),
		AccelConfig       => to_unsigned(28, 7),
		AccelDLPFConfig   => to_unsigned(29, 7));
end package IMUInvenSenseMPU9250ConfigRecords;
