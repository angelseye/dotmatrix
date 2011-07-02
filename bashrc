# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export GIT_PS1_SHOWDIRTYSTATE=1
GITPROMPT='$(__git_ps1)'

# If not running interactively, don't do anything
if [[ -z "$PS1" ]] ; then

source "$HOME/.hashrc"

# Define a few Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace


# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Define some other variables
VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"set syntax=sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

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
#force_color_prompt=yes

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

PS1="\[${WHITE}\][\[${LIGHTBLUE}\]\w\[${WHITE}${GREEN}\]${GITPROMPT}\[${WHITE}\]]\[${NC}\]\$ "
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
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
if ls --color &>/dev/null; then
        ls_opt="--color" #Linux ls colors
else
        ls_opt="-G" #Mac OSX ls colors
fi
alias ls='ls $ls_opt'
 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# GVim Alias 160x48 geometry
alias gvim='gvim -geometry 160x48'

#Programming Aliases
alias rspec='rspec --color -f d'

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

if [ -x /usr/local/bin/brew ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

fi

# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.hashrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"set syntax=sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

[ -z "$PS1" ] || stty -ixon

[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; export rvm_pretty_print_flag=1 ; fi

# This loads RVM into a shell session
[[ -s "/Users/ewilson/.rvm/scripts/rvm" ]] && source "/Users/ewilson/.rvm/scripts/rvm"

