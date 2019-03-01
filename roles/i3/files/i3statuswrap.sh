#!/bin/bash

i3status | (read line && echo $line && read line && echo $line && while :
do
  read line
  mem=$(~/.config/i3/mem.sh)
  dat="[{ \"full_text\": \"${mem}\" },"
  echo "${line/[/$dat}" || exit 1
done)
