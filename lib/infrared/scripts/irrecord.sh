#!/bin/bash
#Fernbedienung anlernen und Konfigurationsdatei erstellen

echo "lirc Service stoppen"
sudo /etc/init.d/lirc stop

while true; do
    read -p "KEY Namen listen? [y/n]" YN
    case $YN in
        [Yy]* ) irrecord --list-namespace;;
        [Nn]* ) echo;;
        * ) echo "Bitte 'y' oder 'n' eingeben.";;
    esac
done

while true; do
    read -p "Soll ein Backup erstellt werden?" YN
    case $KEY in
      [Yy]* ) sudo mv /etc/lirc/lircd.conf /etc/lirc/lircd_backup.conf; echo "Backup erstellt.";;
      [Yy]* ) echo "KEIN Backup erstellt.";;
        * ) echo "Bitte 'y' oder 'n' eingeben.";;
    esac
done

read -p "Konfigurationsdatei erstellen!"
irrecord -d /dev/lirc0 ~/lircd.conf

echo "Neue Konfigurationsdatei wird kopiert"
echo "/etc/lirc/lircd.conf"
sudo cp ~/lircd.conf /etc/lirc/lircd.conf

echo "lirc Service starten"
sudo /etc/init.d/lirc start
