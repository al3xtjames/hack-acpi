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
#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package ()
						{
							"AAPL,boot-display",
							Buffer (Zero) {},
							"AAPL,slot-name",
#ifdef CONFIG_PCI_PEG0_SLOT_NAME
							Buffer () { CONFIG_PCI_PEG0_SLOT_NAME },
#else
							Buffer (0x07) { "Slot-1" },
#endif
							"hda-gfx",
							Buffer (0x0A) { "onboard-2" }
						})
					}
#endif
				}

				Device (HDAU)  // Optional, HDMI audio for PCIe GPU
				{
					Name (_ADR, One)  // _ADR: Address
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
#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						Return (Package ()
						{
							"AAPL,boot-display",
							Buffer (Zero) {},
							"AAPL,slot-name",
#ifdef CONFIG_PCI_PEG1_SLOT_NAME
							Buffer () { CONFIG_PCI_PEG1_SLOT_NAME },
#else
							Buffer (0x07) { "Slot-2" },
#endif
							"hda-gfx",
							Buffer (0x0A) { "onboard-3" }
						})
					}
#endif
				}

				Device (HDAU)  // Optional, HDMI audio for PCIe GPU
				{
					Name (_ADR, One)  // _ADR: Address
				}
			}
#endif
