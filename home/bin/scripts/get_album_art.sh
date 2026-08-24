url=$(playerctl --player=spotify metadata mpris:artUrl)
if [ -z $url ]; then
    continue
else
    curl -s $url -o /tmp/album_art.jpeg
fi