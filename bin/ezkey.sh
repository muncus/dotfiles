#!/bin/bash
# Find and pair with an adafruit ezkey nearby.
# Author: Marc Dougherty <muncus@gmail.com>

found=`hcitool scan | grep "Adafruit EZ-Key"| cut -f 2`
: ${hci_device:="hci0"}

if [[ -n $found ]]; then
  # found is the address. go.
  echo "Found ezkey ${found}. connecting..."
  sudo bluez-simple-agent $hci_device ${found}
  sudo bluez-test-device trusted ${found} yes
  sudo bluez-test-input connect ${found}
else
  echo "No devices found."
fi
