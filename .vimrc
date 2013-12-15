" Initialize vimrc{{{
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
    NeoBundle 'jnurmine/Zenburn'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'kevinw/pyflakes-vim'
    NeoBundle 'sjl/gundo.vim'
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
    let $VIM = expand('~/.vim/')
    set nocompatible
    set shell=/bin/zsh
    let mapleader=","
    set ls=2
    set mouse=a
    syntax on
    filetype plugin indent on
    set splitright
    set splitbelow
    set title
    nno j gj
    nno k gk

    ino jj <Esc>
    ino jk <Esc>
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
        " Enable wildmenu {{{
        set wildmode=longest:full
        set wildmenu
        set wildignore=
        set wildignore+=.hg,.git,.svn,rel
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
        set wildignore+=*.DS_Store
        set wildignore+=*.pyc
        set wildignore+=*.beam"
        " }}}
        " Statusline {{{
        set statusline=
        set statusline +=%1*\ %n\ %*            "buffer number
        set statusline +=%5*%{&ff}%*            "file format
        set statusline +=%3*%y%*                "file type
        set statusline +=%t*            "full path
        set statusline +=%2*%m%*                "modified flag
        set statusline +=%1*%=%5l%*             "current line
        set statusline +=%2*/%L%*               "total lines
        set statusline +=%1*%4v\ %*             "virtual column number
        set statusline +=%2*0x%04B\ %*          "character under cursor"
        " }}}
    "Quickfix {{{
        nnoremap <Leader>q :copen<CR>
        nnoremap <Leader>qc :close<CR>
        nnoremap ]q :cnext<CR>
        nnoremap [q :cprevious<CR>]
        " }}}
        " <Leader>w saves
        nnoremap <silent><Leader>w :w<CR>
        
        " Replace word under cursor
        nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
    " }}}za
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirrzor
"autocmd VimEnter * wincmd p

" Language specific tabs & spaces
    autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab
    " Language-specific settings {{{
" Erlang {{{
        set runtimepath^=~/.vim/bundle/vim-erlang-tags
        let g:erlang_folding = 1
        let g:erlang_use_conceal = 0
        map <silent> <C-F9> :w<CR>:!rebar eunit skip_deps=true<CR>
        inore <C-Space> <C-X><C-O>

        "" make gf work
        set sua+=.erl
        set sua+=.hrl
        let erlang_path=substitute(system("which erl"), "/bin/erl", "/lib/**/src/", "")
        exe ":set path+="."src/,deps/**/src/,apps/**/src/,**/include/," . erlang_path

        "  jump to a module when there's no <cword> around
        function! GoToFile()
            call inputsave()
            let f = input('File/Module: ')
            call inputrestore()
            exec "find " . f
        endfunction
        nore <C-g> :call GoToFile()<CR>
    " }}}
    " }}}
    " Python {{{
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    let g:pymode = 1
    let g:pymode_virtualenv = 1
    let g:pymode_trim_whitespaces = 1
    let g:pymode_motion = 1
    let g:pymode_folding = 1
    let g:pyflakes_use_quickfix = 0
    " }}}
" Set how invisible characters are displayed
    set listchars=tab:▸\ ,eol:¬,trail:\ ,extends:>,precedes:<
    nnoremap <silent><Leader>f :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><Leader>fs :Unite -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><Leader>, :Unite -resume -buffer-name=recent file_mru<CR>
    nnoremap <silent><Leader>b :Unite -resume buffer<CR>
    nnoremap <silent><Leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>
    map <Leader>. <esc>:sh<CR>
    nno <C-Right> gt
    nno <C-Left> gT

    set number
    autocmd! bufwritepost .vimrc source %
    " File explorer xx
    nnoremap <Leader>e :Ex<CR>
  " Color settings
    set t_Co=256
    colors koehler
    set background=light
    " Sessions {{{
    map <Leader>ss :SessionSave<CR>
    map <Leader>so :SessionOpen<CR>
    let g:session_directory = $VIM . 'sessions/'
    let g:session_command_aliases = 1
    let g:session_autosave = 'prompt'
    let g:session_default_to_last = 0
    "}}}
    " Buffers
    nnoremap <Tab> :bnext!<CR>
    nnoremap <S-Tab> :bprevious!<CR>
    nnoremap <Leader>x :bdelete<CR>

    " Fugitive and GIT {{{
    no <leader>gd :Gdiff<cr>
    nno <leader>gs :Gstatus<CR><C-W>15+
    nno <leader>gw :Gwrite<cr>
    nno <leader>gps :Git push<cr>
    nno <leader>gpl :Git pull<cr>
    nno <leader>gf :Gil fetch<cr>
    nno <leader>gb :Gblame<cr>
    nno <leader>gco :Gcheckout<cr>
    nno <leader>gci :Gcommit<cr>
    nno <leader>gm :Gmove<cr>
    nno <leader>gr :Gremove<cr>
    nno <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
    " }}}
" }}}
