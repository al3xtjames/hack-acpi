/* User ACPI build configuration */

// The amount of ACPI CPU objects to be added.
/// 0xFF automatically selects the maximum amount of ACPI CPU objects.
/// Manually set this to further strip the DSDT.
#define CONFIG_ACPI_CPUS            0xFF

// Enable or disable Apple CPU PM plugin-type injection.
/// 0xFF automatically sets this depending on the chipset model.
/// Disable this (set to 0x00) if a CPU PM SSDT is used.
#define CONFIG_ACPI_CPU_PM          0xFF

// Enable or disable device property injection from _DSM methods.
/// Disable this (set to 0x00) to further strip the DSDT.
#define CONFIG_ACPI_DSM_INJECTION   0x01

// The GNVS SystemMemory address. Can be found in a dump of your DSDT.
#define CONFIG_ACPI_GNVS_ADDRESS    0xFFFF0000

// Enable or disable the creation of certain ACPI devices found on iMacs.
/// Disable this (set to 0x00) to further strip the DSDT.
#define CONFIG_ACPI_IMAC_DEVICES    0x00
