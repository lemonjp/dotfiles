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
" Load plugin-specific configuration for dein.
source ~/.vim/dein.vim

" Load plugin-specific configuration.
source ~/.vim/plugins.vim
