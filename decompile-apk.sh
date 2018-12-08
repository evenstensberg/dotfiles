#!/usr/bin/env bash

name="base.apk"

if [ -n "$1" ]; 
then
    name="$1"
fi

for i in $(adb shell pm list packages | awk -F':' '{print $2}'); do adb pull "$(adb shell pm path $i | awk -F':' '{print $2}')"; mv $name $i.apk 2&> /dev/null ;done
