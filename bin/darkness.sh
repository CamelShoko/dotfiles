#!/bin/bash
# @author: lbzhung
# @brief:  toggle the darkness of gnome terminal background

value=`gconftool -g /apps/gnome-terminal/profiles/Default/background_darkness`

if [ "$value" == "0"  ]; then
    gconftool -s -t float /apps/gnome-terminal/profiles/Default/background_darkness 0.8
else
    gconftool -s -t float /apps/gnome-terminal/profiles/Default/background_darkness 0
fi
