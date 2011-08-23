# This file is part of cfg.msh by Martin Richard
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.

# keybindings
#   customize the behavior of some of our keys

# Basic keys
#   Thanks to the Archlinux wiki

# home/end of line in various environment
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

# quoted-insert (Insert)
bindkey '\e[2~' quoted-insert
# Left and right arrow keys
bindkey '^[[D' backward-char
bindkey '^[[C' forward-char
# Ctrl+left/right jump the word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Del and backspace
bindkey '^?' backward-delete-char
bindkey '\e[3~' delete-char

# Shift+Tab
bindkey '\e[Z' reverse-menu-complete

# History control
# page up key = previous or next in history, but don't search
bindkey '^[[5~' up-line-or-history
# page down key
bindkey '^[[6~' down-line-or-history
# up key = search according to the begining of the typed command
bindkey '^[[A' up-line-or-search
# down key
bindkey '^[[B' down-line-or-search
