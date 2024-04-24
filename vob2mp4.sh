#!/bin/bash

WORKDIR=$(realpath ~/Videos/_convert)

# rm -f $WORKDIR/outfilelist.txt

for vob in *.VOB ; do
    sizemb=$( stat -c %s $vob | awk '{print int($1/1000/1000) }' )
    if [ "$sizemb" -gt 20 ] ; then
        ofile="$WORKDIR/${vob%.VOB}.mp4"
        if [ ! -f $ofile ] ; then
            echo "file '$ofile'" >> $WORKDIR/outfilelist.txt
            ffmpeg -loglevel error -stats -i $vob -b:v 900k -b:a 128k $ofile
        else
            echo "Skipping $vob since $ofile is already present"
        fi
    else
        echo "Skipping $vob since size $sizemb is too small"
    fi
done

ffmpeg -loglevel error -stats -f concat -safe 0 -i $WORKDIR/outfilelist.txt -c copy $WORKDIR/output.mp4
