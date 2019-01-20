#!/usr/bin/env bash


# ./hexdumpi.sh 0x07c00 0x07e00 add = add
# ./hexdumpi.sh 0x07c00 0x07e00 sub = subtract
# ./hexdumpi.sh 0x07e00 single = single arg
# ./hexdumpi.sh 0x07c00<selector> 0x07e00<offset> lin = linear address
# ./hexdumpi.sh 0x07c00<selector> 0x07e00<offset> rev = get offset

# link globally: 
# sudo ln -s pwd + /hexdumpi.sh /usr/local/bin/dumphexi
# dumphexi 0x07c00 0x07e00 sub = 512bytes

if [ "$3" == "sub" ]; 
then
    echo $(($2 - $1))
elif [ "$3" == "add" ]; 
then
    echo $(($1 + $1))
elif [ "$2" == "single" ]; 
then
    echo $(($1))
elif [ "$3" == "lin" ]; 
then
    val=$(( ($1 << 4) + $2))
    if [ "$4" == "hex" ];
    then
        printf '%x\n' $val
    else
        echo $val
    fi
elif [ "$3" == "rev" ]; 
then
   val=$(( $1 - ($2 << 4)))
    if [ "$4" == "hex" ];
    then
        printf '%x\n' $val
    else
        echo $val
    fi
fi