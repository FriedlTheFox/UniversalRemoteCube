#!/bin/bash
#Sender testen

read -p "Name der Fernbedienung?" REMOTE_CONTROLLER

echo "KEYs der Konfiguration lauten:"
irsend LIST $REMOTE_CONTROLLER ""

while true; do
    read -p "Welchen KEY möchtest du testen?" KEY
    echo $KEY " einmalig betätigen"
    irsend SEND_ONCE $REMOTE_CONTROLLER $KEY
    case $KEY in
        [E]* ) echo; break;;
        * ) echo "Abbrechen mit 'E'.";;
    esac
done

#echo "KEY_VOLUMEDOWN für 3 Sekunden drücken"
#irsend SEND_START $REMOTE_CONTROLLER KEY_VOLUMEDOWN; sleep 3; irsend SEND_STOP $REMOTE_CONTROLLER KEY_VOLUMEDOWN
