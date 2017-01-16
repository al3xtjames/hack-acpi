			Device (HDEF)
			{
				Name (_ADR, 0x001B0000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
#if CONFIG_ACPI_DSM_INJECTION == 1
#if CONFIG_GRAPHICS_IGPU_SUPPORT == 1
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Enable Intel HDMI audio if IGPU is primary
#if CONFIG_PCI_EXPRESS_GRAPHICS == 2
					If ((^^PEG0.GFX0.VID == 0x8086) && (^^PEG1.GFX1.VID == 0x8086))
#else
					If (^^PEG0.GFX0.VID == 0x8086)
#endif
					{
						Return (Package (0x02)
						{
							"hda-gfx",
							Buffer (0x0A)
							{
								"onboard-1"
							}
						})
					}

					Return (Package (Zero) {})
				}
#endif
#endif
			}
