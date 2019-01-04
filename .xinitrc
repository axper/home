xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 110

# Reload .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disk automounter
#if hash udiskie 2>/dev/null; then
#	udiskie --tray &
#fi

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
if hash autocutsel 2>/dev/null; then
	autocutsel -fork &
	autocutsel -selection PRIMARY -fork &
fi

# Start NetworkManager applet
if hash nm-applet 2>/dev/null; then
	nm-applet &
fi

# Gnome Keyring
if hash gnome-keyring-daemon 2>/dev/null; then
	dbus-update-activation-environment --systemd DISPLAY
	eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export SSH_AUTH_SOCK
fi

# Polkit agent
if hash /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 2>/dev/null; then
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# Albert program launcher
if hash albert 2>/dev/null; then
	albert &
fi

# Compton
if hash compton 2>/dev/null; then
	compton -b -c &
fi

# Autolock the screen with slock after 1 minute
if hash xautolock 2>/dev/null && hash slock 2>/dev/null; then
	xautolock -time 1 -locker slock &
fi

# Start i3
exec i3
