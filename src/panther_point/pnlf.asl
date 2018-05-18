		Device (PNLF)
		{
			Name (_ADR, Zero)  // _ADR: Address
			Name (_CID, "backlight")  // _CID: Compatible ID
			Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
			Name (_STA, 0x0B)  // _STA: Status
			Name (_UID, 0x0A)  // _UID: Unique ID
#if CONFIG_ACPI_DSM_INJECTION == 1
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If (!Arg2)
				{
					Return (Buffer (One) { 0x03 })
				}

				Return (Package (0x04)
				{
					"refnum", Zero,
					"type", 0x49324300
				})
			}
#endif // CONFIG_ACPI_DSM_INJECTION
		}
