FILENAME=$HOME'/screenshots/%Y-%m-%d_$wx$h.png'

if [[ $# == 0 ]]; then
	sc
	exit 0
fi

case $@ in
	'capture')
		scrot -e 'screenshot_notify.sh $f' -F $FILENAME -s=capture -f -l style=solid,width=3,opacity=200,color="#D699B6"
		;;
	'hide')
		scrot -e 'screenshot_notify.sh $f' -F $FILENAME -s=hide	-f -l style=solid,width=3,opacity=255,color="#000000"
		;;
	'hole') 
		scrot -e 'screenshot_notify.sh $f' -F $FILENAME -s=hole	-f -l style=solid,width=3,opacity=255,color="#000000"
		;;
	'blur')
		scrot -e 'screenshot_notify.sh $f' -F $FILENAME -s=blur,24 -f -l style=solid,width=3,opacity=200,color="#D699B6"
		;;
esac