#!/usr/bin/env bash
# gen_config.sh

export LC_ALL=C

BDMESG=$(which bdmesg)

if [[ ! -e config.asl ]]; then
	cp config_orig.asl config.asl
fi

if [ -f "$BDMESG" ]; then
	ACPI_GNVS_ADDRESS=$($BDMESG | grep 'OperationRegion (GNVS...)' |\
		awk -F ' ' '{gsub("addr=", ""); print $7}')

	if [[ -z $ACPI_GNVS_ADDRESS ]]; then
		ACPI_GNVS_ADDRESS=0x$($BDMESG | grep 'OperationRegion(GNVS,' | tail -n 1 |\
			awk -F ' ' '{gsub("addr=", ""); print $6}' | tr -d ',')
	fi

	if [[ $ACPI_GNVS_ADDRESS != "0x" ]]; then
		sed -i '' "s/0xDEADBEEF/$ACPI_GNVS_ADDRESS/g" config.asl
	fi
else
	echo "gen_config: bdmesg not found, using fallback GNVS address"
fi
