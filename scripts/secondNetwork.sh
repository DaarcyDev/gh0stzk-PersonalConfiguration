#!/usr/bin/env bash
secondNetwork=$(iwctl station wlan0 get-networks | awk 'NR>1 && NF>0 {print $1, $4}' | awk -F '\n' '/^\s*[a-zA-Z0-9]/ { print $1 }' | sed -n '2p' | xargs)

iwctl station wlan0 connect "$secondNetwork"

echo iwctl station wlan0 connect "$secondNetwork"
