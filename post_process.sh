#!/bin/bash

if [ $# -ne 2 ] 
then
  echo "Usage: $0 <file.gcode> <spindle rpms>" 
  echo "Output file will be called as input file but with _postprocessed as prefix"
  echo "Example: $0 file.gcode 12000"
  echo "Would output a file called file_postprocessed.gcode"
  exit
fi

if [ ! -f $1 ]
then
  echo "$1 is not a file or does not exist"
  exit
fi

if [ $2 -lt 0 ]
then
  echo "negative rpms are not a good idea"
fi


# $1 => file_in
# $2 => rpm
feed_rapids='F10000'

cat $1 | sed '/^(/ d' \
| sed '/^T0 M6/ d' \
| sed '/^G17/ d' \
| sed '/^M5/ d' \
| sed '/^M30/ d' \
| sed "s/M3/M3 S$2\nG4 S3/g" \
| sed "/^G0/ s/.$/ $feed_rapids/" \
| sed "s/G21 G90 G40/G90/g" \
| sed "/^G94/ d" \
| sed 's|Y| Y|g' \
| sed 's|Z| Z|g' \
| sed -e '/^$/ d' \
> `echo $1 | sed 's/.gcode/_postprocessed.gcode/g'`

