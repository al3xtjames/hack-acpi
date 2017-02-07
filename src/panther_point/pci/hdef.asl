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

					// Enable Intel HDMI audio
					Return (Package (0x02)
					{
						"hda-gfx",
						Buffer (0x0A)
						{
							"onboard-1"
						}
					})
				}
#endif
#endif
			}
