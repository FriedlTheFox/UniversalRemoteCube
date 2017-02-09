#!/bin/bash
#Fernbedienung anlernen und Konfigurationsdatei erstellen

echo "lirc Service stoppen"
sudo /etc/init.d/lirc stop

while true; do
    read -p "KEY Namen listen? [y/n]" YN
    case $YN in
        [Yy]* ) irrecord --list-namespace; break;;
        [Nn]* ) echo; break;;
        * ) echo "Bitte 'y' oder 'n' eingeben.";;
    esac
done

while true; do
    read -p "Soll ein Backup erstellt werden?" YN
    case $YN in
      [Yy]* ) sudo cp /etc/lirc/lircd.conf /etc/lirc/lircd_backup.conf; echo "Backup erstellt."; break;;
      [Nn]* ) echo "KEIN Backup erstellt."; break;;
        * ) echo "Bitte 'y' oder 'n' eingeben.";;
    esac
done

read -p "Konfigurationsdatei erstellen!" REMOTENAME
irrecord -d /dev/lirc0 ~/lircd.conf

#echo "Name '" + $REMOTENAME + "' wird eingetragen"
# TODO: In Zeile 17 Name ersetzen!!!

echo "Neue Konfigurationsdatei wird kopiert"
echo "/etc/lirc/lircd.conf"
sudo cp ~/lircd.conf /etc/lirc/lircd.conf
sudo rm ~/lircd.conf

echo "lirc Service starten"
sudo /etc/init.d/lirc start
