#!/bin/bash

# Symlink top-level dotfiles (.vimrc, .vim, .tmux.conf, ...) into $HOME.
# -maxdepth 1 keeps this to the top level; .git and .config are handled separately.
for file in `find $HOME/dotfiles -maxdepth 1 -name '.*' | grep -v 'dotfiles/\.git$' | grep -v 'dotfiles/\.config$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# Neovim config lives inside this repo and is symlinked into ~/.config.
mkdir -p $HOME/.config
ln -sfn $HOME/dotfiles/.config/nvim $HOME/.config/nvim
