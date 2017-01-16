		Device (PWRB)
		{
			Name (_HID, EisaId ("PNP0C0C")) // _HID: Hardware ID
			Name (_UID, 0xAA) // _UID: Unique ID
			Name (_STA, 0x0B) // _STA: Status
			Name (_PRW, Package (0x02) // _PRW: Power Resources for Wake
			{
				0x1D,  0x03
			})
		}

		Device (SLPB)
		{
			Name (_HID, EisaId ("PNP0C0E")) // _HID: Hardware ID
			Name (_STA, 0x0B) // _STA: Status
		}
