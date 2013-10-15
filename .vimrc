"z Initialize {{{
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
    nnoremap <silent><Leader>f :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><Leader>r :Unite -resume -buffer-name=recent file_mru<CR>
    nnoremap <silent><Leader>b :Unite -resume buffer<CR>
    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>
    set number
    autocmd! bufwritepost .vimrc source %
    " File explorer
    nnoremap <Leader>e :Ex<CR>

    " Buffers
    nnoremap <Tab> :bnext<CR>
    nnoremap <S-Tab> :bprevious<CR>
    nnoremap <Leader>x :bdelete<CR>
    " Fugitive {{{
    no <leader>gd :Gdiff<cr>
    nno <leader>gs :Gstatus<CR><C-W>15+
    nno <leader>gw :Gwrite<cr>
    nno <leader>ga :Gadd<cr>
    nno <leader>gb :Gblame<cr>
    nno <leader>gco :Gcheckout<cr>
    nno <leader>gci :Gcommit<cr>
    nno <leader>gm :Gmove<cr>
    nno <leader>gr :Gremove<cr>
    nno <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
    " }}}
" }}}
