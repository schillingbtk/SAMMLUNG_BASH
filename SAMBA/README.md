Kapazitaetsanzeige im Windows Datei Explorer oder Linux Explorer ist oft nicht richtig,
wenn Verzeichnisse bzw. Partitionen eingehangen sind.

Das Script addiert die Gesamtkapazität und den verfügbaren Speicher und gibt das Ergebnis
ueber smb weiter (siehe Samba Wiki fuer Details). Das passiert im Script im Level 1 (depth)

Ist die Latenz des C Programms zu hoch, kann das sammeln der Daten per CRON mit tsyssmb.sh erfolgen.
Als dfree command in der smb.conf wird dann tsysprn.sh aufgerufen. Dieses liest schlicht
das vorbereitete TXT File.

Ausschnitt aus der smb.conf:

```
..............

[share]

    dfree command = /usr/local/samba/bin/tsys4

    oder

    dfree command = /usr/local/samba/bin/tsyssmb.sh

    eventuell auch gut fuer die Latenz:

    dfree cache time = 3600

..............

```