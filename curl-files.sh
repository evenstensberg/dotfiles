#!/usr/bin/env bash

# downloads all files to curr dir that is in the list

# usage ./curl-files https://my-website/ list.txt

for i in $(cat $2)
    do curl $1$i -O
done
