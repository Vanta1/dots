# Get your latitude and longitude quick n easy

LAT_LONG="$(curl --silent ipinfo.io | jq .loc)"
echo "${LAT_LONG:1:-1}"
