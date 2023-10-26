#!/usr/bin/env bash
for file in $(ls *.zip); do unzip $file -d $(echo $file | cut -d . -f 1); done
