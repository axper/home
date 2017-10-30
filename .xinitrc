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

# Start autocutsel
autocutsel -fork

# Gnome Keyring
if hash gnome-keyring-daemon 2>/dev/null; then
	dbus-update-activation-environment --systemd DISPLAY
	eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export SSH_AUTH_SOCK
fi

# Start i3
exec i3
