			Device (XHC1)
			{
				Name (_ADR, 0x00140000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (MBSD, One)  // Enable USB SuperDrive support
				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Device (HS01)
					{
						Name (_ADR, One)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (HS02)
					{
						Name (_ADR, 0x02)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (HS03)
					{
						Name (_ADR, 0x03)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (HS04)
					{
						Name (_ADR, 0x04)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (SSP1)
					{
						Name (_ADR, 0x05)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (SSP2)
					{
						Name (_ADR, 0x06)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (SSP3)
					{
						Name (_ADR, 0x07)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}

					Device (SSP4)
					{
						Name (_ADR, 0x08)  // _ADR: Address
						Alias (UP3A, _UPC)  // _UPC: USB Port Capabilities
					}
				}
			}
