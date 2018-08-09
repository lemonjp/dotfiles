# Dotfiles

## Overview

This repo is a skeleton/template repo for tracking dotfiles.

## Using this repo

```sh
$ cd $HOME
$ git clone https://github.com/lemonjp/dotfiles.git
$ sh -x ./dotfiles/setup.sh
$ sh -x ./dotfiles/.vim/scripts/setup
```
## for dein

```sh
$ sh -x ./dotfiles/.vim/scripts/installer.sh ~/.cache/dein

```
`:call dein#install()`

### for prevent vim and tmux rendering problem

```
tmux -u -2
```
