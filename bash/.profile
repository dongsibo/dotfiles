#
# ~/.profile
#

[ -n "$BASH_VERSION" ] && [ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

export PATH

export EDITOR=vim
export VISUAL=vim

export LESS='--RAW-CONTROL-CHARS --quit-if-one-screen --ignore-case'
