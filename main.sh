#!/bin/bash

function Title {
    echo " _    _           _       _            "
    echo "| |  | |         | |     | |           "
    echo "| |  | |_ __   __| | __ _| |_ ___ _ __ "
    echo "| |  | |  _ \ / _  |/ _ | __/  _ \  __|"
    echo "| |__| | |_) | (_| | (_| | ||  __/ |   "
    echo " \____/| .__/ \__,_|\__,_|\__\___|_|   "
    echo "       | |                             "
    echo "       |_|                             "
}

function Revert {
    clear
    Title
    echo ""
}

Title

str1=$(cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
str2="Manjaro Linux"

if [ "$str1" == "$str2" ]; then
    echo ""
    echo ":: Upgrading system packages"

    Revert

    echo ":: Starting pamac upgrade"
    echo ""
    sudo pamac update

    Revert

    echo ":: Starting pacman upgrade"
    echo ""
    sudo pacman -Syu

    Revert

    echo ":: Starting snap upgrade"
    echo ""
    sudo snap refresh

    Revert

    echo ":: Starting yay upgrade"
    echo ""
    sudo yay

    Revert

    echo ":: Finished upgrading packages"
    echo ""
else
    echo ""
    echo ":: Unsupported operating system you need ${str2}"
    echo ""
fi
