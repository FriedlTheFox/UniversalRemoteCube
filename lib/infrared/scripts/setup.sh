#!/bin/bash
#lirc Bibliothek einrichten

echo "licr Module werden hinzugefügt"
echo "/etc/modules"
sudo "lirc_rpi" >> /etc/modules
sudo "lirc_dev" >> /etc/modules

echo "Hardwarekonfiguration wird angepasst"
echo "/etc/lirc/hardware.conf"
sudo cp /etc/lirc/hardware.conf /etc/lirc/hardware_original.conf
sudo cp ./hardware.conf /etc/lirc/hardware.conf
echo "Backup --> /etc/lirc/hardware_original.conf"

echo "Bootkonfiguration wird angepasst"
echo "/boot/config.txt"
sed 's/#dtoverlay=lirc-rpi/dtoverlay=lirc-rpi/' /boot/config.txt > /boot/config.txt
#dtoverlay=lirc-rpi,gpio_in_pin=23,gpio_out_pin=22
