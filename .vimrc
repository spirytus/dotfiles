execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd p

" Tabs & spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Language specific tabs & spaces
autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab
" Set how invisible characters are displayed
set listchars=tab:▸\ ,eol:¬,trail:\ ,extends:>,precedes:<
