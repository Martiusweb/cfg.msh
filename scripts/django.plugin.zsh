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

# Django autocompletion
#   Taken from Oh-my-zsh
#   https://raw.github.com/robbyrussell/oh-my-zsh/master/plugins/django/django.plugin.zsh

#compdef manage.py

typeset -ga nul_args
nul_args=(
  '--settings=-[the Python path to a settings module.]:file:_files'
  '--pythonpath=-[a directory to add to the Python path.]::directory:_directories'
  '--traceback[print traceback on exception.]'
  "--version[show program's version number and exit.]"
  {-h,--help}'[show this help message and exit.]'
)

_managepy-adminindex(){
  _arguments -s : \
    $nul_args \
    '*::directory:_directories' && ret=0
}

_managepy-createcachetable(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dbshell(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-diffsettings(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dumpdata(){
  _arguments -s : \
    '--format=-[specifies the output serialization format for fixtures.]:format:(json yaml xml)' \
    '--indent=-[specifies the indent level to use when pretty-printing output.]:' \
    $nul_args \
    '*::appname:_applist' && ret=0
}

_managepy-flush(){
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-help(){
  _arguments -s : \
    '*:command:_managepy_cmds' \
    $nul_args && ret=0
}

_managepy_cmds(){
    local line
    local -a cmd
    _call_program help-command ./manage.py help \
      |& sed -n '/^ /s/[(), ]/ /gp' \
      | while read -A line; do cmd=($line $cmd) done
    _describe -t managepy-command 'manage.py command' cmd
}

_managepy-inspectdb(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-loaddata(){
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '*::file:_files' \
    $nul_args && ret=0
}

_managepy-reset(){
  _arguments -s : \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-runfcgi(){
  local state

  local fcgi_opts
  fcgi_opts=(
    'protocol[fcgi, scgi, ajp, ... (default fcgi)]:protocol:(fcgi scgi ajp)'
    'host[hostname to listen on..]:'
    'port[port to listen on.]:'
    'socket[UNIX socket to listen on.]::file:_files'
    'method[prefork or threaded (default prefork)]:method:(prefork threaded)'
    'maxrequests[number of requests a child handles before it is killed and a new child is forked (0 = no limit).]:'
    'maxspare[max number of spare processes / threads.]:'
    'minspare[min number of spare processes / threads.]:'
    'maxchildren[hard limit number of processes / threads.]:'
    'daemonize[whether to detach from terminal.]:boolean:(False True)'
    'pidfile[write the spawned process-id to this file.]:file:_files'
    'workdir[change to this directory when daemonizing.]:directory:_files'
    'outlog[write stdout to this file.]:file:_files'
    'errlog[write stderr to this file.]:file:_files'
  )

  _arguments -s : \
    $nul_args \
    '*: :_values "FCGI Setting" $fcgi_opts' && ret=0
}

_managepy-runserver(){
  _arguments -s : \
    '--noreload[tells Django to NOT use the auto-reloader.]' \
    '--adminmedia[specifies the directory from which to serve admin media.]:directory:_files' \
    $nul_args && ret=0
}

_managepy-shell(){
  _arguments -s : \
    '--plain[tells Django to use plain Python, not IPython.]' \
    $nul_args && ret=0
}

_managepy-sql(){}
_managepy-sqlall(){}
_managepy-sqlclear(){}
_managepy-sqlcustom(){}
_managepy-sqlflush(){}
_managepy-sqlindexes(){}
_managepy-sqlinitialdata(){}
_managepy-sqlreset(){}
_managepy-sqlsequencereset(){}
_managepy-startapp(){}

_managepy-syncdb() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-test() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-testserver() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--addrport=-[port number or ipaddr:port to run the server on.]' \
    '*::fixture:_files' \
    $nul_args && ret=0
}

_managepy-validate() {
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-makemessages() {
  _arguments -s : \
    '--locale=-[Creates or updates the message files for the given locale (e.g. pt_BR).]' \
    '--domain=-[The domain of the message files (default: "django").]' \
    '--all[Updates the message files for all existing locales.]' \
    '--extension=-[The file extension(s) to examine (default: ".html", separate multiple extensions with commas, or use -e multiple times)]' \
    '--symlinks[Follows symlinks to directories when examining source code and templates for translation strings.]' \
    '--ignore=-[Ignore files or directories matching this glob-style pattern. Use multiple times to ignore more.]' \
    "--no-default-ignore=[Don't ignore the common glob-style patterns 'CVS', '.*' and '*~'.]" \
    "--no-wrap=[Don't break long message lines into several lines]" \
    '--no-obsolete=[Remove obsolete message strings]' \
    $nul_args && ret=0
}

_managepy-commands() {
  local -a commands

  commands=(
    "changepassword:Change a user's password for django.contrib.auth."
    'cleanup:Can be run as a cronjob or directly to clean out old data from the database (only expired sessions at the moment).'
    'collectstatic:Collects the static files into STATIC_ROOT.'
    'compilemessages:Compiles .po files to .mo files for use with builtin gettext support.'
    'createcachetable:creates the table needed to use the SQL cache backend.'
    'createsuperuser:Used to create a superuser.'
    'dbshell:runs the command-line client for the current DATABASE_ENGINE.'
    "diffsettings:displays differences between the current settings.py and Django's default settings."
    'dumpdata:Output the contents of the database as a fixture of the given format.'
    'findstatic:Finds the absolute paths for the given static file(s).'
    'flush:Executes ``sqlflush`` on the current database.'
    'help:manage.py help.'
    'inspectdb:Introspects the database tables in the given database and outputs a Django model module.'
    'loaddata:Installs the named fixture(s) in the database.'
    'makemessages:Runs over the entire source tree of the current directory and pulls out all strings marked for translation.'
    'reset:Executes ``sqlreset`` for the given app(s) in the current database.'
    'runfcgi:Run this project as a fastcgi (or some other protocol supported by flup) application,'
    'runserver:Starts a lightweight Web server for development.'
    'shell:Runs a Python interactive interpreter.'
    'sql:Prints the CREATE TABLE SQL statements for the given app name(s).'
    'sqlall:Prints the CREATE TABLE, custom SQL and CREATE INDEX SQL statements for the given model module name(s).'
    'sqlclear:Prints the DROP TABLE SQL statements for the given app name(s).'
    'sqlcustom:Prints the custom table modifying SQL statements for the given app name(s).'
    'sqlflush:Returns a list of the SQL statements required to return all tables in the database to the state they were in just after they were installed.'
    'sqlindexes:Prints the CREATE INDEX SQL statements for the given model module name(s).'
    "sqlinitialdata:RENAMED: see 'sqlcustom'"
    'sqlreset:Prints the DROP TABLE SQL, then the CREATE TABLE SQL, for the given app name(s).'
    'sqlsequencereset:Prints the SQL statements for resetting sequences for the given app name(s).'
    "startapp:Creates a Django app directory structure for the given app name in this project's directory."
    "syncdb:Create the database tables for all apps in INSTALLED_APPS whose tables haven't already been created."
    'test:Runs the test suite for the specified applications, or the entire site if no apps are specified.'
    'testserver:Runs a development server with data from the given fixture(s).'
    'validate:Validates all installed models.'
  )

  _describe -t commands 'manage.py command' commands && ret=0
}

_applist() {
  local line
  local -a apps
  _call_program help-command "python2 -c \"import os.path as op, re, django.conf, sys;\\
                                          bn=op.basename(op.abspath(op.curdir));[sys\\
                                          .stdout.write(str(re.sub(r'^%s\.(.*?)$' %
                                          bn, r'\1', i)) + '\n') for i in django.conf.settings.\\
                                          INSTALLED_APPS if re.match(r'^%s' % bn, i)]\"" \
                             | while read -A line; do apps=($line $apps) done
  _values 'Application' $apps && ret=0
}

_managepy() {
  local curcontext=$curcontext ret=1
  if ((CURRENT == 2)); then
    _managepy-commands
  else
    shift words
    (( CURRENT -- ))
    curcontext="${curcontext%:*:*}:managepy-$words[1]:"
    _call_function ret _managepy-$words[1]
  fi
}

compdef _managepy 'python2 manage'
compdef _managepy manage.py
compdef _managepy django
