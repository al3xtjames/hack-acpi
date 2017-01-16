			Device (SBUS)
			{
				Name (_ADR, 0x001F0003)	// _ADR: Address
				Device (BUS0)
				{
					Name (_ADR, Zero) // _ADR: Address
					Name (_CID, "smbus") // _CID: Compatible ID
				}

				Device (BUS1)
				{
					Name (_ADR, One) // _ADR: Address
					Name (_CID, "smbus") // _CID: Compatible ID
				}
			}
