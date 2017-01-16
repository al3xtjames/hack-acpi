# Makefile for hack-acpi

IASL=iasl
EFI_MOUNT=$(shell scripts/mount_efi.sh)

all : $(BOARD).asl
	./scripts/gen_config.sh
	$(IASL) $<

.PHONY: install
install : all
	cp DSDT.aml "$(EFI_MOUNT)/EFI/CLOVER/ACPI/patched/DSDT.aml"

.PHONY: cleanall
cleanall : clean
	$(RM) config.asl

.PHONY: clean
clean :
	$(RM) DSDT.aml
