#!/usr/bin/env bash
# gen_config.sh

export LC_ALL=C

if [[ ! -e config.asl ]]; then
	cp config_orig.asl config.asl
fi

ACPI_GNVS_ADDRESS=$(bdmesg | grep 'OperationRegion (GNVS...)' |\
	awk -F ' ' '{gsub("addr=", ""); print $7}')

if [[ -z $ACPI_GNVS_ADDRESS ]]; then
	ACPI_GNVS_ADDRESS=0x$(bdmesg | grep 'OperationRegion(GNVS,' | tail -n 1 |\
		awk -F ' ' '{gsub("addr=", ""); print $6}' | tr -d ',')
fi

if [[ ! -z $ACPI_GNVS_ADDRESS ]]; then
	sed -i '' "s/0xDEADBEEF/$ACPI_GNVS_ADDRESS/g" config.asl
fi
