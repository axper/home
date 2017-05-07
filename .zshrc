source /etc/profile


###### Zsh settings ######
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
setopt nomatch
#setopt completealiases
setopt beep
unsetopt appendhistory autocd extendedglob notify
bindkey -v
bindkey "^?" backward-delete-char # backspace deletes chars in vi mode
zstyle :compinstall filename '/home/void/.zshrc'
autoload -Uz compinit
compinit


###### Environtment vars ######
# see .zshrc (and .xinitrc)

###### Aliases ######
# pacman
alias pacs='pacman -Ss'
alias pacu='sudo pacman -Syu'
#alias pacu='sudo pacman -Sy linux-headers && sudo pacman -Su'
alias pac='sudo pacman -S'
alias pacql='pacman -Ql'
alias pacqs='pacman -Qs'
alias pacr='sudo pacman -R'
alias pacqm='pacman -Qm'
alias pacqo='pacman -Qo'
alias pacqi='pacman -Qi'
alias pacqs='pacman -Qs'
alias pacsi='pacman -Si'
# ls
alias ls='ls --color=always --group-directories-first'
alias ll='ls -l --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -lAh --group-directories-first'
# other
alias grep='grep --color=always'
alias v='gvim'
alias p='ps -ux'
# Write command history, as typing 'S' in ranger erases it
#alias ra='fc -W && ranger'
#alias a='fc -W && ranger'
alias pwgen='pwgen -yc'
alias s='sudo '
alias sv='sudo -E gvim '
alias sudo='sudo '
alias cal='cal -m'
alias updatedb='sudo updatedb'
#alias d='xterm -e "cd $PWD; zsh" &'
alias d='urxvt &'
alias y='yaourt'
alias k='kill -SIGTERM'
alias kk='kill -SIGKILL'
alias reboot='sudo reboot'
alias cls='reset -Q'
alias reset='reset -Q'
alias rsync='rsync -h --progress'
alias c='systemctl'
alias sc='sudo systemctl'
# Skype - also see .scripts
#alias skype='xhost +local: && sudo -u skype /usr/bin/skype'
alias gdb='gdb -quiet' # disable startup message
alias u='udiskie-umount'
alias wvdial='sudo eject /dev/sr1 && sleep 1 && sudo wvdial'
alias g='surfraw google'
# Don't forget the prefix, usually /24
alias discover='nmap -sP'
alias tra='trs {=hy}'
alias trr='trs {=ru}'
alias tre='trs {=en}'
alias ru="setxkbmap -layout us,am,ru -variant ,phonetic-alt,phonetic -option 'grp:alt_shift_toggle,caps:escape'"
alias noru="setxkbmap -layout us,am -variant ,phonetic-alt -option 'grp:alt_shift_toggle,caps:escape'"
alias eclimd="/usr/share/eclipse/eclimd"
alias m='man2archwiki'
#alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf3\""
alias nexus='jmtpfs -o allow_other /media/nexus'
alias nexus-umount='fusermount -u /media/nexus'


###### Colored man pages ######
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


###### Prompt style ######
autoload -U colors && colors
PROMPT="%{$fg_bold[blue]%}%~  %{$reset_color%}"


###### Terminal title ######
# From https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc
#case $TERM in
#  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
#    precmd () {
#    	print -Pn "\e]0;%~\a"
#		# Notify
#		if ! [[ -z $CMD_START_DATE ]]; then
#			CMD_END_DATE=$(date +%s)
#			CMD_ELAPSED_TIME=$(($CMD_END_DATE - $CMD_START_DATE))
#			CMD_NOTIFY_THRESHOLD=100
#
#			if [[ $CMD_ELAPSED_TIME -gt $CMD_NOTIFY_THRESHOLD ]]; then
#				#print -n '\a'
#				#notify-send 'Job finished' "The job \"$CMD_NAME\" has finished."
#				#if [[ $CMD_NAME -ne "ra" ]]; then
#					#espeak "completed command ${CMD_NAME}" 2>/dev/null &>/dev/null
#					espeak "completed command ${CMD_NAME}" 2>/dev/null
#				#fi
#			fi
#		fi
#    }
#    preexec () {
#		print -Pn "\e]0;%~ ($1)\a"
#		# Notify
#		CMD_START_DATE=$(date +%s)
#		CMD_NAME=$1
#	}
#    ;;
#esac


###### Extract any archive ######
extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


###### Disown jobs that end with & ######
precmd_disown() {
  emulate -L zsh
  setopt extendedglob
  local job match mbegin mend

  jobs | while read job; do
    if [[ $job = \[(#b)([[:digit:]]##)\]*running* ]]; then
      disown %$match[1]
    fi
  done
}
autoload -U add-zsh-hook
add-zsh-hook precmd precmd_disown


###### Command not found ######
#source /usr/share/doc/pkgfile/command-not-found.zsh
#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh


###### Xterm tab width ######
#env TERM=linux setterm -regtabs 4


###### Ranger: check if already running ######
# Call only this function if you want to open ranger
ra() {
	if [ -z "$RANGER_LEVEL" ]
	then
		ranger
	else
		exit
	fi
}


###### Syntax highlighting ######
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


###### SSH keys ######
#envoy -t ssh-agent
#source <(envoy -p)


source ~/.zshenv
