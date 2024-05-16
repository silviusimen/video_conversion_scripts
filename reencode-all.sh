#!/bin/bash

for f in *.mkv *.mp4 *.wmv *.avi; do 
    ~/git/video_conversion_scripts/reencode.sh "$f"
done
