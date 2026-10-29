WID=$(niri msg -j workspaces | jq '.[] | select(.is_focused) | .id')

WINDOWS=$(niri msg -j windows | jq "[.[] | select(.workspace_id == $WID)] | sort_by(.layout.pos_in_scrolling_layout[0]) | .[] | if .is_focused then \"*\\(.app_id)\" else .app_id end")

OUTPUT=""
COUNT=0

for window in $WINDOWS
do
    window=${window:1:-1}
    [ "${window:0:1}" == "*" ] && window="<span color='#a7c080'>${window:1}</span>"
    if [ $COUNT -eq 0 ]; then OUTPUT="$window"
    else
    	OUTPUT="$OUTPUT, $window"
    fi
    let COUNT++
done

echo $OUTPUT
