" ---------------------------------------------
" BufExplorer
" ---------------------------------------------
if exists('g:vundle_installing_plugins')
  Plugin 'jlanzarotta/bufexplorer'
  finish
endif

nmap <c-l> :BufExplorer<CR>
