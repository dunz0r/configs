fortune -a
ddate +'Today is %{%A, the %e of %B%}, in the YOLD %Y. %. %N%nCelebrate %H'
GOPATH="/home/gabriel/Development/go/"
export PATH=$HOME/bin:$GOPATH/bin:$PATH
source ~/.aliasrc
MANWIDTH=80 
LESSHISTFILE=-
PAGER=$(which less)
EDITOR=$(which vim)
LANG="en_GB.UTF-8"
LANGUAGE="en_GB.UTF-8"
LC_CTYPE="sv_SE.UTF-8"
LC_NUMERIC="sv_SE.UTF-8"
LC_TIME="sv_SE.UTF-8"
LC_COLLATE="sv_SE.UTF-8"
LC_MONETARY="sv_SE.UTF-8"
LC_MESSAGES="en_GB.UTF-8"
LC_PAPER="sv_SE.UTF-8"
LC_NAME="sv_SE.UTF-8"
LC_ADDRESS="sv_SE.UTF-8"
LC_TELEPHONE="sv_SE.UTF-8"
LC_MEASUREMENT="sv_SE.UTF-8"
LC_IDENTIFICATION="sv_SE.UTF-8"
LC_ALL="en_GB.UTF-8"

LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;*.htm=00;31:*.html=00;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.qt=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.pdf=00;35:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.mp3=01;35:*.mpc=00;36:*.ogg=00;36:*.wav=00;36:*.mid=00;36:*.midi=00;36:*.au=00;36:*.flac=00;36:*.aac=00;36:*.torrent=00;31:*.rar=01;31:*.smc=00;36:*.xm=00;36:*.mod=00;36:*.c=00;34:*.h=00;31:*.py=00;32:*.pyc=00;36'
QT_QPA_PLATFORMTHEME=gtk2
export LANG MANWIDTH LESSHISTFILE PAGER EDITOR GREP_OPTIONS LANGUAGE LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE\
LC_MONETARY LC_MESSAGES LC_PAPER LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LS_COLORS GOPATH QT_QPA_PLATFORMTHEME


if test -f $HOME/.gpg-agent-info && \
        kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
        GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
else
        eval `gpg-agent --daemon --no-grab $HOME/.gpg-agent-info`
fi

HISTSIZE=50000

export GPG_TTY=`tty`
export GPG_AGENT_INFO
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

PS1="\$(echo \$?): \w\n\u@\h:\$> "
