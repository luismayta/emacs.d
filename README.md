# My Emacs 24 Configuration

This is a very minimal configuration for Emacs 24. I like to keep my emacs
nice and lightweight, so there's not much in here.

To install:

    # hope you know what you're doing
    rm -rf ~/.emacs.d ~/.emacs

    # clone and symlink the .emacs file
    git clone git://github.com/d11wtq/emacs.d.git ~/.emacs.d
    ln -s ~/.emacs.d/.emacs ~/.emacs

Packages are auto-installed using ELPA (built-in package manager), via
Marmalade and MELPA.

## Includes:

  - Marmalade/MELPA automatic package management
  - Molokai theme
  - Erlang major mode
  - 2 spaces for indentation most places (4 for Erlang)
  - IDO Everywhere (auto-completion)
  - find-file-in-project (Ctrl-P)
  - Backup files turned off
