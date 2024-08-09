#!/bin/bash

for d in *; do
    if [ -d "$d" ] ; then

	pushd "$d" > /dev/null
        for iso in *.iso *.ISO ; do
		    if [ -f "$iso" ] ; then
				~/git/video_conversion_scripts/iso2mp4.sh "$iso"
		    fi
		done
    popd > /dev/null
    fi 
done
