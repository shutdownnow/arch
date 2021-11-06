set mouse=a
set smarttab
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set relativenumber
set encoding=utf-8
set hidden

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com.cnpmjs.org/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com.cnpmjs.org/junegunn/fzf.vim'

Plug 'https://github.com.cnpmjs.org/neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

let g:coc_global_extensions = [
    \'coc-vimlsp',
    \'coc-json',
    \'coc-css',
    \'coc-html',
    \'coc-clangd',
    \'coc-go',
    \'coc-marketplace'
\]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
