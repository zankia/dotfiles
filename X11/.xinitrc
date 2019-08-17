#!/bin/sh

# invoke global X session script
. /etc/X11/Xsession &

#xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Palm Detection" 1
#xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Palm Dimensions" 2, 200
#xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Two-Finger Scrolling" 1 1
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xset r rate 256 64
setxkbmap -layout us -variant dvorak-alt-intl
xsetroot -solid "#4B0082"

eval `ssh-agent -s`

dunst&

exec i3
