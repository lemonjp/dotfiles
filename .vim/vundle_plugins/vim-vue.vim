if exists('g:vundle_installing_plugins')
  Plugin 'posva/vim-vue'
  finish
endif

autocmd FileType vue syntax sync fromstart
