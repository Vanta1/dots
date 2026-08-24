LAPTOP_BRIGHTNESS=`brightnessctl -m | cut -d "," -f 4 | sed 's/.$//'`
ddcutil -d 1 setvcp 10 $LAPTOP_BRIGHTNESS