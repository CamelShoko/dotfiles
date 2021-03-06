# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='`a=$?;if [ $a -ne 0 ]; then echo -n -e "\[\e[01;32;41m\]{$a}"; fi`\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w`[[ -d .git ]] && echo -n -e "\[\e[33;40m\](branch:$(git branch | sed -e "/^ /d" -e "s/* \(.*\)/\1/"))\[\033[01;32m\]\[\e[00m\]"`\[\033[01;34m\]\$\[\e[00m\] '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='`a=$?;if [ $a -ne 0 ]; then echo -n -e "{$a}"; fi`\u@\h:\w`[[ -d .git ]] && echo -n -e "(branch:$(git branch | sed -e "/^ /d" -e "s/* \(.*\)/\1/"))"`\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# set path include my bin dir
#PATH=$PATH:~/bin
#PATH=$PATH:~/opt/Sourcery_G++_Lite/bin
PATH=$PATH:~/opt/FriendlyARM/toolschain/4.4.3/bin
#PATH=$PATH:~/opt/OpenWrt-Toolchain-ar71xx-for-mips_r2-gcc-4.6-linaro_uClibc-0.9.33.2/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/bin
#PATH=$PATH:~/opt/am3354/usr/bin
#PATH=$PATH:~/opt/gcc-4.9.2-glibc-2.20-binutils-2.24-kernel-3.16-sanitized/bin
PATH=$PATH:/opt/OSELAS.Toolchain-2014.12.0/arm-v4t-linux-gnueabi/gcc-4.9.2-glibc-2.20-binutils-2.24-kernel-3.16-sanitized/bin/
PATH=$PATH:~/opt/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin
#export STAGING_DIR=

#vim 要标准的UTF-8格式
export  LANG=zh_CN.UTF-8;
export  LC_CTYPE="zh_CN.UTF-8";
export  LC_NUMERIC="zh_CN.UTF-8";
export  LC_TIME="zh_CN.UTF-8";
export  LC_COLLATE="zh_CN.UTF-8";
export  LC_MONETARY="zh_CN.UTF-8";
export  LC_MESSAGES="zh_CN.UTF-8";
export  LC_PAPER="zh_CN.UTF-8";
export  LC_NAME="zh_CN.UTF-8";
export  LC_ADDRESS="zh_CN.UTF-8";
export  LC_TELEPHONE="zh_CN.UTF-8";
export  LC_MEASUREMENT="zh_CN.UTF-8";
export  LC_IDENTIFICATION="zh_CN.UTF-8";
export  LC_ALL=

# colorful manual page
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\E[05;34m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[44;33m' # begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;33m' # begin underline

export EDITOR=vim

# calc
function calc () { awk "BEGIN{ print $* }" ;}

# pause like msdos
function pause() 
{
    local dummy
    read -s -r -p "Press any key to continue..." -n 1 dummy
    echo
}

function _debug()
{
    RCFILE=$1
    CMD=$2
    cat > "$RCFILE" <<END
source ~/.bashrc
history -s '$CMD'
echo '$CMD'
$CMD
END
}

function debug()
{
    host=$1
    if [ -z "$host" ];then
        host=ddc
    fi
    zigbee="ssh $host \"/etc/init.d/ddc_serverd stop;/usr/local/ddc/ddc_server_* -V\""
    service="ssh $host \"sleep 1;/usr/local/ddc/service/main.py -V\""
    web="ssh $host \"sleep 1;/usr/local/ddc/web/core.py\""

    RCFILE1=`tempfile`
    _debug $RCFILE1 "$zigbee"
    RCFILE2=`tempfile`
    _debug $RCFILE2 "$service"
    RCFILE3=`tempfile`
    _debug $RCFILE3 "$web"

    gnome-terminal --maximize --window  --title zigbee -e "/bin/bash --rcfile $RCFILE1" --tab --title service -e "/bin/bash --rcfile $RCFILE2" --tab --title web -e "/bin/bash --rcfile $RCFILE3"
    #rm -f "$RCFILE1"
    #rm -f "$RCFILE2"
    #rm -f "$RCFILE3"
}
