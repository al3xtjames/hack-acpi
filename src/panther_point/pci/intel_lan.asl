			Device (CONFIG_CHIPSET_INTEL_LAN_DEVICE)
			{
				Name (_ADR, 0x00190000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
#if CONFIG_ACPI_DSM_INJECTION == 1
#ifdef CONFIG_CHIPSET_INTEL_LAN_DSM_LOCATION
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					Return (Package (0x02)
					{
						"location",
						Buffer (0x02) { CONFIG_CHIPSET_INTEL_LAN_DSM_LOCATION }
					})
				}
#endif
#endif
			}
