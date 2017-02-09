#!/bin/bash
#Installationsskript um eine arbeitsfähige
#Entwicklungsumgebung auf einem Raspberry Pi mit Raspian
#zur Verfügung zu stellen

################################################################
PACKAGESSYSTEM="git lirc"
PACKAGESPYTHON="python python-dev python-pylirc"
PACKAGESMISC=""

PROJECTFOLDER="Projekte"
GITHUBURL="https://github.com/FriedlTheFox/UniversalRemoteCube"
################################################################


echo "Aktualisiere Paketquellen"
sudo apt-get update

echo "Installiere benötigte Pakete"
sudo apt-get install $PACKAGES $PACKAGESPYTHON $PACKAGESMISC


echo "Projekt Ordner anlegen"
cd $HOME
mkdir -p $PROJECTFOLDER
cd ./$PROJECTFOLDER

echo "Hole GitHub Projekt"
git clone $GITHUBURL
