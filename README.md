# Hackintosh ACPI
Stripped DSDTs for running macOS on various motherboards.

### Supported motherboards
 - ASUS P8Z77-V PRO/Thunderbolt *(Thunderbolt support WIP, untested)*
 - Gigabyte GA-Z77X-D3H
 - Gigabyte GA-Z77X-UD3H
 - Gigabyte GA-Z77X-UD5H
 - Gigabyte GA-Z77X-UP5 TH *(Thunderbolt support WIP)*

### Usage
Build a DSDT using `BOARD=target make`:

```
hack-acpi ❯ BOARD=Gigabyte/GA-Z77X-UD5H make install
./build/tools/gen_config
build/tools/iasl_darwin -I build -I src -vo -p out/DSDT.aml src/board/Gigabyte/GA-Z77X-UD5H.asl

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20170119
Copyright (c) 2000 - 2017 Intel Corporation

src/panther_point/pci/imei.asl     23: age (Zero) {})
Remark   2095 -                          Effective AML package length is zero ^

src/panther_point/pci/intel_lan.asl      1: H1)
Optimize 1075 -                                          NamePath optimized ^  (ETH1)

ASL Input:     src/board/Gigabyte/GA-Z77X-UD5H.asl - 138 lines, 2936 bytes, 374 keywords
AML Output:    out/DSDT.aml - 5843 bytes, 282 named objects, 92 executable opcodes

Compilation complete. 0 Errors, 0 Warnings, 1 Remarks, 1 Optimizations
cp DSDT.aml "/Volumes/EFI/EFI/CLOVER/ACPI/patched/DSDT.aml"
```

Running `BOARD=target make install` will copy the DSDT to your the appropriate directory on your EFI system partition.

### Additional information
These DSDTs contain device property injection in the _DSM methods for onboard FireWire controllers, Intel IGPUs, HDMI/DP audio controllers, and USB controllers. This can be disabled in config.asl, by setting `CONFIG_ACPI_DSM_INJECTION` to zero.
