#!/usr/bin/env bash
firstNetwork(){
Network=$(iwctl station wlan0 get-networks | awk 'NR>1 && NF>0 {print $1, $4}' | awk -F '\n' '/^\s*[a-zA-Z0-9]/ { print $1 }' | sed -n '1p' | xargs)
iwctl station wlan0 connect "$Network"
echo iwctl station wlan0 connect "$Network"
}

secondNetwork(){
Network=$(iwctl station wlan0 get-networks | awk 'NR>1 && NF>0 {print $1, $4}' | awk -F '\n' '/^\s*[a-zA-Z0-9]/ { print $1 }' | sed -n '2p' | xargs)
iwctl station wlan0 connect "$Network" 
echo iwctl station wlan0 connect "$Network"
}

thirdNetwork(){
Network=$(iwctl station wlan0 get-networks | awk 'NR>1 && NF>0 {print $1, $4}' | awk -F '\n' '/^\s*[a-zA-Z0-9]/ { print $1 }' | sed -n '3p' | xargs)
iwctl station wlan0 connect "$Network"
echo iwctl station wlan0 connect "$Network"
}

case "$1" in
    --firstNet)
        firstNetwork;;
    --secondNet)
        secondNetwork;;
    --thirdNet)
        thirdNetwork;;
    *)
        echo "Error...";;
esac
