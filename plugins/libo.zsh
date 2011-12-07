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

# Aliases and syntactic helpers I use when I work on libre office
LIBO_SRC_DIR=~/Code/libo

alias dbuild="build debug=t dbglevel=2"
alias dbuild1="build debug=t dbglevel=1"

alias prepareMyEnv="source $LIBO_SRC_DIR/Env.Host.sh"
alias goInstall="cd $LIBO_SRC_DIR/install/program"
alias sourceInstall="goInstall && source ooenv"

alias iShallWork="prepareMyEnv && sourceInstall && cd $LIBO_SRC_DIR"
