if (( $EUID != 0 )) {
    [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} <= 3 )) &&
        exec startx 1>~/.xsession-errors 2>&1 &
}
