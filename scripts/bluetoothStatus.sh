#!/usr/bin/env bash

bluetooth_status=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [ "$bluetooth_status" == "yes" ]; then
    echo "󰂯"
else
    echo "󰂲"
fi

