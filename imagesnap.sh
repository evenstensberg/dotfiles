#!/bin/sh
# usage: /usr/local/sbin/sleepwatcher --verbose --sleep ~/.wakeup 

DATE=$(date "+%Y-%m-%d_%H-%M-%S")
imagesnap "/Users/evenstensberg/Documents/snap/$DATE.jpg"
