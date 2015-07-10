[![Build Status](https://travis-ci.org/luismayta/emacs.d.png?branch=master)](https://travis-ci.org/luismayta/emacs.d) [![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](LICENSE) [![Stories in Ready](https://badge.waffle.io/luismayta/emacs.d.svg?label=ready&title=Ready)](http://waffle.io/luismayta/emacs.d)

# My Emacs Configuration

Works only with Emacs 24 and later.

This is my very minimal configuration for Emacs. I like to keep my emacs
nice and lightweight, so there's not much in here. Actually, it's more like
Vim-flavoured Emacs, since it has Evil installed.

## Help/Support

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/luismayta/emacs.d?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge)


## Included packages

I only add packages to my config file if I feel a significant benefit in
having them slowing down my startup time. Emacs 24 has a lot of nice stuff
built-in anyway.

  * Evil mode
    - this might not be to everybody's liking
    - <kbd>C-\\</kbd> switches between Emacs and Vim modes
    - surprisingly, it doesn't get in the way of Emacs' common mappings
    - things like <kbd>C-x ...</kbd> still work, even in Vim mode
    - some surprisingly complex mappings from my .vimrc work too
  * Fiplr
    - fuzzy find in project, using ido
  * go-mode
  * python-mode
  * ruby-mode
  * php-mode
    - this doesn't ship with Emacs and is a bit lacking really
    - mixed HTML/PHP doesn't work well at all; I use html-mode instead
  * Erlang
  * Skeletor
  * Auto-complete
    - use <kbd>TAB</kbd> to auto-complete while typing
  * IDO-mode
    - ships with Emacs 24, turned on in this config
    - does fuzzy-searching in various places
  * Molokai
    - purdy colors, easy to read
  * Noctilux Theme
    - Best Theme color Light Table, easy to read
  * Material Theme
    - Best Theme color, easy to read
  * ELPA
    - the ELPA package manager is configured with Marmalade & MELPA
    - some conveniences are in init.el to make it almost like Bundler for Ruby
  * editorconfig
    - config editor
  * [Google-translate](https://github.com/atykhonov/google-translate)

## Installation

In theory you can just download the .emacs.d directory to your home directory
and start Emacs, though if you want to get changes from GitHub, you'll need to
do things a bit differently.

    # hope you know what you're doing
    rm -rf ~/.emacs.d ~/.emacs
    git clone git://github.com/luismayta/emacs.d.git ~/.emacs.d

Provided you have Emacs 24 installed, when you run it the first time, it will
connect with the ELPA package repositories and install the custom packages.
You'll see some warnings being logged to a split window while this happens.
Just wait; it's nothing to worry about.

Once Emacs is finished installing packages, you can close the `*Compile-Log*`
window with <kbd>C-x 1</kbd>. Don't forget you'll be in Evil mode, so you
should use vi key bindings. Get back to Emacs regular mode with <kbd>C-\\</kbd>.

## Further customizations

You can just edit the ~/.emacs.d/init.el file directly if you want to make
changes, though if you're planning on pulling down updates from the git
repository, you'll need to be prepared to deal with merge conflicts. Instead,
you can create a new file at ~/.emacs.d/custom.el and add your customizations
there. This file is automatically loaded at the end of of ~/.emacs.d/init.el,
if it exists.

## Getting updates

## Disclaimer

If you use my .emacs, you are probably nuts ;)


[![](http://api.coderwall.com/luismayta/endorsecount.png)](http://coderwall.com/luismayta)
[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://pe.linkedin.com/in/luismayta)
[![Analytics](https://github.com/luismayta/UA-65019326-1/emacs.d/readme)](https://github.com/luismayta/emacs.d)
