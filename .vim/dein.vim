if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')

 call dein#add('Shogo/neosnippet.vim')
 call dein#add('Shogo/neosnippet-snippets')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 let g:deoplete#enable_at_startup = 1

 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable


" Add plugin specify configuration

if dein#tap('neosnippet.vim')

  "let g:neosnippet#snippets_directory='~/.vim/my_snippet'

  " SuperTab like snippets behavior.
  imap  <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endif
