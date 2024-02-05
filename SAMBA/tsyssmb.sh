#!/bin/bash
#set -x
# Thomas Schilling 2024
# CRON Script Kapazitaet aus allen Shares in smb.conf
current_share=""
current_path=""
ablage="/etc/samba/PRNSMB/"
smbconf="/etc/samba/smb.conf"
if [ ! -d $ablage ]; then
    mkdir -p $ablage
fi
while IFS= read -r zeile; do
    if [[ $zeile =~ ^[[:space:]]*path[[:space:]]*=[[:space:]]*/(.+) ]]; then
        current_path="/${BASH_REMATCH[1]}"
        flnm=$(echo "$current_path" | sed 's/\//_/g')
		./tsys4 $current_path > $ablage$flnm.txt
    fi
done < <(cat $smbconf)
