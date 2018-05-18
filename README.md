# Hackintosh ACPI
Stripped DSDTs for running macOS on various motherboards, [based off Pike R. Alpha's
ACPI table examples](https://github.com/Piker-Alpha/DSDT).

### Supported motherboards
 - ASUS P8Z77-V PRO/Thunderbolt *(Thunderbolt support WIP, untested)*
 - Gigabyte GA-Z77M-D3H
 - Gigabyte GA-Z77X-D3H
 - Gigabyte GA-Z77X-UD3H
 - Gigabyte GA-Z77X-UD5H
 - Gigabyte GA-Z77X-UP5 TH *(Thunderbolt support WIP)*

### Usage
Build a DSDT using `BOARD=target make`:

```
$ BOARD=Gigabyte/GA-Z77X-UD5H make
build/tools/gen_config
build/tools/iasl_darwin -I build -I src -vo -p out/DSDT.aml src/board/Gigabyte/GA-Z77X-UD5H.asl

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20180508
Copyright (c) 2000 - 2018 Intel Corporation

src/panther_point/pci/imei.asl     23: age (Zero) {})
Remark   2095 -                          Effective AML package length is zero ^

src/panther_point/pci/intel_lan.asl      1: H1)
Optimize 1075 -                                          NamePath optimized ^  (ETH1)

ASL Input:     src/board/Gigabyte/GA-Z77X-UD5H.asl - 136 lines, 2940 bytes, 333 keywords
AML Output:    out/DSDT.aml - 5057 bytes, 274 named objects, 59 executable opcodes

Compilation complete. 0 Errors, 0 Warnings, 1 Remarks, 1 Optimizations
```

Running `BOARD=target make install` will copy the DSDT to your the appropriate
directory on your EFI system partition.

### Additional information
These DSDTs contain device property injection in the `_DSM` methods for onboard
FireWire controllers, Thunderbolt controllers (WIP), and USB controllers. This
can be disabled in `config.asl`, by setting `CONFIG_ACPI_DSM_INJECTION` to zero.
