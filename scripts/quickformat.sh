#!/bin/bash

quick_format() {
    local device=$1
    local label=$2

    # Check if the device exists
    if [[ ! -b $device ]]; then
        echo "Device $device not found!"
        return 1
    fi

    # Unmount the device if it's mounted
    if mount | grep -q "$device"; then
        echo "Unmounting $device..."
        sudo umount "${device}"* || { echo "Failed to unmount $device"; return 1; }
    fi

    # Create a new GPT partition table
    echo "Creating a new GPT partition table on $device..."
    sudo parted "$device" --script mklabel gpt || { echo "Failed to create GPT partition table on $device"; return 1; }

    # Create a new primary partition spanning the entire device
    echo "Creating a new primary partition on $device..."
    sudo parted "$device" --script mkpart primary 0% 100% || { echo "Failed to create partition on $device"; return 1; }

    # Format the partition as exFAT
    local partition="${device}1"
    echo "Formatting $partition as exFAT with label $label..."
    sudo mkfs.exfat -n "$label" "$partition" || { echo "Failed to format $partition as exFAT"; return 1; }

    echo "Device $device formatted successfully as exFAT with label $label."
}
