#!/bin/bash

# do not lock if sound running i.e. watching youtube
if [ $(grep -r "RUNNING" /proc/asound | wc -l) -eq 0 ]; then
  exec xautolock -detectsleep -time 5 -locker "/usr/bin/betterlockscreen --lock" -corners 0-0- -cornersize 30 &
fi

