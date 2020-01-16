#!/bin/bash

function detect {
  if [ "$(detectrpi)" != "nonrpi" ]; then
    echo "rpi $(detectrpi)"
  elif [ -d "/vagrant" ]; then
    if [ -f "/boot/version.txt" ]; then
      echo "vagrant $(cat /boot/version.txt)"
    else
      echo "vagrant other"
    fi
  else
    echo "other $(uname -m)"
  fi
}


function detect_help {
  echo
  echo "Usage: $(basename "$0") detect"
  echo
  echo "Detects and outputs the hardware info"
  echo
  echo "Example:"
  echo "  $(basename "$0") detect"
  echo "      Prints the hardware info"
  echo
}
