				Device (FWBR)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Alias (PW94, _PRW)  // _PRW: Power Resources for Wake
					Device (FRWR)
					{
						Name (_ADR, CONFIG_PCI_FIREWIRE_ADDRESS)  // _ADR: Address
						Name (_GPE, 0x1A)  // _GPE: General Purpose Events
#if CONFIG_ACPI_DSM_INJECTION == 1
						Method (_DSM, 4, NotSerialized)	// _DSM: Device-Specific Method
						{
							If (!Arg2)
							{
								Return (Buffer (One) { 0x03 })
							}

							Return (Package (0x04)
							{
								"fwports",
								Buffer (0x04) { CONFIG_PCI_FIREWIRE_PORTS, Zero, Zero, Zero },
								"fws0",
								Buffer (0x04) { One, Zero, Zero, Zero }
							})
						}
#endif
					}
				}
