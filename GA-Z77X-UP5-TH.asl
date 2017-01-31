/* Minimal DSDT for Gigabyte GA-Z77X-UP5 TH */

// User ACPI configuration
#include "config.asl"

// Motherboard ACPI configuration - do not edit!
#define CONFIG_CHIPSET_INTEL_LAN_DEVICE        \_SB.PCI0.GIGE
#define CONFIG_CHIPSET_INTEL_XHC_DEVICE        \_SB.PCI0.XHC1

#define CONFIG_GRAPHICS_IGPU_SUPPORT           0x01
#define CONFIG_GRAPHICS_PCIE_SUPPORT           0x02

#define CONFIG_PCI_FIREWIRE_ADDRESS            0x69010000
#define CONFIG_PCI_FIREWIRE_DEVICE             \_SB.PCI0.RP06.FWBR.FRWR
#define CONFIG_PCI_FIREWIRE_PORTS              0x01
#define CONFIG_PCI_PEG0_SLOT_NAME              "Slot-2"
#define CONFIG_PCI_PEG1_SLOT_NAME              "Slot-5"

#define CONFIG_USB_CURRENT_DESKTOP             0x01

DefinitionBlock ("DSDT.aml", "DSDT", 0x02, "APPLE ", "iMac", 0x20170131)
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
				#include "src/panther_point/pci/pxsx.asl"
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
			}

			Device (RP06)
			{
				#include "src/panther_point/pci/rp06.asl"
				#include "src/common/pci/firewire.asl"
			}

			Device (RP07)
			{
				#include "src/panther_point/pci/rp07.asl"
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

		#include "src/common/pwrb.asl"
	}

	Scope (\_GPE)
	{
		#include "src/panther_point/gpe.asl"

		Method (_L09, 0, NotSerialized)	 // _Lxx: Level-Triggered GPE
		{
			Notify (\_SB.PCI0.RP06, 0x02)
			Notify (\_SB.PCI0.RP08, 0x02)
			Notify (\_SB.PCI0.PEG0, 0x02)  // Optional PEG0 notification
			Notify (\_SB.PCI0.PEG1, 0x02)  // Optional PEG1 notification
		}

		Method (_L1A, 0, NotSerialized)	 // _Lxx: Level-Triggered GPE
		{
			Notify (CONFIG_PCI_FIREWIRE_DEVICE, 0x02)
		}
	}

	#include "src/common/sleep.asl"
}
