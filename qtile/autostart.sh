#!/usr/bin/env bash 
# festival --tts $HOME/.config/qtile/welcome_msg &
# lxsession &
# picom &
# /usr/bin/emacs --daemon &
# conky -c $HOME/.config/conky/qtile/doom-one-01.conkyrc
# volumeicon &
dunst &
nm-applet &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# set up keyboard and mouse
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
# xmodmap -e "pointer = 1 2 3"
# xinput --set-prop "PixArt USB Optical Mouse" "libinput Accel Speed" -0.6

# remove bip sound
xset b off

# keyboard autorepeat delay rate
xset r rate 300 25

# turn off Display Power Management Service (DPMS)
xset -dpms
setterm -blank 0 -powerdown 0

# turn off black Screensaver
xset s off

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
# xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen
nitrogen --restore &

picom --daemon

polybar default  --config=$HOME/.config/polybar/config.ini &
