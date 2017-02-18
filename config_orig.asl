/* Customizable build configuration options */

// The amount of ACPI CPU objects to be added.
#define CONFIG_ACPI_CPU_NUMBER     0x08

// Enable or disable device property injection from _DSM methods.
#define CONFIG_ACPI_DSM_INJECTION  0x01

// The GNVS SystemMemory address. Can be found in a dump of your DSDT.
#define CONFIG_ACPI_GNVS_ADDRESS   0xDEADBEEF

// Enable or disable the creation of certain ACPI devices found on iMacs.
#define CONFIG_ACPI_IMAC_DEVICES   0x01
