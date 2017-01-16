		Device (MEM2) // Optionally, required when the IGPU is enabled in the BIOS
		{
			Name (_HID, EisaId ("PNP0C01"))
			Name (_UID, 0x02)
			Name (_STA, 0x0F)
			Name (_CRS, ResourceTemplate ()
			{
				Memory32Fixed (ReadWrite, 0x20000000, 0x00200000, )
				Memory32Fixed (ReadWrite, 0x40000000, 0x00200000, )
			})
		}
