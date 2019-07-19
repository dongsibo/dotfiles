#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history list.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="exit:logout"

# Append to the history file, don't overwrite it (to kind of support multiple
# bash sessions; doesn't deal with duplicates well)
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Enable colour support of `ls` and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more `ls` aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file
# like ~/.bash_aliases, instead of adding them here directly.
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases

# Enable fuzzy-finding (see fzf documentation for more details)
[[ -r /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
[[ -r /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash


# TODO Put prompt related stuff it its own little file to be source here

##
# Print the name of the current python virtual environment.
#
# Necessary since a virtual environment will try by to modify PS1 directly which
# will then be overwritten by bash again if using PROMPT_COMMAND to also modify
# PS1.
##
_venv_info() {
    if [[ -n $VIRTUAL_ENV ]]; then
        printf "%s " "$(basename "$VIRTUAL_ENV")"
    fi
}

##
# Print a number if it is not 0.
#
# $1: exit code from a command
##
_print_exit_code() {
    if [[ $1 -ne 0 ]]; then
        printf "%s " "$1"
    fi
}

##
# Construct prompt; i.e. set PS1.
#
# $1: exit code from a command
##
_build_prompt() {
    local no_newline
    local prefix
    local suffix

    # Print reverse video if output does not end with a newline. Taken from
    # [Server Fault](https://serverfault.com/q/97503). Basically the same way
    # that zsh highlights no newlines. Can be a little wonky with text reflow
    # (due to reliance on spaces for spacing).
    no_newline="\[\e[1;7m%\e[m$( printf "%*s" "$(( COLUMNS-1 ))" "" )\r\e[K\]"
    prefix="${no_newline}\n\[\e[1;38;5;244m\]$( _venv_info )\[\e[0;1;38;5;212m\]\w\[\e[0m\]"
    suffix="\n\[\e[1;38;5;203m\]$( _print_exit_code "$1" )\[\e[0;93m\]>>\[\e[0m\] "

    if declare -F __git_ps1 > /dev/null; then
        __git_ps1 "$prefix" "$suffix" " (\[\\\e[1m\]%s)"
    else
        PS1=${prefix}${suffix}
    fi
}

##
# Provide titlebar information for xterms
##
_xterm_title() {
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
}

[[ -r /usr/share/git/git-prompt.sh ]] && . /usr/share/git/git-prompt.sh

PROMPT_DIRTRIM=3

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
#GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_DESCRIBE_STYLE=branch
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_HIDE_IF_PWD_IGNORED=true

VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT_COMMAND='_build_prompt $?; _xterm_title'


# TODO Put history related stuff in its own file

##
# Make entries in HISTFILE unique.
#
# Retains ordering of commands. If duplicates are found, the latest position
# of the command is used.
##
_uniq_history() {
    local tmphist

    tmphist=$(mktemp)

    # Append history list to history file. We need to do this or duplicate
    # entries will still appear in the history file. Not sure why.
    # FIXME This is kind of janky; if HISTFILESIZE is smaller than it's current
    # capacity and the the current history list, then we will lose history. A
    # very large HISTFILESIZE should counteract this (might even want to have
    # unlimited size).
    history -a

    # Remove duplicates from history. See https://unix.stackexchange.com/a/78846.
    tac "$HISTFILE" | awk '!x[$0]++' | tac >| "$tmphist"
    cat "$tmphist" >| "$HISTFILE"

    rm -f -- "$tmphist"
}

trap '_uniq_history' HUP INT QUIT TERM EXIT
