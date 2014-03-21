#! /bin/bash
echo "SUBSYSTEMS==\"usb\", ATTRS{product}==\"Griffin PowerMate\", KERNEL==\"event?\", NAME=\"input/powermate\"" > /etc/udev/rules.d/10-local.rules
groupadd powermate
echo "ATTRS{product}==\"Griffin PowerMate\" GROUP=\"powermate\", MODE=\"0660\"" > /etc/udev/rules.d/40-permissions.rules

echo "A group has been setup for powermate"
echo "add your user to the powermate group if you would like access"


