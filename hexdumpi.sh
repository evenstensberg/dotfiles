#!/usr/bin/env bash


# ./hexdumpi.sh 0x07c00 0x07e00 add = add
# ./hexdumpi.sh 0x07c00 0x07e00 sub = subtract

# link globally: 
# sudo ln -s pwd + /hexdumpi.sh /usr/local/bin/dumphexi
# dumphexi 0x07c00 0x07e00 sub = 512bytes

if [ "$3" == "sub" ]; 
then
    echo $(($2 - $1))
elif [ "$3" == "add" ]; 
then
    echo $(($1 + $1))
fi