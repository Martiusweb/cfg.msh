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

# view
#   sets the look of shell

# colors
typeset -Ag fg
fg[red]=$'\e['31m
fg[green]=$'\e['32m
fg[yellow]=$'\e['33m

reset_color=$'\e['00m

# Prompt look
PS1='${fg[green]}\u${reset_color} \w${fg[yellow]}$(git_prompt_info) ${fg[red]}'

if is_root
then
  PS1="$PS1# "
else
  PS1="$PS1$ "
fi

PS1="$PS1${reset_color}"
