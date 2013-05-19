# My Emacs Configuration

Works only with Emacs 24 and later.

This is my very minimal configuration for Emacs. I like to keep my emacs
nice and lightweight, so there's not much in here. Actually, it's more like
Vim-flavoured Emacs, since it has Evil installed.

![Screenshot](http://i.imgur.com/MY0xe5I.png)

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
  * PHP-mode
    - this doesn't ship with Emacs and is a bit lacking really
    - mixed HTML/PHP doesn't work well at all; I use html-mode instead
  * Erlang
  * Auto-complete
    - use <kbd>TAB</kbd> to auto-complete while typing
  * IDO-mode
    - ships with Emacs 24, turned on in this config
    - does fuzzy-searching in various places
  * Molokai
    - purdy colors, easy to read
  * ELPA
    - the ELPA package manager is configured with Marmalade & MELPA
    - some conveniences are in .emacs to make it almost like Bundler for Ruby

## Custom settings

  * Trailing whitespace
    - electric-indent-mode is turned on, which helps remove trailing whitespace
    - trailing-whitespace is highlighted in red
    - there is no destructive removal of existing whitespace
  * Indentation
    - Default: 2 spaces
    - Ruby: 2 spaces
    - PHP: tabs
    - Erlang: 4 spaces
  * Backup files etc
    - completely disabled
  * Highlight matching braces
    - enabled, but no auto-insertion of them
  * Find file in project
    - <kbd>C-x f</kbd> to start searching
    - <kbd>C-x c</kbd> to clear the cache
  * Cycle through windows in reverse
    - usually <kbd>C-x o</kbd> cycles windows, <kbd>C-x p</kbd> goes backwards
  * Line numbers
    - off by default, toggled with <kbd>C-x j</kbd>

## Installation

In theory you can just download the .emacs file to your home directory and
start Emacs, though if you want to get changes from GitHub, you'll need to do
things a bit differently.

    # hope you know what you're doing
    rm -rf ~/.emacs.d ~/.emacs

    # clone and symlink the .emacs file
    git clone git://github.com/d11wtq/emacs.d.git ~/.emacs.d
    ln -s ~/.emacs.d/.emacs ~/.emacs

Provided you have Emacs 24 installed, when you run it the first time, it will
connect with the ELPA package repositories and install the custom packages.
You'll see some warnings being logged to a split window while this happens.
Just wait; it's nothing to worry about.

Once Emacs is finished installing packages, you can close the `*Compile-Log*`
window with <kbd>C-x 1</kbd>. Don't forget you'll be in Evil mode, so you
should use vi key bindings. Get back to Emacs regular mode with <kbd>C-\\</kbd>.

## Further customizations

You can just edit the .emacs file directly if you want to make changes, though
if you're planning on pulling down updates from the git repositorym, you'll
need to be prepared to deal with merge conflicts. Instead, you can create a
new file at ~/.emacs.d/custom.el and add your customizations there. This file
is automatically loaded at the end of of .emacs, if it exists.

## Getting updates

If new packages are added, they'll be installed when you open Emacs.

You can add new dependencies yourself, if you know they exist in MELPA or
Marmalade. In the .emacs file:

    (dep 'some-package)

Then place your cursor on the closing parenthesis and do <kbd>C-x C-e</kbd>
to evauluate the lisp code immediately, or just restart Emacs.

Or add it to the existing list of `(dependencies '(....))`.

## Disclaimer

If you use my .emacs, you are probably nuts ;)
