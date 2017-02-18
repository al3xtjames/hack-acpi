# Makefile for hack-acpi

EFI_MOUNT := $(shell tools/mount_efi.sh)
OS := $(shell uname)

ifeq ($(OS), Darwin)
	IASL := tools/iasl_darwin
endif

all : src/board/$(BOARD).asl
	./tools/gen_config.sh
	$(IASL) -I . -I src -p out/DSDT.aml $<

.PHONY: install
install : all
	cp out/DSDT.aml "$(EFI_MOUNT)/EFI/CLOVER/ACPI/patched/DSDT.aml"

.PHONY: cleanall
cleanall : clean
	$(RM) config.asl

.PHONY: clean
clean :
	$(RM) out/DSDT.aml
