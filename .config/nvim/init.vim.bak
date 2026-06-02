" ~/.config/nvim/init.vim

" --- (1) Vim設定を流用 ---
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" --- (2) Neovim専用の追記はここに書く（最小） ---
" クリップボード（Macで便利）
set clipboard=unnamedplus

" MarkdownではスペルチェックOFF（日本語の下線対策）
autocmd FileType markdown setlocal nospell

" truecolor（ターミナルが対応していれば）
set termguicolors

" Markdownの表示をちょい見やすく
autocmd FileType markdown setlocal wrap linebreak breakindent

