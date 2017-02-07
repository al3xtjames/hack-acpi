			Device (IGPU)
			{
				Name (_ADR, 0x00020000)  // _ADR: Address
				OperationRegion (IGPH, PCI_Config, Zero, 0x40)
				Field (IGPH, ByteAcc, NoLock, Preserve)
				{
					VID,	16,
					DID,	16
				}

#if CONFIG_ACPI_DSM_INJECTION == 1
				Name (IGPP, Package (0x0D)  // IGPU device properties
				{
					0x0112,
					0x0122,
					Zero,
					Package (0x08)
					{
						"AAPL,snb-platform-id",
						Buffer (0x04) { 0x10, 0x00, 0x03, 0x00 },
						"device-id",
						Buffer (0x04) { 0x26, 0x01, 0x00, 0x00 },
						"hda-gfx",
						Buffer (0x0A) { "onboard-1" },
						"model",
						Buffer (0x17) { "Intel HD Graphics 3000" }
					},

					0x010A,
					Zero,
					Package (0x08)
					{
						"AAPL,snb-platform-id",
						Buffer (0x04) { 0x10, 0x00, 0x03, 0x00 },
						"device-id",
						Buffer (0x04) { 0x26, 0x01, 0x00, 0x00 },
						"hda-gfx",
						Buffer (0x0A) { "onboard-1" },
						"model",
						Buffer (0x18) { "Intel HD Graphics P3000" }
					},

					0x0162,
					Zero,
					Package (0x04)
					{
						"AAPL,ig-platform-id",
						Buffer (0x04) { 0x05, 0x00, 0x62, 0x01 },
						"hda-gfx",
						Buffer (0x0A) { "onboard-1" }
					},

					0x016A,
					Zero,
					Package (0x08)
					{
						"AAPL,ig-platform-id",
						Buffer (0x04) { 0x05, 0x00, 0x62, 0x01 },
						"device-id",
						Buffer (0x04) { 0x62, 0x01, 0x00, 0x00 },
						"hda-gfx",
						Buffer (0x0A) { "onboard-1" },
						"model",
						Buffer (0x18) { "Intel HD Graphics P4000" }
					}
				})

				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Return proper IGPU device properties (based off device ID)
					Local1 = Match (IGPP, MEQ, DID, MTR, Zero, Zero)
					If (Ones != Local1)
					{
						Local1 = Match (IGPP, MEQ, Zero, MTR, Zero, (Local1 + One))
						Return (DerefOf (IGPP [(Local1 + One)]))
					}

					Return (Package (Zero) {})
				}
#endif
			}
