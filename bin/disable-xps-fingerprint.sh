#!/usr/bin/env sh
echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"27c6\", ATTRS{idProduct}==\"5395\", ATTR{authorized}=\"0\"" > /etc/udev/rules.d/fingerprint.rules
