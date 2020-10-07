# Dotfiles

## Overview

This repo is a skeleton/template repo for tracking dotfiles.

## Using this repo

```sh
$ cd $HOME
$ git clone --depth 1 https://github.com/lemonjp/dotfiles.git
$ mkdir -p ~/.cache/dein
$ sh -x ./dotfiles/setup.sh
$ sh -x ./dotfiles/.vim/scripts/installer.sh ~/.cache/dein
$ sh -x ./dotfiles/.vim/scripts/setup
```
## for dein

`:call dein#install()`

## Working on osx

```
brew install reattach-to-user-namespace
```

### for prevent vim and tmux rendering problem

```
tmux -u -2
```

