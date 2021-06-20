DURATION=300
#Paste the location of working directory
LOC="/home/pi/"


while true; 
do 
	TIME=`date +%s`
	REC_YEAR=$(date '+%Y')
	REC_MONTH=$(date '+%m')
	REC_DATE=$(date '+%d')
	REC_NAME=$(date +"%H:%M")

	# logs on telegram
	python sendMessage.py "$REC_DATE-$REC_MONTH-$REC_YEAR-$REC_NAME:   Record started" "logs"

	# vlc is required
	# paste your rtsp link
	`timeout $DURATION vlc --intf rc rtsp://192.168.X.X/realmonitor --sout="file/ts:$LOC/go-$REC_NAME.mp4"`

	# allows vlc to run in background
	while true; 
	do 

		NOW_TIME=`date +%s`
		DUR=`expr $NOW_TIME - $TIME`

		if [ "$DUR" -gt $DURATION ]
		then
		    break
		fi

	#sleep 2
	done

	echo "DONE $REC_NAME"
	find $LOC/* -mmin +20 -exec rm {} \;
	find $LOC/* -size -160k -delete

	# rclone required for posting this record on Gdrive
	rclone copy $LOC GDrive:"/recording/$REC_YEAR/$REC_MONTH/$REC_DATE"	
	sleep 5

	python sendMessage.py "$REC_DATE-$REC_MONTH-$REC_YEAR-$REC_NAME:   Record completed" "logs"
	python sendMessage.py "***********************************" "logs"
done

