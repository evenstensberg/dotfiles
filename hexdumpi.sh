#!/usr/bin/env bash


# ./hexdumpi.sh 0x00 0x01 1 = subtract
# ./hexdumpi.sh 0x00 0x01 1 = subtract
if [ "$3" == "sub" ]; 
then
    echo $(($2 - $1))
elif [ "$3" == "add" ]; 
then
    echo $(($1 + $1))
fi