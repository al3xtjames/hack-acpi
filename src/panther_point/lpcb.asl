			Device (LPCB)
			{
				Name (_ADR, 0x001F0000)  // _ADR: Address
				OperationRegion (SMIE, SystemIO, PMBS, 0x04)
				Field (SMIE, ByteAcc, NoLock, Preserve)
				{
						,	10,
					RTCS,	1
				}

				OperationRegion (SLPR, SystemIO, SMCR, 0x08)
				Field (SLPR, ByteAcc, NoLock, Preserve)
				{
						,	4,
					SLPE,	1,
						,	31,
					SLPX,	1
				}

				Method (SPTS, 0, NotSerialized)
				{
					SLPX = One
					SLPE = One
				}

				Method (SWAK, 0, NotSerialized)
				{
					SLPE = Zero
					If (!RTCS)
					{
						Notify (PWRB, 0x02)
					}
				}

#if CONFIG_ACPI_IMAC_DEVICES == 1
				Device (ALS0)
				{
					Name (_CID, "smc-als")  // _CID: Compatible ID
					Name (_HID, "ACPI0008")  // _HID: Hardware ID
					Name (_STA, 0x0F)  // _STA: Status
				}
#endif

				Device (DMAC)
				{
					Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						IO (Decode16, 0x0000, 0x0000, 0x01, 0x20, )
						IO (Decode16, 0x0081, 0x0081, 0x01, 0x11, )
						IO (Decode16, 0x0093, 0x0093, 0x01, 0x0D, )
						IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20, )
						DMA (Compatibility, NotBusMaster, Transfer8_16, )
							{4}
					})
				}

				Device (EC)
				{
					Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
					Name (_UID, Zero)  // _UID: Unique ID
				}

				Device (FWHD)
				{
					Name (_HID, EisaId ("INT0800"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						Memory32Fixed (ReadOnly, 0xFF000000, 0x01000000, )
					})
				}

				Device (HPET)
				{
					Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
					Name (_UID, Zero)  // _UID: Unique ID
					Name (_STA, 0x0F)
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						Memory32Fixed (ReadWrite, 0xFED00000, 0x00000400 )
						IRQNoFlags ()
							{0}
						IRQNoFlags ()
							{8}
					})
				}

				Device (IPIC)
				{
					Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						IO (Decode16, 0x0020, 0x0020, 0x01, 0x02, )
						IO (Decode16, 0x0024, 0x0024, 0x01, 0x02, )
						IO (Decode16, 0x0028, 0x0028, 0x01, 0x02, )
						IO (Decode16, 0x002C, 0x002C, 0x01, 0x02, )
						IO (Decode16, 0x0030, 0x0030, 0x01, 0x02, )
						IO (Decode16, 0x0034, 0x0034, 0x01, 0x02, )
						IO (Decode16, 0x0038, 0x0038, 0x01, 0x02, )
						IO (Decode16, 0x003C, 0x003C, 0x01, 0x02, )
						IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02, )
						IO (Decode16, 0x00A4, 0x00A4, 0x01, 0x02, )
						IO (Decode16, 0x00A8, 0x00A8, 0x01, 0x02, )
						IO (Decode16, 0x00AC, 0x00AC, 0x01, 0x02, )
						IO (Decode16, 0x00B0, 0x00B0, 0x01, 0x02, )
						IO (Decode16, 0x00B4, 0x00B4, 0x01, 0x02, )
						IO (Decode16, 0x00B8, 0x00B8, 0x01, 0x02, )
						IO (Decode16, 0x00BC, 0x00BC, 0x01, 0x02, )
						IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02, )
						IRQNoFlags ()
							{2}
					})
				}

				Device (MATH)
				{
					Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x01, )
						IRQNoFlags ()
							{13}
					})
				}

				Device (LDRC)
				{
					Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
					Name (_UID, 0x02)  // _UID: Unique ID
					Name (_CRS, ResourceTemplate ()
					{
						IO (Decode16, 0x002E, 0x002E, 0x01, 0x02, )
						IO (Decode16, 0x004E, 0x004E, 0x01, 0x02, )
						IO (Decode16, 0x0061, 0x0061, 0x01, 0x01, )
						IO (Decode16, 0x0063, 0x0063, 0x01, 0x01, )
						IO (Decode16, 0x0065, 0x0065, 0x01, 0x01, )
						IO (Decode16, 0x0067, 0x0067, 0x01, 0x01, )
						IO (Decode16, 0x0070, 0x0070, 0x01, 0x01, )
						IO (Decode16, 0x0080, 0x0080, 0x01, 0x01, )
						IO (Decode16, 0x0092, 0x0092, 0x01, 0x01, )
						IO (Decode16, 0x00B2, 0x00B2, 0x01, 0x02, )
						IO (Decode16, 0x0680, 0x0680, 0x01, 0x20, )
						IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
						IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
						IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
						IO (Decode16, 0x1C00, 0x1C00, 0x01, 0xFF, )  // Name (GPBS, 0x1C00)
						IO (Decode16, 0x1D00, 0x1D00, 0x01, 0xFF, )  // GPBS + 0x100 = 0x1D00
						IO (Decode16, 0x1E00, 0x1E00, 0x01, 0xFF, )  // GPBS + 0x200 = 0x1E00
						IO (Decode16, 0x1F00, 0x1F00, 0x01, 0xFF, )  // GPBS + 0x300 = 0x1F00
						IO (Decode16, 0x1800, 0x1800, 0x01, 0xFF, )
						IO (Decode16, 0x164E, 0x164E, 0x01, 0x02, )
					})
				}

				Device (RTC)
				{
					Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						IO (Decode16, 0x0070, 0x0070, 0x01, 0x08, )
						IRQNoFlags ()
							{8}
					})
				}

				Device (TIMR)
				{
					Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
					Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
					{
						IO (Decode16, 0x0040, 0x0040, 0x01, 0x04, )
						IO (Decode16, 0x0050, 0x0050, 0x10, 0x04, )
						IRQNoFlags ()
							{0}
					})
				}
			}
