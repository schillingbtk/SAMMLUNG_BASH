#!/bin/bash
# set -x
# Thomas Schilling 2024
# dfree command
ablage="/etc/samba/PRNSMB/"
if [[ ! $# -eq 1 ]];
then
	echo "Nutze $0 <Verzeichnis>"
exit -9
fi
flnm=$(echo "$1" | sed 's/\//_/g')
if [ -e $ablage$flnm.txt ]; then
    cat $ablage$flnm.txt
else
    echo "0 0"
fi