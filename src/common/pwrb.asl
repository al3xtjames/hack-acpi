		Device (PWRB)
		{
			Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
		}

		Device (SLPB)
		{
			Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
			Name (_STA, 0x0B)  // _STA: Status
		}
