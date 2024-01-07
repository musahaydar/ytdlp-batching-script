#!/bin/bash
set -o pipefail
filename="list.txt"
rename=false

while getopts ":r" flag; do
  case $flag in
  r)
    rename=true
    ;;
  \?)
    echo "Invalid arguments"
    exit 1
    ;;
  esac
done
 
for line in $(cat "$filename")
do
  if [ "$rename" = true ] ; then
    output=$( cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32 )
    yt-dlp $line --compat-options filename-sanitization --output "$output.%(ext)s" 2>&1 | tee -a log.txt
    res=$?
  else 
    yt-dlp $line --compat-options filename-sanitization 2>&1 | tee -a log.txt
    res=$?
  fi
  if [ $res -ne 0 ]; then
    echo $line >> errors.txt
  fi
done
