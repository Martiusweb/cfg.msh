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

autoload -U colors && colors

# Evaluate prompt
setopt prompt_subst

# Prompt look
PROMPT='%{$fg[green]%}%n%{$reset_color%}'

if [[ $(hostname -s) != "tumbler" ]]
then
    PROMPT="${PROMPT}%{$fg[red]%}@%m%{$reset_color%}"
fi

PROMPT="$PROMPT %~%{$fg[yellow]%}$(git_prompt_info) %{$fg[red]%}"

if is_root
then
 PROMPT="$PROMPT# "
else
 PROMPT="$PROMPT$ "
fi

PROMPT="$PROMPT%{$reset_color%}"
