# Hackintosh ACPI
Stripped DSDTs for running macOS on various motherboards.

### Supported motherboards
 - Gigabyte GA-Z77X-D3H
 - Gigabyte GA-Z77X-UD3H
 - Gigabyte GA-Z77X-UD5H
 - Gigabyte GA-Z77X-UP5 TH *(Thunderbolt support WIP)*

### Usage
Build a DSDT using `BOARD=target make`:

```
~/Projects/ACPI ❯❯❯ BOARD=GA-Z77X-UD5H make install
./scripts/gen_config.sh
iasl GA-Z77X-UD5H.asl

Intel ACPI Component Architecture
ASL+ Optimizing Compiler version 20160930-64
Copyright (c) 2000 - 2016 Intel Corporation

src/panther_point/pci/imei.asl     23: age (Zero) {})
Remark   2095 -                          Effective AML package length is zero ^

src/panther_point/pci/igpu.asl    166: age (Zero) {})
Remark   2095 -                          Effective AML package length is zero ^

src/panther_point/pci/hdef.asl     31: age (Zero) {})
Remark   2095 -                          Effective AML package length is zero ^

ASL Input:     GA-Z77X-UD5H.asl - 131 lines, 2757 bytes, 397 keywords
AML Output:    DSDT.aml - 6790 bytes, 283 named objects, 114 executable opcodes

Compilation complete. 0 Errors, 0 Warnings, 3 Remarks, 4 Optimizations
cp DSDT.aml "/Volumes/EFI/EFI/CLOVER/ACPI/patched/DSDT.aml"
```

Running `BOARD=target make install` will copy the DSDT to your the appropriate directory on your EFI system partition.

### Additional information
These DSDTs contain device property injection in the _DSM methods for onboard FireWire controllers, Intel IGPUs, HDMI/DP audio controllers, and USB controllers. This can be disabled in config.asl, by setting `CONFIG_ACPI_DSM_INJECTION` to zero.
