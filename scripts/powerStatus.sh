#!/usr/bin/env bash

powerStatus=$(upower -d | grep "percentage" | head -n 1 | awk '{print $2}')
powerStatusCharging=$(upower -d | grep "state" | head -n 1 | awk '{print $2}')
iDIR="$HOME/.config/bspwm/assets"

get_icon(){
    if [ "$powerStatus" == "10%" ]; then
         icon="$iDIR/low-battery.png"
    elif [ "$powerStatus" == "20%" ]; then
         icon="$iDIR/low-battery.png"
    elif [ "$powerStatus" == "100%" ]; then
         icon="$iDIR/full-battery.png"
    fi
}

time=$(upower -d | grep "time to empty" | head -n 1)
get_icon
if [ "$powerStatus" == "10%" ]; then
    if [ "$powerStatusCharging" == "discharging" ]; then
        timeout 3 dunstify -i "$icon" "10% Battery" -u low "$time"
    fi

elif [ "$powerStatus" == "20%" ]; then 
    if [ "$powerStatusCharging" == "discharging" ]; then
        timeout 3 dunstify -i "$icon" "20% Battery" -u low "$time"
    fi
  
elif [ "$powerStatus" == "100%" ]; then
    if [ "$powerStatusCharging" == "discharging" ]; then
        timeout 3 dunstify -i "$icon" "100% Battery" -u low "$time"
    fi
fi
