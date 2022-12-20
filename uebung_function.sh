#!/bin/bash

function rechnen {
    ergebnis=$(echo "scale=3;$grund / 1.19"|bc)
}

function drucken {
    echo "Brutto    :" $grund
    echo "Netto     :" $ergebnis
    echo "Steuer    :" $(echo "scale=2;$grund - $ergebnis" |bc)
}

if [ $# -eq 1 ]; then
    grund=$1
else
    grund="119.00"
fi

echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "+      Zahl ist Brutto         +"
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
rechnen
drucken

grund=$(echo "scale=3;$grund * 1.190 "|bc)

echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "+      Zahl ist Netto          +"
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
rechnen
drucken
