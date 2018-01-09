#!/bin/bash

# toggles the external monitor on/off in specified direction
IN="eDP1"
EXT="HDMI2"
DIRECTION="left"
if (xrandr | grep "$EXT disconnected")
then
    xrandr --output $IN --auto --output $EXT --off
else
    xrandr --output $IN --auto --primary --output $EXT --auto --$DIRECTION-of $IN
fi
