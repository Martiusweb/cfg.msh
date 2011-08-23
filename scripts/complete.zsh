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

# complete
#   configure the autocomplete feature of Zsh
#   Inspired by Oh-my-zsh

# enable autocomplete features
autoload -U compinit && compinit

# do not print control characters
unsetopt flowcontrol

# show completion menu on succesive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# The following configuration is inherited from Oh-My-Zsh, since it's pretty
# good, and I've no time yet to dig this part.

# standard case unsensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# allow approximate typing
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Enable coloration ?
zstyle ':completion:*' list-colors ''

# enable menu selection
zstyle ':completion:*:*:*:*:*' menu select

# smart completion for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  `hostname`
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $MSH_CFG_PATH/cache/

# Remove these users from the completion options (for instance for deluser)
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon dbus distcache \
  dovecot fax ftp games gdm gkrellmd gopher hacluster haldaemon halt hsqldb \
  ident junkbust ldap lp mail mailman mailnull mldonkey mysql nagios named \
  netdump news nfsnobody nobody nscd ntp nut nx openvpn operator pcap postfix \
  postgres privoxy pulse pvm quagga radvd rpc rpcuser rpm shutdown squid sshd \
  sync uucp vcsa www www-data xfs sabnzbd

# ... unless we really want to.
zstyle '*' single-ignored show
