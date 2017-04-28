	Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
	{
		GPIC = Arg0
	}

	Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
	{
		// Reboot after shutdown fix
		If (Arg0 && Arg0 != 0x05)
		{
			\_SB.PCI0.LPCB.SPTS ()
		}
	}

	Method (_WAK, 1, Serialized)  // _WAK: Wake
	{
		\_SB.PCI0.LPCB.SWAK ()
		Return (Package (0x02) { Zero, Zero })
	}

	Name (_S0, Package (0x04) { Zero, Zero, Zero, Zero })
	Name (_S3, Package (0x04) { 0x05, Zero, Zero, Zero })
	Name (_S4, Package (0x04) { 0x06, Zero, Zero, Zero })
	Name (_S5, Package (0x04) { 0x07, Zero, Zero, Zero })
