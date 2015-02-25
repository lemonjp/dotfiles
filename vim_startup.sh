#!/bin/bash
echo "dotfile install"
git clone https://github.com/lemonjp/dotfiles.git
sh -x ./dotfiles/setup.sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
echo "set up vim env"
cd .vim/bundle/vimproc/
make -f make_unix.mak
cd ~/.vim/bundle/nerdtree/nerdtree_plugin
wget --no-check-certificate https://gist.github.com/lemonjp/2558f5cc63bcd347024b/raw/9e4f07818da3e9f98797710a9e78fd0d08ad79dc/grep_menuitem.vim
cd ~/.vim/snippets
ln -s ~/dotfiles/.vim/snippets/php.snippets php.snippets
echo "done!"
