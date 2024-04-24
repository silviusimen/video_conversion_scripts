#!/bin/bash

VBPS=900k
ABPS=128k

file="$1"
if [ -f "$file" ] ; then
    ext=${file##*.}
    base="${file%.*}"
    ofile="${base}-recoded.mp4"
    if [ "$ext" = "mkv" ] ; then
        ofile="${base}-recoded.mkv"
    fi
    echo ffmpeg -loglevel error -stats -i $file -b:v ${VBPS} -b:a ${ABPS} $ofile
    ffmpeg -loglevel error -stats -i $file -b:v ${VBPS} -b:a ${ABPS} $ofile
fi
