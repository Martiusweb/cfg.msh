# enable autocomplete features
autoload -U compinit && compinit

export PATH="/opt/chefdk/bin:/home/martius/.chefdk/gem/ruby/2.3.0/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/martius/.gem/ruby/1.9.1/bin:/opt/phpctags:Xsession/bin:/home/martius/Code/martius/cfg.msh/bin:/opt/chefdk/gitbin"
export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.3.0"
export GEM_HOME="/home/martius/.chefdk/gem/ruby/2.3.0"
export GEM_PATH="/home/martius/.chefdk/gem/ruby/2.3.0:/opt/chefdk/embedded/lib/ruby/gems/2.3.0"
function _chef() {

  local -a _1st_arguments
  _1st_arguments=(
      'exec:Runs the command in context of the embedded ruby'
      'env:Prints environment variables used by ChefDK'
      'gem:Runs the `gem` command in context of the embedded ruby'
      'generate:Generate a new app, cookbook, or component'
      'shell-init:Initialize your shell to use ChefDK as your primary ruby'
      'install:Install cookbooks from a Policyfile and generate a locked cookbook set'
      'update:Updates a Policyfile.lock.json with latest run_list and cookbooks'
      'push:Push a local policy lock to a policy group on the server'
      'push-archive:Push a policy archive to a policy group on the server'
      'show-policy:Show policyfile objects on your Chef Server'
      'diff:Generate an itemized diff of two Policyfile lock documents'
      'provision:Provision VMs and clusters via cookbook'
      'export:Export a policy lock as a Chef Zero code repo'
      'clean-policy-revisions:Delete unused policy revisions on the server'
      'clean-policy-cookbooks:Delete unused policyfile cookbooks on the server'
      'delete-policy-group:Delete a policy group on the server'
      'delete-policy:Delete all revisions of a policy on the server'
      'undelete:Undo a delete command'
      'verify:Test the embedded ChefDK applications'
    )

  _arguments \
    '(-v --version)'{-v,--version}'[version information]' \
    '*:: :->subcmds' && return 0

  if (( CURRENT == 1 )); then
    _describe -t commands "chef subcommand" _1st_arguments
    return
  fi
}

compdef _chef chef
