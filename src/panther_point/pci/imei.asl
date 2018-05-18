			Device (IMEI)
			{
				Name (_ADR, 0x00160000)
#if CONFIG_ACPI_DSM_INJECTION == 1
#if CONFIG_GRAPHICS_IGPU_SUPPORT == 1
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Set IMEI device-id to 0x1C3A for Sandy Bridge CPUs & IGPUs on 7 Series chipsets
					If (((^^IGPU.DID == 0x0102) || (^^IGPU.DID == 0x0112)) || ((^^IGPU.DID == 0x0122) | (^^IGPU.DID == 0x010A)))
					{
						Return (Package (0x02)
						{
							"device-id",
							Buffer (0x04) { 0x3A, 0x1C, Zero, Zero }
						})
					}

					Return (Package (Zero) {})
				}
#endif // CONFIG_GRAPHICS_IGPU_SUPPORT
#endif // CONFIG_ACPI_DSM_INJECTION
			}
