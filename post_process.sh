#!/bin/bash

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

