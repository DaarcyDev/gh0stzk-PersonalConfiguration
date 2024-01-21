#!/usr/bin/env bash

powerStatus=$(upower -d | grep "percentage" | head -n 1 | awk '{print substr($2, 1, length($2)-1)}')
powerStatusCharging=$(upower -d | grep "state" | head -n 1 | awk '{print $2}')
iDIR="$HOME/.config/bspwm/assets"

get_icon() {
	if [ "$powerStatus" -le "20" ]; then
		icon="$iDIR/low-battery.png"
	elif [ "$powerStatus" -gt "80" ]; then
		icon="$iDIR/full-battery.png"
	fi
}

time=$(upower -d | grep "time to empty" | head -n 1)
timeFull=$(upower -d | grep "time to full" | head -n 1)
get_icon
if [ "$powerStatus" -le "20" ]; then
	if [ "$powerStatusCharging" == "discharging" ]; then
		timeout 3 dunstify -i "$icon" "Low Battery" -u low "$time"
	fi
elif [ "$powerStatus" -gt "80" ]; then
	if [ "$powerStatusCharging" == "charging" ]; then
		timeout 3 dunstify -i "$icon" "100% Battery" -u low "$timeFull"
	fi
fi
