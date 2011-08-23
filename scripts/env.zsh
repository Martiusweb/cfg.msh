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

# env
#   Shell specific features

# setup hystory
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

# Changing directory options
# Directory stack is documented here, for newbies:
#   http://www.acm.uiuc.edu/workshops/zsh/dir_stack.html
setopt autopushd pushdminus pushdsilent pushdtohome

# If something which is not a command but a directory is entered, then
# apply cd on it
setopt autocd

# Resolve links and dots in paths
setopt chase_links

# if the argument to cd is not a directory, treat it as a variable
setopt cdablevars

# Disable Ctrl+D to exit terminal
#setopt ignoreeof

# comments are allowed in interractive mode
setopt interactivecomments

# Behavior of "!" in scripts deactivated
setopt nobanghist

# Prevent the use of operator ">" on existing file
#setopt noclobber

# Reduce blank and ignore spaces when looking up in the history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# consider words are multiple args
# see http://zsh.sourceforge.net/FAQ/zshfaq03.html
setopt SH_WORD_SPLIT

# Prevent hang up of children jobs
setopt nohup
