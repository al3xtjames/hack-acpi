			Device (PEG0)
			{
				Name (_ADR, 0x00010000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
				{
					Package (0x04) { 0xFFFF, Zero, Zero, 0x10 },
					Package (0x04) { 0xFFFF,  One, Zero, 0x11 },
					Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 },
					Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
				})

				Device (GFX0)  // Optional, for PCIe GPU
				{
					Name (_ADR, Zero)  // _ADR: Address
					Alias (PW94, _PRW)  // _PRW: Power Resources for Wake
					OperationRegion (PEGH, PCI_Config, Zero, 0x40)
					Field (PEGH, ByteAcc, NoLock, Preserve)
					{
						VID,	16,
						DID,	16
					}

#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package (0x12)
						{
							"AAPL,boot-display",
							Buffer (Zero) {},
							"AAPL,slot-name",
							Buffer (0x07) { "Slot-1" },
							"@0,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@1,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@2,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@3,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@4,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@5,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"hda-gfx",
							Buffer (0x0A) { "onboard-1" }
						})
					}
#endif
				}

				Device (HDAU)  // Optional, HDMI audio for PCIe GPU
				{
					Name (_ADR, One)  // _ADR: Address
#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package (0x02)
						{
							"hda-gfx",
							Buffer (0x0A) { "onboard-1" }
						})
					}
#endif
				}
			}

#if CONFIG_GRAPHICS_PCIE_SUPPORT == 2
			Device (PEG1)
			{
				Name (_ADR, 0x00010001)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
				{
					Package (0x04) { 0xFFFF, Zero, Zero, 0x11 },
					Package (0x04) { 0xFFFF,  One, Zero, 0x12 },
					Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 },
					Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
				})

				Device (GFX1)  // Optional, for PCIe GPU
				{
					Name (_ADR, Zero)  // _ADR: Address
					Alias (PW94, _PRW)  // _PRW: Power Resources for Wake
					OperationRegion (PEGH, PCI_Config, Zero, 0x40)
					Field (PEGH, ByteAcc, NoLock, Preserve)
					{
						VID,	16,
						DID,	16
					}

#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package (0x12)
						{
							"AAPL,boot-display",
							Buffer (Zero) {},
							"AAPL,slot-name",
							Buffer (0x07) { "Slot-2" },
							"@0,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@1,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@2,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@3,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@4,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"@5,connector-type",
							Buffer (0x04) { 0x00, 0x08, Zero, Zero },
							"hda-gfx",
							Buffer (0x0A) { "onboard-2" }
						})
					}
#endif
				}

				Device (HDAU)  // Optional, HDMI audio for PCIe GPU
				{
					Name (_ADR, One)  // _ADR: Address
#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package (0x02)
						{
							"hda-gfx",
							Buffer (0x0A) { "onboard-2" }
						})
					}
#endif
				}
			}
#endif
