playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}' --follow | while read -r line 
do
    state=$(playerctl --player=spotify status)
    if [ "$state" = "Playing" ] || [ "$state" = "Paused" ]; then
        echo "$line"
    else
        echo ""
    fi
done