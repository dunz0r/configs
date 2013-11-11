#!/bin/bash

# {{{ Variables etc
# Init stuff
source /etc/profile
export MPD_USER=gabriel
# sets the path
PATH=$PATH:$HOME/bin:/usr/local/bin:/opt/java/bin:/usr/lib/perl5/vendor_perl/bin:/usr/dt/bin:/usr/games:$HOME/Utveckling/Pebble/arm-cs-tools/bin:$HOME/adt/tools:$HOME/adt/platform-tools
# shows a fortune upon login
printf "\n"
fortune
export PATH
export TODO_DIR="$HOME/Dropbox/todo/"

echo -e "\n$(uptime)\n"
ddate +'Today is %{%A, the %e of %B%}, in the YOLD %Y. %. %N%nCelebrate %H'
echo -e '\x28\xE3\x81\xA5\xEF\xBD\xA1\xE2\x97\x95\xE2\x80\xBF\xE2\x80\xBF\xE2\x97\x95\xEF\xBD\xA1\x29\xE3\x81\xA5'

# Sets the Mail env
MAIL=/var/spool/mail/gabriel && export MAIL

# set umask
umask=0007
#set show-all-if-ambiguos on
source ~/.aliasrc
# source completion for git
# Set some variables
export WINEARCH=win32
PROMPT_COMMAND=prompt_command
export LESS="-R -P ?f%f(?b%bb/?B%B Byte)Line %lb of %L %pb\% ?eEOF"
EDITOR=/usr/bin/vim
MPD_PORT=6600
MPD_HOST=cocks@localhost
PAGER=`which less`
GREP_OPTIONS='--colour=auto'

#export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"
export LC_NUMERIC="sv_SE.UTF-8"
export LC_TIME="sv_SE.UTF-8"
export LC_COLLATE="sv_SE.UTF-8"
export LC_MONETARY="sv_SE.UTF-8"
export LC_MESSAGES="sv_SE.UTF-8"
export LC_PAPER="sv_SE.UTF-8"
export LC_NAME="sv_SE.UTF-8"
export LC_ADDRESS="sv_SE.UTF-8"
export LC_TELEPHONE="sv_SE.UTF-8"
export LC_MEASUREMENT="sv_SE.UTF-8"
export LC_IDENTIFICATION="sv_SE.UTF-8"
export LC_ALL=
export LANG=C
# Make python perdy
PYTHONSTARTUP="$HOME/.pythonrc"
# Set the options for the historyfile
shopt -s histappend
# for column width and such
shopt -s checkwinsize
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=10000
# Colours in ma term
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;33m")
export LESS_TERMCAP_me=$(printf "\e[1;34m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;47;30m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[0;36m")
# make ls nicer
LS_OPTIONS='--color=auto'
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;*.htm=00;31:*.html=00;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.qt=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.mp3=01;35:*.mpc=00;36:*.ogg=00;36:*.wav=00;36:*.mid=00;36:*.midi=00;36:*.au=00;36:*.flac=00;36:*.aac=00;36:*.torrent=00;31:*.rar=01;31:*.smc=00;36:*.xm=00;36:*.mod=00;36:*.c=00;34:*.h=00;31'

export HISTSIZE HISTFILESIZE HISTCONTROL LS_COLORS GREP_OPTIONS PAGER LESS MPD_HOST MPD_PORT PROMTP_COMMAND EDITOR VISUAL LS_OPTIONS GREP_COLOR PYTHONSTARTUP LANGUAGE

# }}}

#{{{ Functions
# {{{ Alternative prompt
prompt_command () {
	local rts=$?
	local        BLUE="\[\033[0;34m\]"
	local  LIGHT_GREY="\[\033[0;37m\]"
	local LIGHT_GREEN="\[\033[1;32m\]"
	local  LIGHT_BLUE="\[\033[1;34m\]"
	local  LIGHT_CYAN="\[\033[1;36m\]"
	local        CYAN="\[\033[0;36m\]"
	local      YELLOW="\[\033[0;33m\]"
	local LIGHT_YELLOW="\[\033[1;33m\]"
	local       WHITE="\[\033[1;37m\]"
	local	     GREY="\[\033[1;30m\]"
	local         RED="\[\033[0;31m\]"
	local  BRIGHT_RED="\[\033[1;31m\]"
	local   NO_COLOUR="\[\033[0m\]"
	local       GREEN="\[\033[0;32m\]"

	# change colour of hostname depending on host
	case $HOSTNAME in
		inger)
			local HOST_COLOUR=$YELLOW
			;;
		gertrud)
			local HOST_COLOUR=$BRIGHT_RED
			;;
		lillemor)
			local HOST_COLOUR=$GREEN
			;;
		*)
			local HOST_COLOUR=$CYAN
			;;
	esac

	local g=$(git_prompt_info)
	local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
	# pwd max length L, prefix shortened pwd with m
	local L=45 m='<'
	[ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
	local w="${GREEN}${m}${YELLOW}${w:$n}${NO_COLOUR}" ; } \
		||   local w="${YELLOW}${w}${NO_COLOUR}"
	# different colors for different return status
	[ $rts -eq 0 ] && \
		local p="${GREY}>${LIGHT_GREEN}>${LIGHT_GREEN}>${NO_COLOUR}" || \
		local p="[${BRIGHT_RED}${rts}${NO_COLOUR}${LIGHT_GREY}>${RED}>${BRIGHT_RED}>${NO_COLOUR}"
	PS1="${LIGHT_CYAN}\u${NO_COLOUR} at ${HOST_COLOUR}\h${NO_COLOUR} in ${w} [${BLUE}\j${NO_COLOUR}] ${g}\n${p} "

	case $TERM in
		xterm*|rxvt*)
			echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
			trap 'printf "\e]2;%s\a" "$(echo "${USER}@${HOSTNAME}:${PWD/$HOME/~}:$BASH_COMMAND")" > /dev/tty' DEBUG
			;;
		*)
			;;
	esac


	}
	# }}}
	# This is the main function for the prompt#{{{
	function pprom2 {
	# Capture the exit status
	ESTATUS=$?

	local        BLUE="\[\033[0;34m\]"
	local  LIGHT_GREY="\[\033[0;37m\]"
	local LIGHT_GREEN="\[\033[1;32m\]"
	local  LIGHT_BLUE="\[\033[1;34m\]"
	local  LIGHT_CYAN="\[\033[1;36m\]"
	local        CYAN="\[\033[0;36m\]"
	local      YELLOW="\[\033[0;33m\]"
	local LIGHT_YELLOW="\[\033[1;33m\]"
	local       WHITE="\[\033[1;37m\]"
	local	     GREY="\[\033[1;30m\]"
	local         RED="\[\033[0;31m\]"
	local  BRIGHT_RED="\[\033[1;31m\]"
	local   NO_COLOUR="\[\033[0m\]"
	local       GREEN="\[\033[0;32m\]"

	if [ $UID != 0 ]; then
		WARNCOL=$GREEN
	else
		WARNCOL=$RED
	fi

	# sets the titlebar if we are in an xterm
	case $TERM in
		xterm*|rxvt*)
			TITLEBAR="\[\033]0;term:$0::\h:$PWD\007\]"
			trap 'printf "\e]2;%s\a" "$(echo "term:$0::$HOSTNAME:$PWD:$BASH_COMMAND")" > /dev/tty' DEBUG
			LINE=$(asciiecho q)
			ULINE=$(asciiecho lq)
			LLINE=$(asciiecho mq)
			ARROW=$(asciiecho z)
			;;
		*)
			TITLEBAR=""
			LINE="-"
			LLINE=""
			ULINE=""
			ARROW=">"
			;;
	esac

	# change colour of hostname depending on host
	case $HOSTNAME in
		inger)
			local HOSTCOLOUR=$WHITE
			;;
		gertrud)
			local HOSTCOLOUR=$BRIGHT_RED
			;;
		ulug)
			local HOSTCOLOUR=$GREEN
			;;
		*)
			local HOSTCOLOUR=$CYAN
			;;
	esac
	# sets the color to red if exitstatuts is anything but 0
	case $ESTATUS in
		0)
			local	ECOLOR="\[\033[1;32m\]"
			;;
		*)
			ECOLOR="\[\033[1;31m\]"
			;;
	esac
	# the prompt starts here
	#PS1="$TITLEBAR$GREY<$WHITE\j$GREY>$WHITE-$GREY<$WHITE\w$GREY>-<$HOSTCOLOUR$(hostname)$GREY>\n\
		#PS1="$TITLEBAR$GREY<$WHITE\j$GREY>$WHITE-$GREY<$WHITE\w$GREY>-<$HOSTCOLOUR$(hostname)$GREY>\n\
		##$WHITE[$ECOLOR$ESTATUS$NO_COLOUR$WHITE]$GREY-$WHITE[$CYAN$(__git_ps1 " %s")$WHITE]$GREY$WARNCOL\$$NO_COLOUR:>$NO_COLOUR "
	#PS2="-]$GREEN#$WHITE>$NO_COLOUR "
	#PS4='+ '
	PS1="$TITLEBAR\
		$GREY$ULINE[$ECOLOR$ESTATUS\
		$GREY]$GREY$LINE[\
		$WHITE\W$GREY]\
		$(__git_ps1 " %s"$LINE)[$HOSTCOLOUR\h$GREY]\n\
		$LLINE$LINE$LIGHT_GREY\$$GREY»$NO_COLOUR "

	PS2="$LIGHT_YELLOW$LINE$YELLOW$LINE$GREY$LINE$ARROW$NO_COLOUR "
}
#}}}
# checks the current tty#{{{
function ttycheck
{
	temp=$(tty) ; echo ${temp:5}
}
#}}}
# asciiecho#{{{
function asciiecho
{
	echo -e "\033(0$1\033(B"
}
#}}}
# mpc shuffle thingie#{{{
function mpsa()
{
	mpc search $1 "$2" | shuf -n $3 | mpc add
}
#}}}
# Wiki lookup function#{{{
function wiki
{
	dig +short txt $1.wp.dg.cx
}
#}}}
# {{{ Git functions!
function git_prompt_info() {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "[${ref#refs/heads/}$(parse_git_dirty)]"
    }

    parse_git_dirty () {
	    gitstat=$(git status 2>/dev/null | grep '\(# Untracked\|# Changes\|# Changed but not updated:\)')

	    if [[ $(echo ${gitstat} | grep -c "^# Changes to be committed:$") > 0 ]]; then
		    echo -n "!"
	    fi

	    if [[ $(echo ${gitstat} | grep -c "^\(# Untracked files:\|# Changed but not updated:\)$") > 0 ]]; then
		    echo -n "?"
	    fi

	    if [[ $(echo ${gitstat} | wc -l | tr -d ' ') == 0 ]]; then
		    echo -n "."
	    fi
    }

    #
    # Will return the current branch name
    # Usage example: git pull origin $(current_branch)
    #
    function current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}
# }}}
# {{{ Stream a file with cvlc
function hstream() {
cvlc -vv "$1" --sout '#transcode{vcode=mp4v,acodec=mpga,vb=800,ab=128}:standard{access=http,mux=ogg,dst=10.0.0.2:8000}'
}
# }}}
#{{{ Upload an image to server
function imgupl()
{
	if [ -z $2 ]; then
		name=$(basename "$1")
		scp -C -q "$1" hax0r:/www/docs/hax0r.se/files/img/
		echo "http://hax0r.se/files/img/$name"
	else
		name=$(basename $2)
		scp -C -q "$2" hax0r:/www/docs/hax0r.se/files/img/$1/
		echo "http://hax0r.se/files/img/$1/$2"
	fi
}
#}}}
# }}}

