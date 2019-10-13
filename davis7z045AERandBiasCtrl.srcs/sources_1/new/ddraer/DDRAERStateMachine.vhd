library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountUpToN;
use work.FIFORecords.all;
use work.DDRAERConfigRecords.all;

entity DDRAERStatemachine is
	generic(
		DATA_WIDTH : integer;
		REQ_DELAY  : integer := 1;
		ACK_DELAY  : integer := 1);
	port(
		Clock_CI         : in  std_logic;
		Reset_RI         : in  std_logic;

		-- AER Reqest and Acknowledge.
		AEROutAck_SBI    : in  std_logic;
		AEROutReq_SBO    : out std_logic;
		AEROutData_DO    : out std_logic_vector(DATA_WIDTH - 1 downto 0);

		-- Input FIFO (from Multiplexer)
		InFifoControl_SI : in  tFromFifoReadSide;
		InFifoControl_SO : out tToFifoReadSide;
		InFifoData_DI    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);

		-- Configuration input
		DDRAERConfig_DI  : in  tDDRAERConfig);
end DDRAERStatemachine;

architecture Behavioral of DDRAERStatemachine is
	attribute syn_enum_encoding : string;

	type tState is (stIdle, stDataGet1, stDelayReq1, stAck1, stDataGet2, stDelayReq2, stAck2);
	attribute syn_enum_encoding of tState : type is "onehot";

	signal State_DP, State_DN : tState;

	-- Register outputs.
	signal AEROutReqReg_SB       : std_logic;
	signal AEROutDataRegEnable_S : std_logic;

	-- Delay counters control.
	constant REQ_DELAY_COUNTER_SIZE : integer := SizeCountUpToN(REQ_DELAY);
	constant ACK_DELAY_COUNTER_SIZE : integer := SizeCountUpToN(ACK_DELAY);

	signal ReqDelayCount_S, ReqDelayDone_S : std_logic;
	signal AckDelayCount_S, AckDelayDone_S : std_logic;

	-- Register configuration.
	signal DDRAERConfigReg_D : tDDRAERConfig;
begin
	reqDelayCounter : entity work.ContinuousCounter
		generic map(
			SIZE => REQ_DELAY_COUNTER_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => ReqDelayCount_S,
			DataLimit_DI => to_unsigned(REQ_DELAY, REQ_DELAY_COUNTER_SIZE),
			Overflow_SO  => ReqDelayDone_S,
			Data_DO      => open);

	ackDelayCounter : entity work.ContinuousCounter
		generic map(
			SIZE => ACK_DELAY_COUNTER_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => AckDelayCount_S,
			DataLimit_DI => to_unsigned(ACK_DELAY, ACK_DELAY_COUNTER_SIZE),
			Overflow_SO  => AckDelayDone_S,
			Data_DO      => open);

	ddrAerOutputComb : process(State_DP, InFifoControl_SI, AEROutAck_SBI, DDRAERConfigReg_D, AckDelayDone_S, ReqDelayDone_S)
	begin
		State_DN <= State_DP;           -- Keep state by default.

		InFifoControl_SO.Read_S <= '0';

		AEROutDataRegEnable_S <= '0';
		AEROutReqReg_SB       <= '1';

		ReqDelayCount_S <= '0';
		AckDelayCount_S <= '0';

		case State_DP is
			when stIdle =>
				if DDRAERConfigReg_D.Run_S then
					if not InFifoControl_SI.AlmostEmpty_S then
						-- Our FIFOs are slightly special, when they notify
						-- non-emptiness, it means that on the next clock cycle the
						-- next piece of data will be available, regardless of the
						-- state of the READ signal. That piece of data will then
						-- continue to be driven out, until the READ signal is
						-- asserted, which will then start the a process such that
						-- on the next cycle, either the EMPTY flag is asserted if
						-- no more data is available, or the next piece of data
						-- will be driven out starting from the next-next cycle.
						State_DN <= stDataGet1;
					end if;
				else
					-- If not running, just drain the FIFO.
					InFifoControl_SO.Read_S <= not InFifoControl_SI.Empty_S;
				end if;

			when stDataGet1 =>
				-- We know the FIFO value is good (not empty), so we drive it out,
				-- and tell the FIFO to advance to its next value.
				InFifoControl_SO.Read_S <= '1';

				AEROutDataRegEnable_S <= '1';

				State_DN <= stDelayReq1;

			when stDelayReq1 =>
				if ReqDelayDone_S then
					AEROutReqReg_SB <= '0';

					State_DN <= stAck1;
				end if;

				ReqDelayCount_S <= '1';

			when stAck1 =>
				AEROutReqReg_SB <= '0';

				if DDRAERConfigReg_D.Run_S then
					if not AEROutAck_SBI then
						if AckDelayDone_S then
							State_DN <= stDataGet2;
						end if;

						AckDelayCount_S <= '1';
					end if;
				else
					-- Fall back to idle if not running.
					State_DN <= stIdle;
				end if;

			when stDataGet2 =>
				AEROutReqReg_SB <= '0';

				-- We know the FIFO value is good (not empty), so we drive it out,
				-- and tell the FIFO to advance to its next value.			
				InFifoControl_SO.Read_S <= '1';

				AEROutDataRegEnable_S <= '1';

				State_DN <= stDelayReq2;

			when stDelayReq2 =>
				AEROutReqReg_SB <= '0';

				if ReqDelayDone_S then
					AEROutReqReg_SB <= '1';

					State_DN <= stAck2;
				end if;

				ReqDelayCount_S <= '1';

			when stAck2 =>
				if DDRAERConfigReg_D.Run_S then
					if AEROutAck_SBI then
						if AckDelayDone_S then
							State_DN <= stIdle;
						end if;

						AckDelayCount_S <= '1';
					end if;
				else
					-- Fall back to idle if not running.
					State_DN <= stIdle;
				end if;

			when others => null;
		end case;
	end process ddrAerOutputComb;

	ddrAerOutputReg : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI then                -- asynchronous reset (active high)
			State_DP <= stIdle;

			AEROutReq_SBO <= '1';

			DDRAERConfigReg_D <= tDDRAERConfigDefault;
		elsif rising_edge(Clock_CI) then -- rising clock edge
			State_DP <= State_DN;

			AEROutReq_SBO <= AEROutReqReg_SB;

			DDRAERConfigReg_D <= DDRAERConfig_DI;
		end if;
	end process ddrAerOutputReg;

	ddrAerDataReg : entity work.SimpleRegister
		generic map(
			SIZE => DATA_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => AEROutDataRegEnable_S,
			Input_SI  => InFifoData_DI,
			Output_SO => AEROutData_DO);
end architecture Behavioral;
