playerctl --player=spotify status --follow | while read -r line 
do
    state=$(playerctl --player=spotify status)
    if [ "$state" = "Playing" ]; then
        echo "|·⏸"
    elif [ "$state" = "Paused" ]; then 
        echo "|·⏵"
    else
        echo ""
    fi
done