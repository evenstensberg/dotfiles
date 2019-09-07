#!/usr/bin/env bash

# lists names of active io device names
ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'