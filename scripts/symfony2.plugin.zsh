# Symfony2 basic command completion
SF2_ROOT_DIR=~/Code/mixotv/secam

_symfony2_get_command_list () {
	php $SF2_ROOT_DIR/app/console --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_symfony2 () {
  if [ -f $SF2_ROOT_DIR/app/console ]; then
    compadd `_symfony2_get_command_list`
  fi
}

compdef _symfony2 app/console
compdef _symfony2 sf2
