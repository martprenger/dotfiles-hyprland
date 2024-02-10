#!/bin/bash

symbol() {
    [ $(cat /sys/class/net/w*/operstate) = down ] && echo 󰖪  && exit
    echo 
}

name() {
  iwgetid -r
}

[ "$1" = "icon" ] && symbol

if [[ $1 == "name" || $1 == "class" ]]; then
  wifiname=$(name)
  echo "$wifiname"
fi
