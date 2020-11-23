#!/bin/sh -e
maim /tmp/screen_locked.png
#pixelation 
mogrify -scale 10% -scale 1000% /tmp/screen_locked.png 
i3lock -i /tmp/screen_locked.png
