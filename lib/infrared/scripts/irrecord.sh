#!/bin/bash
#Fernbedienung anlernen und Konfigurationsdatei erstellen

echo "lirc Service stoppen"
sudo /etc/init.d/lirc stop

while true; do
    read -p "Namensliste anzeigen?" yn
    case $yn in
        [Yy]* ) irrecord --list-namespace;;
        [Nn]* ) echo;;
        * ) echo "Bitte 'y' oder 'n' eingeben.";;
    esac
done

read -p "Wie soll die Konfigurationsdatei heißen?" configName
irrecord -d /dev/lirc0 ~/lirc-$configName.conf

echo "Backup der Originaldatei wird erstellt"
sudo mv /etc/lirc/lircd.conf /etc/lirc/lircd_original.conf

echo "Neue Konfigurationsdatei wird kopiert"
echo "/etc/lirc/lircd.conf"
sudo cp ~/lircd-$configName.conf /etc/lirc/lircd.conf

echo "lirc Service starten"
sudo /etc/init.d/lirc start
