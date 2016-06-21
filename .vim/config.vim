" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

" ---------------
" Color
" ---------------
syntax on                      " enable syntax
"set background=dark
:silent! colorscheme molokai
":silent! colorscheme jellybeans
set t_Co=256

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set cursorline     " Highlight current line
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

" ---------------
" Status Line
" ---------------
"set statusline=%<%f\               " custom statusline
"set stl+=%{fugitive#statusline()}  " show git branch
"set stl+=[%{&ff}]                  " show fileformat
"set stl+=%y%m%r%=
"set stl+=%-14.(%l,%c%V%)\ %P


" ---------------
" Visual
" ---------------
"syntax enable
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list
" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:^_
" show trailing spaces as dots
set listchars+=trail:-
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Text Format
" ---------------
set tabstop=2                  " tab size eql 4 spaces
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=2               " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab                  " replace tabs with ${tabstop} spaces

" for hard tab
if expand("%:t") =~ ".*\.php"
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endif


" ---------------
" Others
" ---------------

" Ctags
set tags=./tags;

" Better complete options to speed it up
set complete=.,w,b,u,U

" auto remove white space.
autocmd BufWritePre * :%s/\s\+$//e

" ---------------
" Behaviors
" ---------------
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>


" ---------------
" Old Settings
" ---------------
"set fileencodings=ucs-bom,utf-8,sjis,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,cp932
"set fileformats=unix,dos,mac
""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
"""""""""""""""""""""""""""""""""""""""""""""""""
" set nowrap
"set noautoindent
"set textwidth=0                " Don't wrap lines by default
"set tabstop=2                  " tab size eql 4 spaces
"set softtabstop=2
"set shiftwidth=2               " default shift width for indents
"set expandtab                  " replace tabs with ${tabstop} spaces
"set smarttab

" for hard tab
"if expand("%:t") =~ ".*\.php"
"  set tabstop=4
"  set softtabstop=4
"  set shiftwidth=4
"endif
"
"set backspace=indent,eol,start " バックスペースでなんでも消せるように
"

""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual
""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax on                      " enable syntax
"set list
"set listchars=tab:^_,trail:-,nbsp:%
"set t_Co=256
"set laststatus=2              " always show status line.
"set showmatch                 " Show matching brackets.
"set matchtime=2               " Bracket blinking.
"set number                    " line numbers On
"set cursorline
"set colorcolumn=80

" タブ文字のカラー設定
"autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=234 ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/snippets'


"-------------------------------------------
"  key mappings
"-------------------------------------------
" set paste
"nnoremap <Space>p :set paste<CR>
"nnoremap <Space>op :set nopaste<CR>

