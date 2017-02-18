#!/usr/bin/env bash
# mount_efi.sh

export LC_ALL=C

function printError()
{
	string="${COLOR_RED}${STYLE_BOLD}ERROR: ${STYLE_RESET}${STYLE_BOLD}$1${STYLE_RESET} Exiting..."
	printf "%s\n" "$string"

	exit 1
}

# Mounts the EFI system partition for the currently-booted disk.
function mountEFI()
{
	# Find the BSD device name for the current OS disk
	osVolume=$(df / | awk '/disk/ {print $1}')

	# Find the EFI partition of the disk from the OS disk
	efiVolume=$(diskutil list "$osVolume" | awk '/EFI/ {print $6}')

	# Make sure the EFI partition actually exists
	if [ -z "$efiVolume" ]; then
		## Check if the OS is installed on a Core Storage (CS) logical volume
		csVolume=$(diskutil info "$osVolume" | grep "Core Storage")
		if [ ! -z "$csVolume" ]; then ## CS volume detected
			## We can find the recovery volume in the diskutil output, and then use that to find the EFI partition
			recoveryVolume=$(diskutil info "$osVolume" | awk '/Recovery Disk:/ {print $3}')
			efiVolume=$(diskutil list "$recoveryVolume" | awk '/EFI/ {print $6}')
		else ## No CS volume present, so assume no EFI partition
			printError "No EFI partition present on OS volume ($osVolume)!"
		fi
	fi

	# Check if the EFI partition is already mounted; if not, mount it
	if [ -z "$(mount | awk '/'"$efiVolume"'/ {print $1}')" ]; then
		diskutil mount "$efiVolume" > /dev/null
		export EFI_MOUNT=$(diskutil info "$efiVolume" | awk '/Mount Point/ {print $3}')
		echo "$EFI_MOUNT"
	else
		export EFI_MOUNT=$(diskutil info "$efiVolume" | awk '/Mount Point/ {print $3}')
		echo "$EFI_MOUNT"
	fi
}

mountEFI
