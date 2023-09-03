#!/usr/bin/env bash

bluetoothDevice=$(bluetoothctl devices | awk '{print $3,$4,$5}'|sed -n '2p')
bluetoothDeviceMAC=$(bluetoothctl devices | awk '{print $2}'|sed -n '2p')

bluetoothctl connect $bluetoothDeviceMAC
echo $bluetoothDevice $bluetoothDeviceMAC
