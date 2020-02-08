function clone {
  local device a b
  device="$1"
  if [ -z "$device" ]; then
    device="/dev/sdb"
  fi

  a=$(fdisk -l |grep /dev/mmcblk0: | grep -P '\d+ (?=bytes)' -o)
  #echo "$a - /dev/mmcblk0"

  b=$(fdisk -l |grep "$device": | grep -P '\d+ (?=bytes)' -o)
  #echo "$b - /dev/sdb"

  if [ -z "$a" ] || [ -z "$b" ]; then
    logit "Error: the device $device wasn't detected" "" "ERROR"
    return 1
  fi

  if [ $b -lt $a ]; then
    logit "Error: the device $device is not big enough" "" "ERROR"
    return 1
  fi

  if [ $a -eq $b ] || [ $a -lt $b ]; then
    logit "copying...."
    echo u > /proc/sysrq-trigger
    dd if=/dev/mmcblk0 bs=1M of="$device"
  fi

  echo ; logit "A reboot is needed to re-enable write permissions to OS." "" "WARNING"
}

function clone_help {
  echo
  echo "Usage: $BASENAME burn [device path]"
  echo
  echo "clones your treehouses image to an SDCard"
  echo
  echo "Example:"
  echo "  $BASENAME clone"
  echo "      Will clone the current system to /dev/sdb (by default)."
  echo
  echo "  $BASENAME clone /dev/sda"
  echo "      Will clone the current system to /dev/sda"
  echo
}
