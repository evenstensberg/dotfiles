#!/usr/bin/env bash

function printDonationHeader {
echo ''
echo -e '     \x1B[1m***\x1B[0m  Thank you for using my package! \x1B[1m***\x1B[0m'
echo ''
echo 'Please consider donating to me'
echo '     to help me maintain this package.'
echo ''
echo '  https://github.com/sponsors/evenstensberg'
echo ''
echo -e '                    \x1B[1m***\x1B[0m'
echo ''
exit 0
}

LANG=C DAY=$(date +"%a")

if [ "$DAY" == "Mon" ];
then
    printDonationHeader
fi