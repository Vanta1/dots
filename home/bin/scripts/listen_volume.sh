update_volume() {
  eww update current_volume=$(get_volume.sh)
  eww update mute=$(pactl get-default-sink | xargs pactl get-sink-mute $1 | cut -d ' ' -f 2)
}

filter() {
  while read line; do 
    event_type=$(echo $line | cut -d ' ' -f 2)
    if [[ $event_type == "'change'" ]] then
      update_volume
    fi
  done
}

update_volume
pactl subscribe | filter
