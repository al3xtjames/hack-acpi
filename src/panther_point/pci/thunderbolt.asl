				Device (UPSB)
				{
					Name (_ADR, Zero)  // _ADR: Address

#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package (0x02)
						{
							"PCI-Thunderbolt",
							One
						})
					}
#endif // CONFIG_ACPI_DSM_INJECTION

					Name (_RMV, One)  // _RMV: Removal Status

					Device (DSB0)
					{
						Name (_ADR, Zero)  // _ADR: Address
#if CONFIG_ACPI_DSM_INJECTION == 1
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (!Arg2)
							{
								Return (Buffer (One) { 0x03 })
							}

							Return (Package (0x02)
							{
								"PCIHotplugCapable",
								Zero
							})
						}
#endif // CONFIG_ACPI_DSM_INJECTION

						Device (NHI0)
						{
							Name (_ADR, Zero)  // _ADR: Address
#if 0
							Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
							{
								If (!Arg2)
								{
									Return (Buffer (One) { 0x03 })
								}

								Return (Package (0x02)
								{
									"power-save",
									Zero
								})
							}
#endif
						}
					}

					Device (DSB1)
					{
						Name (_ADR, 0x00030000)  // _ADR: Address
					}

					Device (DSB2)
					{
						Name (_ADR, 0x00040000)  // _ADR: Address
					}

					Device (DSB3)
					{
						Name (_ADR, 0x00050000)  // _ADR: Address
					}

					Device (DSB4)
					{
						Name (_ADR, 0x00060000)  // _ADR: Address
					}
				}
