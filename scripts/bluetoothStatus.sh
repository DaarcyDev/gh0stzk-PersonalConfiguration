#!/usr/bin/env bash
bluetoothStatus(){
bluetooth_status=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [ "$bluetooth_status" == "yes" ]; then
    echo "󰂯"
else
    echo "󰂲"
fi
}

bluetoothFirstDevice(){
    bluetoothDevice=$(bluetoothctl devices | awk '{print $3,$4,$5}'|sed -n '1p')
    bluetoothDeviceMAC=$(bluetoothctl devices | awk '{print $2}'|sed -n '1p')

    bluetoothctl connect $bluetoothDeviceMAC
    echo $bluetoothDevice $bluetoothDeviceMAC
}

bluetoothSecondDevice(){
    bluetoothDevice=$(bluetoothctl devices | awk '{print $3,$4,$5}'|sed -n '2p')
    bluetoothDeviceMAC=$(bluetoothctl devices | awk '{print $2}'|sed -n '2p')
    bluetoothctl connect $bluetoothDeviceMAC
    echo $bluetoothDevice $bluetoothDeviceMAC
}

case "$1" in
    --bluetoothStatus)
        bluetoothStatus;;
    --bluetoothFirstDevice)
        bluetoothFirstDevice;;
    --bluetoothSecondDevice)
        bluetoothSecondDevice;;
    *)
        echo "Error...";;
esac

