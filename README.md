# Dotfiles

## Overview

This repo is a skeleton/template repo for tracking dotfiles. 

## Using this repo

    $ cd $HOME
    $ git clone git@github.com:username/dotfiles.git .dotfiles
    $ sh -x ./dotfiles/setup.sh
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ vim +BundleInstall +qall
    $ cd .vim/bundle/vimproc/
    $ make -f make_unix.mak

