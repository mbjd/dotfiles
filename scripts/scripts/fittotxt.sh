#!/bin/bash

if [ "$1" = -c ]; then
	echo 'index,rcr,date,time,valid,latitude,n/s,longitude,e/w,height,speed,heading,dsta,dage,pdop,hdop,vdop,nsat (used/view),sat info (sid-ele-azi-snr),distance,'
    echo ' 1   , 2 , 3  , 4  , 5   , 6      , 7 , 8       , 9 , 10   , 11  , 12    , 13 , 14 , 15 , 16 , 17 , 18             , 19                       , 20     ,'
	exit
fi

# iblue747 fields:
# index,rcr,date,time,valid,latitude,n/s,longitude,e/w,height,speed,heading,dsta,dage,pdop,hdop,vdop,nsat (used/view),sat info (sid-ele-azi-snr),distance,

# gpsbabel -i garmin_fit -f "$1" -o iblue747 -F /dev/stdout | tail +12 | tr '\t' , | tr -d 'º°'
# gpsbabel -i garmin_fit -f "$1" -x 'interpolate,distance=0.05km' -o iblue747 -F /dev/stdout | tail +2 | tr '\t' , | tr -d 'º°'
gpsbabel -i garmin_fit -f "$1" -x 'interpolate,time=1s' -o iblue747 -F /dev/stdout | tail +2 | tr '\t' , | tr -d 'º°'
shift

# if there are arguments left, run the script again
if [ $# -gt 0 ]; then
	exec "$0" "$@"
fi
