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

# title
#   sets terminal title
# based on http://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc

case $TERM in
  *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|dtterm|kterm|Eterm)
    precmd () {
      echo -n "\e]0;$USER@$HOSTNAME $PWD\a"
    }
  ;;
  screen)
    precmd () {
      echo -n "\e]83;title \"$1\"\a"
      echo -n "\e]0;$TERM - ($SHLVL) $USER@$HOSTNAME $PWD\a"
    }
  ;;
esac

PROMT_COMMAND='precmd'
