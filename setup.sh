#! /bin/bash
echo "SUBSYSTEMS==\"usb\", ATTRS{product}==\"Griffin PowerMate\", KERNEL==\"event?\", NAME=\"input/powermate\"" >> /etc/udev/rules.d/10-local.rules
groupadd powermate
echo "ATTRS{product}==\"Griffin PowerMate\" GROUP=\"powermate\", MODE=\"0660\"" >> /etc/udev/rules.d/40-permissions.rules

echo "A group has been setup for powermate"
echo "add your user to the powermate group if you would like access"
echo "sudo usermod -a -G powermate `whoami`"
echo "NOTE: this does not take effect until you re-login"


