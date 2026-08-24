source $(dirname $0)/player_settings.sh # source of $PLAYERS

playerctl --player=$PLAYERS metadata --format '{{ artist }} - {{ title }}' --follow | while read -r line 
do
    state=$(playerctl --player=$PLAYERS status)
    if [ "$state" = "Playing" ] || [ "$state" = "Paused" ]; then
        # get_album_art.sh
        if [ ${#line} -ge 40 ]; then
            echo "${line:0:40}..."
        else
            echo $line
        fi
    else
        echo ""
    fi
done