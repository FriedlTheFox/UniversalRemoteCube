#!/bin/bash
#lirc Bibliothek einrichten

# TODO Ticket #7
#echo "lirc Modul wird installiert"
#sudo apt-get install lirc

echo "lirc Modul einrichten"

# /etc/modules erweitern
grep -q "lirc_rpi" /etc/modules
if [ $? == 0 ]
  then
    echo -e "[ \033[33minfo\033[0m ] lirc_rpi bereits aktiviert"
  else
    sudo echo "lirc_rpi" >> /etc/modules
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] lirc_rpi Modul in /etc/modules eingetragen"
      else
        echo -e "[ \033[31merror\033[0m ] lirc_rpi Modul NICHT in /etc/modules eingetragen"
    fi
fi

grep -q "lirc_dev" /etc/modules
if [ $? == 0 ]
  then
    echo -e "[ \033[33minfo\033[0m ] lirc_dev bereits aktiviert"
  else
    sudo echo "lirc_dev" >> /etc/modules
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] lirc_dev Modul in /etc/modules eingetragen"
      else
        echo -e "[ \033[31merror\033[0m ] lirc_dev Modul NICHT in /etc/modules eingetragen"
    fi
fi

# /etc/lirc/hardware.conf ersetzen
if [ -e /etc/lirc/hardware_original.conf ]
  then
    echo -e "[ \033[33minfo\033[0m ] Backup /etc/lirc/hardware_original.conf bereits vorhanden"
  else
    sudo cp /etc/lirc/hardware.conf /etc/lirc/hardware_original.conf
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] Backup von /etc/lirc/hardware.conf in /etc/lirc/hardware_original.conf erstellt"
      else
        echo -e "[ \033[31merror\033[0m ] Backup von /etc/lirc/hardware.conf konnte NICHT erstellt werden"
        exit 1
    fi
fi

if [ -e ../configs/hardware.conf ]
  then
    sudo cp ../configs/hardware.conf /etc/lirc/hardware.conf
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] /etc/lirc/hardware.conf ersetzt"
      else
        echo -e "[ \033[31merror\033[0m ] /etc/lirc/hardware.conf NICHT ersetzt"
        exit 1
    fi
  else
    echo -e "[ \033[31merror\033[0m ] ../configs/hardware.conf ist NICHT vorhanden"
    exit 1
fi

# /boot/config.txt angepassen
if [ -e /boot/config_original.txt ]
  then
    echo -e "[ \033[33minfo\033[0m ] Backup /boot/config_original.txt bereits vorhanden"
  else
    sudo cp /boot/config.txt /boot/config_original.txt
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] Backup von /boot/config.txt in /boot/config_original.txt erstellt"
      else
        echo -e "[ \033[31merror\033[0m ] Backup von /boot/config.txt konnte NICHT erstellt werden"
        exit 1
    fi
fi

## Raspberry 3 Modul
#dtoverlay=lirc-rpi,gpio_in_pin=23,gpio_out_pin=22
## Raspberry 2 Modul
#dtoverlay=lirc-rpi,gpio_in_pin=18,gpio_out_pin=17
grep -q "#dtoverlay=lirc-rpi" /boot/config.txt
if [ $? == 0 ]
  then
    sudo sed -i -e 's/#dtoverlay=lirc-rpi/dtoverlay=lirc-rpi,gpio_in_pin=18,gpio_out_pin=17/' /boot/config.txt
    if [ $? == 0 ]
      then
        echo -e "[ \033[32mok\033[0m ] lirc-rpi in /boot/config.txt aktivieren"
      else
        echo -e "[ \033[31merror\033[0m ] String konnte NICHT ersetzt werden"
        exit 1
    fi
  else
    echo -e "[ \033[33minfo\033[0m ] lirc-rpi in /boot/config.txt bereits aktiviert"
fi
