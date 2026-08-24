source $(dirname $0)/player_settings.sh # source of $PLAYERS

playerctl --player=$PLAYERS status --follow | while read -r line 
do
    state=$(playerctl --player=$PLAYERS status)
    if [ "$state" = "Playing" ]; then
        echo "| ⏸"
    elif [ "$state" = "Paused" ]; then 
        echo "| ⏵"
    else
        echo ""
    fi
done