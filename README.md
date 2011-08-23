cfg.msh
=======

cfg.msh is a clean configuration set for Bash or Zsh.
This work is highly inspired by Oh-My-Zsh features and design, but I choosed to
write my configuration from scratch as an excercice, and in order to be focused
on my own needs and avoid some bogus features with some terminals (and SSH).

I will try to implement features that are compatible with Bash and Zsh as
much as possible.

A quick word about the name "msh", M stands for My, Multiple and Martius (a bit
of Megalomania, hum?).

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

Usage
-----

You should read the configuration files which are extensively documented. You
must be interested in keybindings if you want to know actions implemented behind
some keys.

 * `bootstrap` sources the scripts in `scripts/`

 * `scripts/*.msh` script are loaded first, then, according to the shell running the
 script, it calls `scripts/*.bash` or `scripts/*.zsh`

 * `scripts/aliases` contains common aliases
 * `scripts/complete` autocompletion features
 * `scripts/env` environement specific features (shell options, etc)
 * `scripts/git` git helpers
 * `scripts/keybindings` key bindings (for zsh)
 * `scripts/view` display setup (prompt, etc)

To do
-----

Most important additions are on top.

 1. Customize autocompletion style

 2. Since I use mostly Zsh, my configuration for bash is currently basic, but
    I'll try to improve it soon.

 3. The setup script, with an optional minifier allowing to use only one `.*rc`
    file.

 4. Oh-My-Zsh plugins autograbber (hum...)

Authors
-------
Martin Richard <martius@martiusweb.net>
