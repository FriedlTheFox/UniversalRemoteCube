Eine lircrc-Datei erstellen,
sudo nano /etc/lirc/lircrc
Dort beispielsweise diesen Inhalt reinkopieren:
begin
button = Taste1
prog = irexec
config = sh /home/pi/aktion.sh
flags = quit
end

Taste1 muss eine vorhandene Taste in der Datei lircd.conf sein.

Mit
irexec /etc/lirc/lircrc
wird irexec gestartet. Wird jetzt die Taste1 auf der Fernbedienung gedrückt, startet das Script aktion.sh.

Mit der Option -d wird der Daemon im Hintergrund gestartet
irexec -d /etc/lirc/lircrc

Wenn in der Datei /etc/init.d/lirc
START_IREXEC=true
steht, startet das sogar automatisch beim nächsten Systemstart wieder mit. (Wenn die Option -d für den Daemon verwendet wurde.)
