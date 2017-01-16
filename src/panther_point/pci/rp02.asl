				Name (_ADR, 0x001C0001)	// _ADR: Address
				Name (_PRT, Package (0x04)	// _PRT: PCI Routing Table (AR05)
				{
					Package (0x04) { 0xFFFF, Zero, Zero, 0x11 },
					Package (0x04) { 0xFFFF,  One, Zero, 0x12 },
					Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 },
					Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
				})
