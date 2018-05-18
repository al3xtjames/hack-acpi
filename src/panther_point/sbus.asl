			Device (SBUS)
			{
				Name (_ADR, 0x001F0003)  // _ADR: Address
#if CONFIG_ACPI_IMAC_DEVICES == 1
				Device (BUS0)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Name (_CID, "smbus")  // _CID: Compatible ID
					Device (BLC0)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Name (_CID, "smbus-blc")  // _CID: Compatible ID
						Name (_STA, 0x0F)  // _STA: Status
#if CONFIG_ACPI_DSM_INJECTION == 1
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (!Arg2)
							{
								Return (Buffer (One) { 0x03 })
							}

							Return (Package (0x08)
							{
								"address", 0x2C,
								"command", Zero,
								"refnum", Zero,
								"type", 0x49324300
							})
						}
#endif // CONFIG_ACPI_DSM_INJECTION
					}
				}

				Device (BUS1)
				{
					Name (_ADR, One)  // _ADR: Address
					Name (_CID, "smbus")  // _CID: Compatible ID
				}
#endif // CONFIG_ACPI_IMAC_DEVICES
			}
