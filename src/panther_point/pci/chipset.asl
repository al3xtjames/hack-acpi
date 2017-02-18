			Name (_ADR, Zero)  // _ADR: Address
			Name (_UID, Zero)  // _UID: Unique ID
			Name (_BBN, Zero)  // _BBN: BIOS Bus Number
			Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
			Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
			Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
			{
				IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08, )
				WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode, 0x0000, 0x0000, 0x003E, 0x0000, 0x003F,,, )
				DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange, 0x00000000, 0x00000000, 0x00000CF7, 0x00000000, 0x00000CF8,,,, TypeStatic)
				DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange, 0x00000000, 0x00000D00, 0x0000FFFF, 0x00000000, 0x0000F300,,,, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000A0000, 0x000BFFFF, 0x00000000, 0x00020000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C0000, 0x000C3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C4000, 0x000C7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C8000, 0x000CBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000CC000, 0x000CFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D0000, 0x000D3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D4000, 0x000D7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D8000, 0x000DBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000DC000, 0x000DFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000E0000, 0x000E3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000E4000, 0x000E7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000E8000, 0x000EBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000EC000, 0x000EFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000F0000, 0x000FFFFF, 0x00000000, 0x00010000,,,, AddressRangeMemory, TypeStatic)
				DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0xBFA00000, 0xFEAFFFFF, 0x00000000, 0x3F100000,,,, AddressRangeMemory, TypeStatic)
			})

			Name (_PRT, Package ()  // _PRT: PCI Routing Table (AR00)
			{
				Package (0x04) { 0x001FFFFF, Zero, Zero, 0x15 },
				Package (0x04) { 0x001FFFFF,  One, Zero, 0x13 },
				Package (0x04) { 0x001FFFFF, 0x02, Zero, 0x12 },
				Package (0x04) { 0x001FFFFF, 0x03, Zero, 0x10 },
				Package (0x04) { 0x0014FFFF, Zero, Zero, 0x10 }, // XHC1
				Package (0x04) { 0x001DFFFF, Zero, Zero, 0x17 }, // EHC1
				Package (0x04) { 0x001DFFFF,  One, Zero, 0x13 }, // EHC1
				Package (0x04) { 0x001DFFFF, 0x02, Zero, 0x10 }, // EHC1
				Package (0x04) { 0x001DFFFF, 0x03, Zero, 0x12 }, // EHC1
				Package (0x04) { 0x001AFFFF, Zero, Zero, 0x10 }, // EHC2
				Package (0x04) { 0x001AFFFF,  One, Zero, 0x15 }, // EHC2
				Package (0x04) { 0x001AFFFF, 0x02, Zero, 0x12 }, // EHC2
				Package (0x04) { 0x001AFFFF, 0x03, Zero, 0x13 }, // EHC2
				Package (0x04) { 0x001BFFFF, Zero, Zero, 0x16 }, // HDEF
				Package (0x04) { 0x0016FFFF, Zero, Zero, 0x10 },
				Package (0x04) { 0x0016FFFF,  One, Zero, 0x13 },
				Package (0x04) { 0x0016FFFF, 0x02, Zero, 0x12 },
				Package (0x04) { 0x0016FFFF, 0x03, Zero, 0x11 },
				Package (0x04) { 0x001CFFFF, Zero, Zero, 0x10 }, // RP0n
				Package (0x04) { 0x001CFFFF,  One, Zero, 0x11 }, // RP0n
				Package (0x04) { 0x001CFFFF, 0x02, Zero, 0x12 }, // RP0n
				Package (0x04) { 0x001CFFFF, 0x03, Zero, 0x13 }, // RP0n
#if CONFIG_GRAPHICS_PCIE_SUPPORT > 0
				Package (0x04) { 0x0001FFFF, Zero, Zero, 0x10 }, // PEGn
				Package (0x04) { 0x0001FFFF,  One, Zero, 0x11 }, // PEGn
				Package (0x04) { 0x0001FFFF, 0x02, Zero, 0x12 }, // PEGn
				Package (0x04) { 0x0001FFFF, 0x03, Zero, 0x13 }, // PEGn
#endif
				Package (0x04) { 0x0006FFFF, Zero, Zero, 0x13 },
				Package (0x04) { 0x0006FFFF,  One, Zero, 0x10 },
				Package (0x04) { 0x0006FFFF, 0x02, Zero, 0x11 },
				Package (0x04) { 0x0006FFFF, 0x03, Zero, 0x12 },
#if CONFIG_GRAPHICS_IGPU_SUPPORT == 1
				Package (0x04) { 0x0002FFFF, Zero, Zero, 0x10 }, // IGPU
#endif
				Package (0x04) { 0x0004FFFF, Zero, Zero, 0x10 },
				Package (0x04) { 0x0004FFFF,  One, Zero, 0x11 },
				Package (0x04) { 0x0004FFFF, 0x02, Zero, 0x12 },
				Package (0x04) { 0x0004FFFF, 0x03, Zero, 0x13 },
#ifdef CONFIG_CHIPSET_INTEL_LAN_DEVICE
				Package (0x04) { 0x0019FFFF, Zero, Zero, 0x14 }	 // GIGE
#endif
			})

			Device (PDRC)
			{
				Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
				Name (_UID, One)  // _UID: Unique ID
				Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
				{
					Memory32Fixed (ReadWrite, 0x00000000, 0x00004000, )
					Memory32Fixed (ReadWrite, 0x00000000, 0x00008000, )
					Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, )
					Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, )
					Memory32Fixed (ReadWrite, 0x00000000, 0x00000000, )
					Memory32Fixed (ReadWrite, 0xFED20000, 0x00020000, )
					Memory32Fixed (ReadOnly,  0xFED90000, 0x00004000, )
					Memory32Fixed (ReadWrite, 0xFED45000, 0x0004B000, )
					Memory32Fixed (ReadOnly,  0xFF000000, 0x01000000, )
					Memory32Fixed (ReadOnly,  0xFEE00000, 0x00100000, )
					Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, )
				})
			}

			Name (PW94, Package (0x02)
			{
				0x09, 0x04
			})

			Name (PWD4, Package (0x02)
			{
				0x0D, 0x04
			})

			#include <panther_point/pci/mchc.asl>
			#include <panther_point/pci/imei.asl>
#if CONFIG_GRAPHICS_IGPU_SUPPORT == 1
			#include <panther_point/pci/igpu.asl>
#endif

#if CONFIG_GRAPHICS_PCIE_SUPPORT > 0
			#include <panther_point/pci/peg.asl>
#endif

			#include <panther_point/pci/ehci.asl>
#ifdef CONFIG_CHIPSET_INTEL_XHC_DEVICE
			#include <panther_point/pci/xhci.asl>
#endif
			#include <panther_point/pci/hdef.asl>

#ifdef CONFIG_CHIPSET_INTEL_LAN_DEVICE
			#include <panther_point/pci/intel_lan.asl>
#endif

			#include <panther_point/pci/sata.asl>
			#include <panther_point/lpcb.asl>
			#include <panther_point/sbus.asl>
