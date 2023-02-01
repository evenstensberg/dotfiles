#!/usr/bin/env sh

# example sh ./mv-prop.sh "./myFolder" "mainObject" "objectProp"
search_dir=$1
prop=".$3 = .$2.$3"
for entry in "$search_dir"/*
do
  jq "$prop" "$entry" > INPUT.tmp && mv INPUT.tmp $entry && rm -rf INPUT.tmp
done