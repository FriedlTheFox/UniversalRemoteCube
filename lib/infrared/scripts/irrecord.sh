#!/bin/bash
#Fernbedienung anlernen und Konfigurationsdatei erstellen

echo "Fernbedienung anlernen und Konfigurationsdatei erstellen"
echo "lirc Service stoppen"
sudo /etc/init.d/lirc stop

read -p "Verfügbare KEY Namen anzeigen?" answer
case "$answer" in
  Yes|yes|Y|y) irrecord --list-namespace
    ;;
  No|no|N|n|"") echo ""
    ;;
    *) echo "Parameter nicht erkannt"
    ;;
esac

if [ -e /etc/lirc/lircd_backup.conf ]
  then
    echo -e "[ \033[33minfo\033[0m ] Backup /etc/lirc/lircd_backup.conf bereits vorhanden"
  else
    sudo sudo cp /etc/lirc/lircd.conf /etc/lirc/lircd_backup.conf
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] Backup von /etc/lirc/lircd.conf in /etc/lirc/lircd_backup.conf erstellt"
      else
        echo -e "[ \033[31merror\033[0m ] Backup von /etc/lirc/lircd.conf konnte NICHT erstellt werden"
        exit 1
    fi
fi

echo "Start der KEY Aufnahme"
#sudo rm ~/lircd.conf
sudo irrecord -d /dev/lirc0 ~/lircd.conf
if [ $? == 0 ]
  then
    read -p "Wie soll die Fernbedienung heißen?" remoteController
    sed -i -e 17c"  name $remoteController" ~/lircd.conf
    sudo cp ~/lircd.conf /etc/lirc/lircd.conf
    sudo rm ~/lircd.conf
  else
    echo -e "[ \033[31merror\033[0m ] Konfiguration ~/lircd.conf konnte NICHT erstellt werden"
    exit 1
fi

echo "lirc Service starten"
sudo /etc/init.d/lirc start
