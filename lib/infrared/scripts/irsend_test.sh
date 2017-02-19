#!/bin/bash
#Sender testen

echo "lirc Service neu starten"
sudo /etc/init.d/lirc restart

read -p "Wie heißt die Fernbedienung?" remoteController

while true; do
  read -p "KEYs der Konfiguration anzeigen?" answer
  case "$answer" in
    Yes|yes|Y|y) irsend LIST $remoteController ""
      ;;
    No|no|N|n|"") echo ""
      ;;
      *) echo "Parameter nicht erkannt"
      ;;
  esac
  read -p "Welcher KEY soll gesendet werden?" key
  case "$answer" in
    "") break
      ;;
    *) irsend SEND_ONCE $remoteController $key
      ;;
  esac

  echo ""
done

#echo "KEY_VOLUMEDOWN für 3 Sekunden drücken"
#irsend SEND_START $remoteController KEY_VOLUMEDOWN; sleep 3; irsend SEND_STOP $remoteController KEY_VOLUMEDOWN
