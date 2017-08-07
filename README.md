# MakerCAM2FABtotum
GCODE postprocessor from MakerCAM to FABtotum (FABlin)

Based on imarin flatcam2fabtotum (https://github.com/imarin2/Flatcam2FABtotum) post processor, is a CAM gcode post processor from Makercam generated gcode to FABlin (Marlin based) CNC firware.

# How to find them

https://github.com/alessiocavalieri/MakerCAM2FABtotum

# How to use

This is a bash shell script, so it is intended to be used in Linux/Unix or in any other bash compatible environment

It is used like this:

```
./post_process.sh filename.gcode 12000
```

the first parameter is the gcode file to convert. the second parameter is the RPMSs (rotation speed) of the spindle.

This will result in a new file named:

```
filename_postprocessed.gcode
```

being created. This file is now FABtotum compatible.

# Video tutorial: run bash on Windows

Via Git Desktop bash, you are able to run makercam2fabtotum script

[![FABtotum #13: videotutorial GCODE postprocessor, run bash under windows (makercam2fabtotum)](https://img.youtube.com/vi/qhC9xdRFaOA/0.jpg)](https://www.youtube.com/watch?v=qhC9xdRFaOA)

# Logs

2015_09_21 - v.0.1b

in whole file

* after the line that start with G0, add Fxxx (for example F10000) in order to speedup movement in rapids
in the head of file
* replace G21 G90 G40 with G90
* delete T0 M6 row
* delete G17 row

in the tail of file

* delete M5 row
* delete M30 row

