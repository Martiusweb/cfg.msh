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
# based on https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh

# title short_title long_title
function title {
  if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ "$EMACS" == *term* ]]; then
    return
  fi

  case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|dtterm|kterm|Eterm)
      print -Pn "\e]2;$2:q\a" #set window name
      print -Pn "\e]1;$1:q\a" #set icon (=tab) name
    ;;

    screen|screen-256color)
      print -Pn "\ek$1:q\e\\"
    ;;
  esac
}

# Appears when you have the prompt
function termtitle_precmd {
  title "%15<..<%~%<<" "%n@%m: %~"
}

# Appears at the beginning of (and during) of command execution
function termtitle_preexec {
  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]}
  local LINE="${2:gs/$/\\$}"
  LINE="${LINE:gs/%/%%}"
  title "$CMD" "%100>...>$LINE%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd termtitle_precmd
add-zsh-hook preexec termtitle_preexec
