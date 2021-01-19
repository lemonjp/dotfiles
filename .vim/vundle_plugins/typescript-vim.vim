if exists('g:vundle_installing_plugins')
  Plugin 'leafgarland/typescript-vim'
  finish
endif

autocmd BufRead,BufNewFile *.tsx set filetype=typescript
autocmd FileType vue syntax sync fromstart
