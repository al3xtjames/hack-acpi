			Device (EHC1)
			{
				Name (_ADR, 0x001D0000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (_S3D, 0x03)  // _S3D: S3 Device State
				Name (_S4D, 0x03)  // _S4D: S4 Device State
				Name (MBSD, One)  // Enable USB SuperDrive support
#if CONFIG_ACPI_DSM_INJECTION == 1
#if CONFIG_USB_CURRENT_DESKTOP == 1
				Name (USBP, Package (0x0B)  // USB device properties
				{
					"AAPL,current-available", 0x0834,
					"AAPL,current-extra", 0x0A8C,
					"AAPL,current-extra-in-sleep", 0x0A8C,
					"AAPL,device-internal",	0x02,
					"AAPL,max-port-current-in-sleep", 0x0834,
					Buffer (One) { Zero }
				})
#elif CONFIG_USB_CURRENT_LAPTOP == 1
				Name (USBP, Package (0x0B)  // USB device properties
				{
					"AAPL,current-available", 0x0834,
					"AAPL,current-extra", 0x0898,
					"AAPL,current-extra-in-sleep", 0x0640,
					"AAPL,device-internal",	0x02,
					"AAPL,max-port-current-in-sleep", 0x0834,
					Buffer (One) { Zero }
				})
#endif
#endif

#if CONFIG_ACPI_DSM_INJECTION == 1
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Return pointer to USB device properties
					Return (RefOf (USBP))
				}
#endif

				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Device (PRT1)
					{
						Name (_ADR, One)  // _ADR: Address
						Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
						{
							0xFF, 0xFF, Zero, Zero
						})

						Device (PRT1)
						{
							Name (_ADR, One)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT2)
						{
							Name (_ADR, 0x02)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT3)
						{
							Name (_ADR, 0x03)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT4)
						{
							Name (_ADR, 0x04)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT5)
						{
							Name (_ADR, 0x05)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT6)
						{
							Name (_ADR, 0x06)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT7)
						{
							Name (_ADR, 0x07)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT8)
						{
							Name (_ADR, 0x08)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}
					}
				}
			}

			Device (EHC2)
			{
				Name (_ADR, 0x001A0000)  // _ADR: Address
				Alias (PWD4, _PRW)  // _PRW: Power Resources for Wake
				Name (MBSD, One)  // Enable USB SuperDrive support
#if CONFIG_ACPI_DSM_INJECTION == 1
				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (!Arg2)
					{
						Return (Buffer (One) { 0x03 })
					}

					// Return pointer to USB device properties
					Return (RefOf (^^EHC1.USBP))
				}
#endif

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
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT2)
						{
							Name (_ADR, 0x02)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT3)
						{
							Name (_ADR, 0x03)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT4)
						{
							Name (_ADR, 0x04)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT5)
						{
							Name (_ADR, 0x05)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}

						Device (PRT6)
						{
							Name (_ADR, 0x06)  // _ADR: Address
							Alias (_UPC, UPC)  // _UPC: USB Port Capabilities
						}
					}
				}
			}
