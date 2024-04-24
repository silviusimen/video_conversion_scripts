#!/bin/bash

find ./ -type f -name '*.wmv'
find ./ -type f -name '*.iso'
find ./ -type f -name '*.wmv'
find ./ -type f -name '*.VOB'

echo "Files larger than 4G"
find ./ -type f -size +4000M 

echo "Files larger than 2G"
find ./ -type f -size -4000M -size +2000M

# echo "Files larger than 1G"
# find ./ -type f -size -2000M -size +1000M
