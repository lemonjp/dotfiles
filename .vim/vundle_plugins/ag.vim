" ---------------------------------------------
" Ag Search
" Required - yum install the_silver_searcher
" ---------------------------------------------

if has('unix') || has('mac')
  if exists('g:vundle_installing_plugins')
    Plugin 'rking/ag.vim'
    finish
  endif

  nnoremap <silent> <leader>as :AgFromSearch<CR>
  nnoremap <leader>ag :Ag<space>
endif
