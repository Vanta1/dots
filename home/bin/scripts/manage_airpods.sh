AIRPODS="2C:76:00:D4:10:82"
DEVICES=$(bluetoothctl devices Connected)

if [[ "$DEVICES" == *"$AIRPODS"* ]]; then
    bluetoothctl disconnect $AIRPODS
    bluetoothctl block $AIRPODS
else
    bluetoothctl unblock $AIRPODS
    bluetoothctl connect $AIRPODS
fi
