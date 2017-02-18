/* Minimal DSDT for Gigabyte GA-Z77X-D3H/UD3H */

// User ACPI configuration
#include "config.asl"

// Motherboard ACPI configuration - do not edit!
#define CONFIG_CHIPSET_INTEL_XHC_DEVICE        \_SB.PCI0.XHC1

#define CONFIG_GRAPHICS_IGPU_SUPPORT           0x01
#define CONFIG_GRAPHICS_PCIE_SUPPORT           0x02

#define CONFIG_PCI_PEG0_SLOT_NAME              "Slot-2"
#define CONFIG_PCI_PEG1_SLOT_NAME              "Slot-5"

#define CONFIG_USB_CURRENT_DESKTOP             0x01

DefinitionBlock ("DSDT.aml", "DSDT", 0x02, "APPLE ", "iMac", 0x20170206)
{
	#include "src/panther_point/operation_regions.asl"
	#include "src/common/cpu.asl"

	Scope (\_SB)
	{
		#include "src/panther_point/mem2.asl"

		Device (PCI0)
		{
			#include "src/panther_point/pci/chipset.asl"

			Device (RP01)
			{
				#include "src/panther_point/pci/rp01.asl"
			}

			Device (RP02)
			{
				#include "src/panther_point/pci/rp02.asl"
			}

			Device (RP03)
			{
				#include "src/panther_point/pci/rp03.asl"
			}

			Device (RP04)
			{
				#include "src/panther_point/pci/rp04.asl"
			}

			Device (RP05)
			{
				#include "src/panther_point/pci/rp05.asl"
				Device (XHC2)
				{
					#include "src/panther_point/pci/pxsx.asl"
#if CONFIG_ACPI_DSM_INJECTION == 1
					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If (!Arg2)
						{
							Return (Buffer (One) { 0x03 })
						}

						// Set AAPL,device-internal to Zero for XHC2
						^^^EHC1.USBP[0x07] = Zero
						// Return pointer to USB device properties
						Return (RefOf (^^^EHC1.USBP))
					}
#endif
				}
			}

			Device (RP06)
			{
				#include "src/panther_point/pci/rp06.asl"
			}

			Device (RP07)
			{
				#include "src/panther_point/pci/rp07.asl"
				Device (GIGE)
				{
					#include "src/panther_point/pci/pxsx.asl"
				}
			}

			Device (RP08)
			{
				#include "src/panther_point/pci/rp08.asl"
				Device (SATA)
				{
					#include "src/panther_point/pci/pxsx.asl"
				}
			}
		}

#if CONFIG_ACPI_IMAC_DEVICES == 1
		#include "src/panther_point/pnlf.asl"
#endif
		#include "src/common/pwrb.asl"
	}

	Scope (\_GPE)
	{
		#include "src/panther_point/gpe.asl"

		Method (_L09, 0, NotSerialized)	// _Lxx: Level-Triggered GPE
		{
			Notify (\_SB.PCI0.RP05, 0x02)
			Notify (\_SB.PCI0.RP07, 0x02)
			Notify (\_SB.PCI0.RP08, 0x02)
			Notify (\_SB.PCI0.PEG0, 0x02)  // Optional PEG0 notification
			Notify (\_SB.PCI0.PEG1, 0x02)  // Optional PEG1 notification
		}
	}

	#include "src/common/sleep.asl"
}
