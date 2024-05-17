#!/bin/bash

for f in *.mkv *.avi *.wmv *.mp4 ; do 
    if [ -f "$f" ] ; then
        nf=$(echo $f | sed 's/) /-/' | sed "s/'//"  | sed 's/;/-/' )
        nf=$(echo $nf | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g' )
        nf=$(echo $nf | sed 's/x264//' )
        nf=$(echo $nf | sed 's/x265//' )
        nf=$(echo $nf | sed 's/.720p//' )
        nf=$(echo $nf | sed 's/webrip//' )
        nf=$(echo $nf | sed 's/aac//' )
        nf=$(echo $nf | sed 's/world//' )
        nf=$(echo $nf | sed 's/-recoded//' )
        if [ "$f" != "$nf" ] ; then
            echo mv "$f" "$nf" 
            mv "$f" "$nf" 
        else
            echo Keeping "$f"
        fi
    fi
done
