#!/bin/bash
#lirc Bibliothek einrichten

#echo "lirc Modul wird installiert"
#sudo apt-get install lirc

echo "licr Module werden hinzugefügt"
echo "/etc/modules"
sudo echo "lirc_rpi" >> /etc/modules
sudo echo "lirc_dev" >> /etc/modules
echo
echo "Hardwarekonfiguration wird angepasst"
echo "/etc/lirc/hardware.conf"
sudo cp /etc/lirc/hardware.conf /etc/lirc/hardware_original.conf
sudo cp ../configs/hardware.conf /etc/lirc/hardware.conf
echo "Backup --> /etc/lirc/hardware_original.conf"
echo
echo "Bootkonfiguration wird angepasst"
echo "/boot/config.txt"
sudo cp /boot/config.txt /boot/config_original.txt
sed 's/#dtoverlay=lirc-rpi/dtoverlay=lirc-rpi/' /boot/config.txt > /boot/config.txt
echo "Backup --> /etc/lirc/hardware_original.conf"

## Raspberry 3 Modul
#dtoverlay=lirc-rpi,gpio_in_pin=23,gpio_out_pin=22
## Raspberry 2 Modul
#dtoverlay=lirc-rpi,gpio_in_pin=18,gpio_out_pin=17
