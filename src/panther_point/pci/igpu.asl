			Device (IGPU)
			{
				Name (_ADR, 0x00020000)  // _ADR: Address
				OperationRegion (IGPH, PCI_Config, Zero, 0x40)
				Field (IGPH, ByteAcc, NoLock, Preserve)
				{
					VID,	16,
					DID,	16
				}
			}
