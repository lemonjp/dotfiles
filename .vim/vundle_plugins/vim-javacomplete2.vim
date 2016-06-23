if exists('g:vundle_installing_plugins')
  Plugin 'artur-shaik/vim-javacomplete2'
  finish
endif

autocmd FileType java setlocal omnifunc=javacomplete#Complete
