#!/bin/bash


INFILE="$1"
WORKDIR=$(realpath ~/Videos/_convert)

if [ ! -f "$INFILE" ] ; then
    echo "input file not specified, exiting"
    exit 1
fi


if [ ! -d $WORKDIR/isomount/ ] ; then
    mkdir -p $WORKDIR/isomount/
fi

if mountpoint $WORKDIR/isomount/ ; then
    echo "umounting $WORKDIR/isomount/"
    sudo umount -f $WORKDIR/isomount/
fi

rm -f $WORKDIR/outfilelist.txt

sudo mount -o loop "$INFILE" $WORKDIR/isomount/

basefilename="${INFILE%.*}"


pushd $WORKDIR/isomount/VIDEO_TS/

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
        echo "Skipping $vob since size $sizemb MB is too small"
    fi
done

ffmpeg -loglevel error -stats -f concat -safe 0 -i $WORKDIR/outfilelist.txt -c copy $WORKDIR/$basefilename.mp4

popd

sudo umount $WORKDIR/isomount/
