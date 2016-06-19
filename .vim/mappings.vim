" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
"let mapleader=','
let mapleader = "\<Space>"
let maplocalleader = ' '

" -----------------------
" Unmapped While Learning
" -----------------------

" No-op ^ and $ while learning H and L
noremap ^ <nop>
noremap $ <nop>
nnoremap <leader>sc <nop>

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

