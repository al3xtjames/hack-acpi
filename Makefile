# Makefile for hack-acpi

EFI_MOUNT := $(shell build/tools/mount_efi)
OS := $(shell uname)

ifeq ($(OS), Darwin)
	IASL := build/tools/iasl_darwin
endif

IASLFLAGS := -I build -I src -vo -p out/DSDT.aml

all: src/board/$(BOARD).asl
	build/tools/gen_config
	$(IASL) $(IASLFLAGS) $<

.PHONY: install
install: all
	cp out/DSDT.aml "$(EFI_MOUNT)/EFI/CLOVER/ACPI/patched/DSDT.aml"

.PHONY: cleanall
cleanall: clean
	$(RM) build/build_config.asl

.PHONY: clean
clean:
	$(RM) out/DSDT.aml
