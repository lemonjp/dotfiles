" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
"let mapleader=','
let mapleader = "\<Space>"
let maplocalleader = ' '

" ---------------
" Regular Mappings
" ---------------

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

