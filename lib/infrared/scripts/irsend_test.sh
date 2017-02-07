#!/bin/bash
#Sender testen

REMOTE_CONTROLLER="TV_TOSHIBA"

echo "KEYs der Konfiguration ausgeben"
irsend LIST $REMOTE_CONTROLLER ""

echo "KEY_0 einmalig betätigen"
irsend SEND_ONCE $REMOTE_CONTROLLER KEY_0

echo "KEY_VOLUMEDOWN für 3 Sekunden drücken"
irsend SEND_START $REMOTE_CONTROLLER KEY_VOLUMEDOWN; sleep 3; irsend SEND_STOP $REMOTE_CONTROLLER KEY_VOLUMEDOWN
