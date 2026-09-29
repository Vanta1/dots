status=$(sunsetr S | head -n 1 | cut -d " " -f 4)

if [[ "$status" == "default" ]]; then
    echo '{"text": "", "class": "day"}'
else
    echo '{"text": "", "class": "night"}'
fi
