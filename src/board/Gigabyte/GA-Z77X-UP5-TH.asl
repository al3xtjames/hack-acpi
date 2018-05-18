/* Minimal DSDT for Gigabyte GA-Z77X-UP5 TH */

// User ACPI build configuration
#include <build_config.asl>

// Motherboard ACPI build configuration - do not edit!
#define CONFIG_CHIPSET_INTEL_LAN_DEVICE        \_SB.PCI0.GIGE
#define CONFIG_CHIPSET_INTEL_XHC_DEVICE        \_SB.PCI0.XHC1

#define CONFIG_GRAPHICS_IGPU_SUPPORT           0x01
#define CONFIG_GRAPHICS_PCIE_SUPPORT           0x02

#define CONFIG_PCI_FIREWIRE_ADDRESS            0x69010000
#define CONFIG_PCI_FIREWIRE_DEVICE             \_SB.PCI0.RP06.FWBR.FRWR
#define CONFIG_PCI_FIREWIRE_PORTS              0x01
#define CONFIG_PCI_PEG0_SLOT_NAME              "Slot-2"
#define CONFIG_PCI_PEG1_SLOT_NAME              "Slot-5"

DefinitionBlock ("DSDT.aml", "DSDT", 0x03, "APPLE ", "iMac", 0x20170721)
{
	#include <panther_point/operation_regions.asl>
	#include <panther_point/cpu.asl>

	Scope (_SB)
	{
		#include <panther_point/mem2.asl>

		Device (PCI0)
		{
			#include <panther_point/pci/chipset.asl>

			Device (RP01)
			{
				#include <panther_point/pci/rp01.asl>
				#include <panther_point/pci/thunderbolt.asl>
			}

			Device (RP02)
			{
				#include <panther_point/pci/rp02.asl>
			}

			Device (RP03)
			{
				#include <panther_point/pci/rp03.asl>
			}

			Device (RP04)
			{
				#include <panther_point/pci/rp04.asl>
			}

			Device (RP05)
			{
				#include <panther_point/pci/rp05.asl>
			}

			Device (RP06)
			{
				#include <panther_point/pci/rp06.asl>
				#include <common/pci/firewire.asl>
			}

			Device (RP07)
			{
				#include <panther_point/pci/rp07.asl>
			}

			Device (RP08)
			{
				#include <panther_point/pci/rp08.asl>
				Device (SATA)
				{
					#include <panther_point/pci/pxsx.asl>
				}
			}
		}

#if CONFIG_ACPI_IMAC_DEVICES == 1
		#include <panther_point/pnlf.asl>
#endif // CONFIG_ACPI_IMAC_DEVICES
		#include <common/pwrb.asl>
	}

	Scope (_GPE)
	{
		#include <panther_point/gpe.asl>

		Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
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

	#include <common/sleep.asl>
}
