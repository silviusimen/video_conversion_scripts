#!/bin/bash

find ./ -type f -size +2000M | while read file; do
    path="$(realpath "$file")"
    dir=$(dirname "$path")
    basefile=$(basename "$path")
    pushd "$dir" > /dev/null
        ~/git/video_conversion_scripts/reencode.sh "$basefile"
    popd > /dev/null
done
