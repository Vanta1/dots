vol=`pactl get-sink-volume @DEFAULT_SINK@`
def=`echo $vol | cut -d " " -f 5`


if [ "$def" != " " ]; 
then
  echo $def
else 
  echo `echo $vol | cut -d " " -f 6`
fi
