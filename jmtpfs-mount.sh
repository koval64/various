#!/usr/bin/bash

#
# REQUIRE (jmtpfs) package
#

detect_jmtpfs_devices () {
  busdev=$(jmtpfs -l 2>&1 | grep -E "^[0-9]" | tr -d "," | awk '{ print $1","$2 }')
}
detect_jmtpfs_device () {
  busdev=$(jmtpfs -l 2>&1 | grep -E "^[0-9]" | tr -d ",")
}

mount_first_device () {
  busdev=$(jmtpfs -l 2>&1 | grep -E "^[0-9]" | tr -d "," | awk '{ print $1","$2 }')
  jmtpfs -device="$busdev" "$HOME/myPhone" 2>&1 | 1>/dev/null
}

unmount_first_device () {
  fusermount -u "$HOME/myPhone" 2>&1 | 1>/dev/null
}

case "$1" in
  "mount")
    mount_first_device
    echo "mounting device..."
    ;;
  "unmount")
    unmount_first_device
    echo "unmounting device..."
    ;;
  *)
    echo "detecting device..."
    detect_jmtpfs_device
    echo $busdev
esac


