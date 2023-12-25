#!/bin/bash
set -o pipefail
filename="list.txt"
 
for line in $(cat "$filename")
do
    output=$( cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32 )
    yt-dlp $line --compat-options filename-sanitization --output "$output.%(ext)s" 2>&1 | tee -a log.txt
    res=$?
    if [ $res -ne 0 ]; then
        echo $line >> errors.txt
    fi
done
