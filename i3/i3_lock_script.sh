#!/bin/bash
revert() {
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 5 5 5
# i3lock -n
xrandr | grep -e 'HDMI1 connected' -e 'HDMI2 connected' -e 'HDMI-1 connected' -e 'HDMI-2 connected';
if (( $? == 0 ))
then
    i3lock --image=$HOME/Pictures/wallpaper/screenlock_image.png --tiling --pointer=default --ignore-empty-password --show-failed-attempts -n
else
    i3lock --image=$HOME/Pictures/wallpaper/IMG_20171126_175649.png --tiling --pointer=default --ignore-empty-password --show-failed-attempts -n
fi

revert
