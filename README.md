cfg.msh
=======

cfg.msh is a clean configuration set for Bash or Zsh.
This work is highly inspired by Oh-My-Zsh features and design, but I choose to
write my configuration from scratch as an excercice, and in order to be focused
on my own needs and avoid some bogus features with some terminals (and SSH).

I will try to implement features that are compatible with Bash and Zsh as
much as possible.

Installation
------------
There is a script called setup that you can run, I shall do the job for you.

If you don't want to use that script, you can follow these steps :
 * move or copy the content of cfg.msh where you want to install the scripts

 * copy `cfg.msh/mshrc` to `~/.zshrc` or `~/.bashrc` according to the shell
 program you want to use 

 * Edit the new `.zshrc`/`.bashrc` file and update the installation path:
 ``$MSH_CFG_PATH``

 * If you want to use Zsh, don't forget to choose zsh as your default shell
 program using: `` chsh -s `which zsh` ``

That's should be sufficient.

Authors
-------
Martin Richard <martius@martiusweb.net>
