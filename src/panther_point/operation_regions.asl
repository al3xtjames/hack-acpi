	Name (PMBS, 0x0400)
	Name (SMCR, 0x0430)

	OperationRegion (GNVS, SystemMemory, CONFIG_ACPI_GNVS_ADDRESS, 0x7D)
	Field (GNVS, AnyAcc, Lock, Preserve)
	{
		Offset (0x7B),
		ECON,	8, // Embedded Controller Availability Flag.
		GPIC,	8  // Global IOAPIC/8259 Interrupt Mode Flag.
	}

	OperationRegion (PMIO, SystemIO, PMBS, 0x80)
	Field (PMIO, ByteAcc, NoLock, Preserve)
	{
		Offset (0x42),
			,	1,
		GPEC,	1
	}

