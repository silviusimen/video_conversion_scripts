#!/bin/bash


token="$1"

if [ "$token" == "" ] ; then
    echo "No token to remove"
    exit 1
fi

for f in *.mkv *.avi *.wmv *.mp4 *.srt; do 
    if [ -f "$f" ] ; then
        nf="$f"
        nf=$(echo "$nf" | sed "s/$token//" )

        if [ "$f" != "$nf" ] ; then
            echo mv "$f" "$nf" 
            mv "$f" "$nf" 
        else
            echo Keeping "$f"
        fi
    fi
done
ls -alFh
