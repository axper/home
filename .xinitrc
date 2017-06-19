# Reload .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disk automounter
if hash udiskie 2>/dev/null; then
	udiskie --tray &
fi

# Keyboard layouts & disable caps lock
#setxkbmap -layout us,am,ru -variant ,phonetic-alt,phonetic -option 'grp:alt_space_toggle,caps:escape' &
setxkbmap -layout us,am -variant ,phonetic-alt -option 'grp:alt_shift_toggle,caps:escape' &

# keyboard delay and repeat rates
xset r rate 220 80

# Disable pc speaker beep
xset b off

# Load styles
xrdb ~/.Xresources

# Start dunst notification daemon
if hash dunst 2>/dev/null; then
	dunst &
fi

# Monitor layout
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --output DP-2 --primary --mode 1920x1080 --pos 0x0

# Start i3
exec i3
