" Initialize {{{
    " Initial NeoBundle config {{{
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    call neobundle#rc(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    " }}}
    " NeoBundle plugins {{{
    NeoBundle 'aerosol/vimerl'
    NeoBundle 'aerosol/vim-session'
    NeoBundle 'aerosol/vimerl'
    NeoBundle 'gcmt/taboo.vim.git'
    NeoBundle 'kana/vim-smartinput'
    NeoBundle 'gcmt/taboo.vim.git'
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'thinca/vim-ref.git'
    NeoBundle 'hcs42/vim-erlang.git'
    NeoBundle 'hcs42/vim-erlang-tags.git'
    NeoBundle 'vim-scripts/ZoomWin'
    NeoBundle 'moll/vim-bbye.git'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }
    NeoBundle 'klen/python-mode'
    NeoBundleCheck

    " }}}
    " Basic settings {{{
    set nocompatible
    let mapleader=","
    set mouse=a
    syntax on
    filetype plugin indent on
        " Folding {{{
        set foldmethod=marker
        " }}}
        " Tabs & spaces {{{
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set expandtab
        " }}}
        " Disable backup files {{{
        set noswapfile
        set nobackup
        set nowritebackup
        " }}}
    " }}}
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd p

" Language specific tabs & spaces
    autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab
" Set how invisible characters are displayed
    set listchars=tab:▸\ ,eol:¬,trail:\ ,extends:>,precedes:<
" }}}
