#!/bin/bash

find ./ -type d | while read d; do 
    pushd "$d"
    ~/git/video_conversion_scripts/fix_file_names.sh
    popd
done
