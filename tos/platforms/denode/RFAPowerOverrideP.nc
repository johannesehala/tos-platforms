module RFAPowerOverrideP {
	provides interface McuPowerOverride;
}
implementation {

	#warning "RFA1 sleep state fix"

	/**
	 * Check RFA1 radio state, 0 is off and 0x1F is sleep.
	 */
	async command mcu_power_t McuPowerOverride.lowestState() {
		uint8_t status = TRX_STATUS & 0x1F;
		if((status == 0) || (status == 0x1F))
		{
			return ATM128_POWER_DOWN;
		}
        else
        {
        	return ATM128_POWER_IDLE;
        }
	}

}
