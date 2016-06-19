" ---------------------------------------------
" NERDTree
" ---------------------------------------------
if exists('g:vundle_installing_plugins')
  Plugin 'scrooloose/nerdtree'
  finish
endif

nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>

let NERDTreeShowHidden=1         " show hidden files
let g:NERDTreeDirArrows=0

" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif
