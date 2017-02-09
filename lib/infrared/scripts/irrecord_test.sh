#!/bin/bash
#IR-Empfänger testen

echo "IR-Empfänger wird getestet"
sudo /etc/init.d/lirc stop
sudo modprobe lirc_rpi
mode2 -d /dev/lirc0
