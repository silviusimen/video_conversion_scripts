#!/bin/bash

VBPS=900k
ABPS=128k

file="$1"

if [ -f "$file" ] ; then
    is_recoded=$( echo "$file" | grep '\-recoded.' | wc -l)
    if [[ "$is_recoded" == "1"  ]] ; then
        echo "Skipping processing $file it is already recoded"
    else
        ext=${file##*.}
        base="${file%.*}"
        ofile="${base}-recoded.mp4"
        if [ "$ext" = "mkv" ] ; then
            ofile="${base}-recoded.mkv"
        fi
        if [ ! -f "$ofile" ] ; then
            echo ffmpeg -loglevel error -stats -i $file -map 0 -c:s copy -b:v ${VBPS} -b:a ${ABPS} "$ofile"
            echo "---------------------------------------------"
            # nice ffmpeg -loglevel error -stats -i "$file" -map 0 -c:s copy -b:v ${VBPS} -b:a ${ABPS} "$ofile"
        else
            echo "Skipping processing $file since $ofile is already present"
        fi
    fi
fi
