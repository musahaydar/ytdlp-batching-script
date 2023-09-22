#!/bin/bash
 
filename="list.txt"
 
for line in $(cat "$filename")
do
    output=$( cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32 )
    yt-dlp $line --compat-options filename-sanitization --output "$output.%(ext)s" | tee -a log.txt
done
