			Device (EHC1)
			{
				Name (_ADR, 0x001D0000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (_S3D, 0x03)  // _S3D: S3 Device State
				Name (_S4D, 0x03)  // _S4D: S4 Device State
				Name (MBSD, One)  // Enable USB SuperDrive support
				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Device (PRT1)
					{
						Name (_ADR, One)  // _ADR: Address
						Alias (UPIN, _UPC)  // _UPC: USB Port Capabilities

						Device (PRT1)
						{
							Name (_ADR, One)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT2)
						{
							Name (_ADR, 0x02)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT3)
						{
							Name (_ADR, 0x03)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT4)
						{
							Name (_ADR, 0x04)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT5)
						{
							Name (_ADR, 0x05)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT6)
						{
							Name (_ADR, 0x06)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT7)
						{
							Name (_ADR, 0x07)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT8)
						{
							Name (_ADR, 0x08)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}
					}
				}
			}

			Device (EHC2)
			{
				Name (_ADR, 0x001A0000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (_S3D, 0x03)  // _S3D: S3 Device State
				Name (_S4D, 0x03)  // _S4D: S4 Device State
				Name (MBSD, One)  // Enable USB SuperDrive support
				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Device (PRT1)
					{
						Name (_ADR, One)  // _ADR: Address
						Alias (^^^EHC1.RHUB.PRT1._UPC, _UPC)
						Device (PRT1)
						{
							Name (_ADR, One)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT2)
						{
							Name (_ADR, 0x02)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT3)
						{
							Name (_ADR, 0x03)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT4)
						{
							Name (_ADR, 0x04)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT5)
						{
							Name (_ADR, 0x05)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT6)
						{
							Name (_ADR, 0x06)  // _ADR: Address
							Alias (UP2A, _UPC)  // _UPC: USB Port Capabilities
						}
					}
				}
			}
