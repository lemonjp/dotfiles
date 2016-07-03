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

" ---------------
"  Java Getter Setter
" ---------------
map jgs mawv/ <CR>"ty/ <CR>wve"ny/getters<CR>$a<CR><CR><Esc>xxa<Tab>public <Esc>"tpa<Esc>"npbiget<Esc>l~hea ()<CR>{<CR><Tab>return <Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxa<Tab>public void <Esc>"npbiset<Esc>l~hea (<Esc>"tpa<Esc>"npa)<CR>{<CR><Tab>this.<Esc>"npa = <Esc>"npa;<CR>}<Esc>=<CR>`ak
