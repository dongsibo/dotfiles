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

# Systemd has its own set of options that it passes to less. Options from LESS
# are not applied. I like the defaults used for systemctl(1) and
# journalctl(1), but I want to also add more options like case-insensitive
# search. Have to specify default options explicitly and append my own options
# after.
export SYSTEMD_LESS="\
--quit-if-one-screen \
--RAW-CONTROL-CHARS \
--chop-long-lines \
--no-init \
--LONG-PROMPT \
--quit-on-intr \
\
--ignore-case"
