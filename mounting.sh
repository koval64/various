#!/usr/bin/bash

IFS=$'\n'
DEVICES=()

# add unmounted devices to devices list
for item in `lsblk -nr -o NAME,SIZE,FSTYPE,MOUNTPOINT | awk '$3!="" && $4==""'`
do
	DEVICES+=("$item")
done

# add mounted devices to devices list
for item in `lsblk -nr -o NAME,SIZE,FSTYPE,MOUNTPOINT | awk '$3!="squashfs" && $3!="" && $4!="" && $4!="/" && $4!="/boot/efi"'`
do
	DEVICES+=("* $item")
done

# sort devices list
eval 'sorted=($(sort <<<"${DEVICES[*]}"))'
IFS=$'\n' eval 'DEVICES2="${sorted[*]}"'

# run rofi
THEME=${1:-$HOME/.config/rofi/solarized-black.rasi}
choice=$(echo -e "${DEVICES2[@]}" | rofi -dmenu -theme $THEME -p "(un)mount")

# (un)mount selected device 
if [ -n "$choice" ]; then
	# if [[ ${choice:0:1} = "*" ]]; then
	if [[ $choice = \** ]]; then 		# if starts with '*' character
		udisksctl unmount -b /dev/`echo $choice | awk '{print $2}'`
	else
		udisksctl mount -b /dev/`echo $choice | awk '{print $1}'`
	fi
fi

