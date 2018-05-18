	Scope (_PR)
	{
		Processor (CPU0, 0x01, 0x00000410, 0x06)
		{
			// CONFIG_ACPI_CPU_PM is disabled by default for Panther Point
#if CONFIG_ACPI_CPU_PM == 1
			// This _DSM method is not optional if CONFIG_ACPI_CPU_PM is enabled
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If (!Arg2)
				{
					Return (Buffer (One) { 0x03 })
				}

				Return (Package (0x02)
				{
					"plugin-type", One
				})
			}
#endif // CONFIG_ACPI_CPU_PM
		}

		Processor (CPU1, 0x02, 0x00000410, 0x06) {}

#if CONFIG_ACPI_CPUS > 2
		Processor (CPU2, 0x03, 0x00000410, 0x06) {}
		Processor (CPU3, 0x04, 0x00000410, 0x06) {}

#if CONFIG_ACPI_CPUS > 4
		Processor (CPU4, 0x05, 0x00001810, 0x06) {}
		Processor (CPU5, 0x06, 0x00001810, 0x06) {}
		Processor (CPU6, 0x07, 0x00001810, 0x06) {}
		Processor (CPU7, 0x08, 0x00001810, 0x06) {}
#endif // CONFIG_ACPI_CPUS
#endif // CONFIG_ACPI_CPUS
}
