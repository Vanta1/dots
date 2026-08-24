# this could be a one liner but I split it out into this script to be more readable/editable

title="Weather in: Toronto, Ontario"

time=$(date +'%A, %B %d, %I:%M %p')

condition="%C,%20feels%20like%20%f"
humidity="Humidity%20%h,%20Wind%20%w"
precipitation="Precipitation%20%p,%20UV%20%u"
sunrise="Sunrise%20%S,%20Sunset%20%s"
moon="Moon%20phase%20%m,%20Day%20%M"
weather=$(curl -s "wttr.in/Toronto?format=${condition}\n${humidity}\n${precipitation}\n${sunrise}\n${moon}")

dunstify -t 30000 -a "${title}" "${time}" "${weather}"