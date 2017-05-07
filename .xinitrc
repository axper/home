# Reload .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disk automounter
udiskie --tray &


# Keyboard layouts & disable caps lock
#setxkbmap -layout us,am,ru -variant ,phonetic-alt,phonetic -option 'grp:alt_space_toggle,caps:escape' &
setxkbmap -layout us,am -variant ,phonetic-alt -option 'grp:alt_shift_toggle,caps:escape' &

# keyboard delay and repeat rates
xset r rate 220 80

# Disable pc speaker beep
xset b off

# Load styles
xrdb ~/.Xresources

# Start i3
exec i3
