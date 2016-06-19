" =============================================================================
" Description: The Vim Configuration
" =============================================================================
"
" All of the plugins are installed with Vundle from this file.
source ~/.vim/vundle.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" All of the Vim configuration.
source ~/.vim/config.vim
" All hotkeys, not dependant on plugins, are mapped here.
source ~/.vim/mappings.vim
" Load plugin-specific configuration.
source ~/.vim/plugins.vim


"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/vimshell.vim'
"Bundle 'Shougo/vimproc'
" for snippets
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neosnippet-snippets'
" for ctags
"Bundle 'Source-Explorer-srcexpl.vim'
"Bundle 'taglist.vim'
"Bundle 'itchyny/lightline.vim'
" for jsbeautify
"Bundle 'maksimr/vim-jsbeautify'
"Bundle 'einars/js-beautify'
" for dockerfile
"Bundle 'ekalinin/Dockerfile.vim'
" for comment nerd
"Bundle 'scrooloose/nerdcommenter'
" tabbar
"Bundle 'majutsushi/tagbar'
"Bundle 'xolox/vim-easytags'
"Bundle 'xolox/vim-misc'

