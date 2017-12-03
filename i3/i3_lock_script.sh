#!/bin/sh
revert() {
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 5 5 5
# i3lock -n
i3lock --image=/home/mahendra/Pictures/wallpaper/IMG_20171126_175649.png --tiling --pointer=default --ignore-empty-password --show-failed-attempts -n
revert
