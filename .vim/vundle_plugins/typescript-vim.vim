if exists('g:vundle_installing_plugins')
  Plugin 'leafgarland/typescript-vim'
  finish
endif

autocmd FileType vue syntax sync fromstart
