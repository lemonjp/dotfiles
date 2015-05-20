""""""""""""""""""""""""""""""""""""""""""""""""""
""" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,cp932
set fileformats=unix,dos,mac

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'scrooloose/nerdtree'
Bundle 'corntrace/bufexplorer'
Bundle 'unite.vim'
" Colorscheme
Bundle 'ujihisa/unite-colorscheme'
"Bundle 'tomasr/molokai'
Bundle 'lemonjp/molokai'
Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized'

" for better html template syntax highlighting
Bundle "lepture/vim-jinja"

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc'
" for snippets
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
" for ctags
Bundle 'Source-Explorer-srcexpl.vim'
"Bundle 'taglist.vim'
Bundle 'itchyny/lightline.vim'
" for php
Bundle 'PDV--phpDocumentor-for-Vim'
" for coffee script
Bundle 'kchmck/vim-coffee-script'
" for jsbeautify
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
" for dockerfile
Bundle 'ekalinin/Dockerfile.vim'
" for comment nerd
Bundle 'scrooloose/nerdcommenter'
" tabbar
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'

filetype plugin indent on     " required!


""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
"""""""""""""""""""""""""""""""""""""""""""""""""
"set nowrap
set noautoindent
set textwidth=0                " Don't wrap lines by default
set tabstop=2                  " tab size eql 4 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab

" for hard tab
if expand("%:t") =~ ".*\.php"
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endif

set backspace=indent,eol,start " バックスペースでなんでも消せるように

autocmd BufWritePre * :%s/\s\+$//e  "auto remove white space.

""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                      " enable syntax
set list
set listchars=tab:^_,trail:-,nbsp:%
set t_Co=256
set laststatus=2              " always show status line.
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.
set number                    " line numbers On
set cursorline
set colorcolumn=80

:silent! colorscheme molokai

"set background=dark            " for solarized color scheme
"let g:solarized_termcolors=256 " for solarized color scheme

let g:solarized_termtrans=1
"colorscheme solarized
"colorscheme zenburn
set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P
" syntax highlighting for rails templates and scss
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
" syntax highlighting for symfony templates
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.twig set ft=jinja
"autocmd BufRead,BufNewFile *.twig set filetype=htmljinja
"au BufRead,BufNewFile *.twig set syntax=htmldjango

" タブ文字のカラー設定
autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=234 ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1       " show hidden files
let g:NERDTreeDirArrows=0

" BufExplorer
nmap <c-l> :BufExplorer<CR>

" Qucikrun for Rspec

" VimShell
noremap <c-i> :sp<cr><c-w><c-w>:VimShell<CR>


"-------------------------------------------
" neocomplcache
"-------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_enable_smart_case = 1
"" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
"" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" color for auto complete
hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff

"-------------------------------------------
"  neosnippet
"-------------------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"-------------------------------------------
"  easytags
"-------------------------------------------
" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1

" To generate tags only when a file is saved, add this to
let g:easytags_events = ['BufWritePost']

" To disable automatic highlighting of tags, add this to
let g:easytags_auto_highlight = 0

"-------------------------------------------
"  input completion
"-------------------------------------------

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

" put current date
inoremap ,dh  <C-r>=strftime('%Y-%m-%dT%H:%M:%S')<Return>
inoremap ,dd  <C-r>=strftime('%Y-%m-%d')<Return>

"-------------------------------------------
"  key mappings
"-------------------------------------------

" set paste
nnoremap <Space>p :set paste<CR>
nnoremap <Space>op :set nopaste<CR>

" phpDocumentor
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

"-------------------------------------------
"  JsBeautify
"-------------------------------------------
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"-------------------------------------------
"  commentout
"-------------------------------------------
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

