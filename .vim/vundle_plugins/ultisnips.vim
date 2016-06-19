
" ---------------------------------------------
" UltiSnips
" ://github.com/honza/vim-snippets/tree/master/UltiSnips
" ---------------------------------------------

if exists('g:vundle_installing_plugins')
  Plugin 'SirVer/ultisnips'
  finish
endif

let g:UltiSnipsSnippetDirectories=['ulti_snippets']
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-h>'
