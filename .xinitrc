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

# Start autocutsel (merges two X text select/paste clipboards)
if hash autocutsel 2>/dev/null; then
	autocutsel -fork &
	autocutsel -selection PRIMARY -fork &
fi

# Start i3
exec i3
