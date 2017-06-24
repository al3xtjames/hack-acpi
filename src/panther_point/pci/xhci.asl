			Device (XHC1)
			{
				Name (_ADR, 0x00140000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (MBSD, One)  // Enable USB SuperDrive support

#if CONFIG_ACPI_DSM_INJECTION == 1
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Set AAPL,device-internal to Zero for XHC1
					^^EHC1.USBP[0x07] = Zero
					// Return pointer to USB device properties
					Return (RefOf (^^EHC1.USBP))
				}
#endif

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
