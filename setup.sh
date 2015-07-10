#! /bin/bash
sudo groupadd powermate
sudo cp ./60-powermate.rules /etc/udev/rules.d/60-powermate.rules

echo "A group has been setup for powermate"
echo "add your user to the powermate group if you would like access"
echo "sudo usermod -a -G powermate `whoami`"
echo "NOTE: this does not take effect until you re-login"


