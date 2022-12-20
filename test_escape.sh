#!/bin/sh
# Vorlage von Thomas
# Dezember 2022
function termclean {
    echo -e "\e[2J";
    # alles oberhalb Cursor
}

function termabsch {
    echo -en "\e[2;1H\e[K"
    ende=$(date)
    echo -e "\e[31m\e[2mSCRIPT RUN FROM $start TO $ende\e[0m"
    echo -e "\e[50;1H"
}

function termfuss {
    start=$(date)
    echo -ne "\e[2;1H\e[7m\e[5mRUNNING\e[0m"
    echo -ne " START "
    echo -ne "$start"
    echo -e "\e[5;1H"
}

clear
termfuss
echo "Test"
read -p "test"
termabsch
