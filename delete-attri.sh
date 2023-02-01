#!/usr/bin/env sh
search_dir=$1
prop="del($2)"
for entry in "$search_dir"/*
do
  jq $prop "$entry" > INPUT.tmp && mv INPUT.tmp $entry && rm -rf INPUT.tmp
done