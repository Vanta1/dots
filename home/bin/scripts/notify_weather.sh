weather=$(curl -s 'wttr.in/Toronto?format=%C,%20feels%20like%20%f\nHumidity%20%h,%20Wind%20%w\nPrecipitation%20%p,%20UV%20%u\nSunrise%20%S,%20Sunset%20%s\nMoon%20phase%20%m,%20Day%20%M')
time=$(date +'%A, %B %d | %I:%M %p')
dunstify -t 30000 -a 'Weather in: Toronto, Ontario' "${time}" "${weather}"