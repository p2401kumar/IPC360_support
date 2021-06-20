LOC="/home/pi/Desktop/"

CAM1=0
CAM2=0

while true; 
do 
	#python sendMessage.py "Checking both Cams" "logGroup"
	echo 
	echo 
	echo "loop over $CAM1 and $CAM2"
	echo 
	echo 

	TIME=`date +%s`

	# Required rtsp links
	ffmpeg -y -frames 1 "snapshot1-$TIME.png" -i rtsp://192.168.x.x/realmonitor	
	ffmpeg -y -frames 1 "snapshot2-$TIME.png" -i rtsp://192.168.x.x/realmonitor	
	
	#####################################################################################################################
	if [ ! -f snapshot1-$TIME.png -a $CAM1 -lt 4 ]; then
		((CAM1++))
	fi
		
	if [ ! -f snapshot2-$TIME.png -a $CAM2 -lt 4 ]; then
		((CAM2++))
	fi

	#####################################################################################################################
	if [ $TEMPLE -eq 3 ]; then
		python sendMessage.py "Temple Cam is Disconnected please check" "logGroup"
		((CAM1++))
		echo "CAM2 EQ 3"
	elif [ -f snapshot1-$TIME.png -a $CAM1 -eq 4 ]; then
		python sendMessage.py "Temple Cam is Connected" "logGroup"
		CAM1=0
	elif [ -f snapshot1-$TIME.png ]; then
		CAM1=0
	fi


	if [ $CAM2 -eq 3 ]; then
		python sendMessage.py "Car Cam is Disconnected please check" "logGroup"
		((CAM2++))		
		echo "CAM2 EQ 3"
	elif [ -f snapshot2-$TIME.png -a $CAR -eq 4 ]; then
		python sendMessage.py "Car Cam is Connected" "logGroup"
		CAM2=0
	elif [ -f snapshot2-$TIME.png ]; then
		CAM2=0
	fi
	#####################################################################################################################
	

	find . -name "snapshot*" -exec rm -rf {} \;

	sleep 10
done


