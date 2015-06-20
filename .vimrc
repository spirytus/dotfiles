" Initialize vimrc{{{
    " Initial NeoBundle config {{{
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
    " }}}
    " NeoBundle plugins {{{
    NeoBundle 'aerosol/vim-session'
    NeoBundle 'kmnk/vim-unite-giti'
    NeoBundle 'christoomey/vim-tmux-navigator'
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tpope/vim-dispatch'
    NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
    NeoBundle 'tpope/vim-fireplace'
    NeoBundle 'tpope/vim-leiningen'
    NeoBundle 'gcmt/wildfire.vim'
    "NeoBundle 'thinca/vim-ref.git'
    NeoBundle 'vim-erlang/vim-erlang-compiler'
    NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
    NeoBundle 'vim-erlang/vim-erlang-runtime'
    NeoBundle 'vim-erlang/vim-erlang-tags'
    NeoBundle 'vim-erlang/erlang-motions.vim'
    NeoBundle 'regedarek/ZoomWin'
    NeoBundle 'moll/vim-bbye.git'
    NeoBundle 'jnurmine/Zenburn'
    NeoBundle 'w0ng/vim-hybrid'
    NeoBundle 'whatyouhide/vim-gotham'
    NeoBundle 'mattn/gist-vim'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'rking/ag.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'Shougo/vimshell.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
        \ }
    NeoBundle 'klen/python-mode'
    NeoBundle 'tmhedberg/matchit'
    NeoBundle 'xolox/vim-lua-ftplugin'
    NeoBundle 'vim-scripts/luarefvim'
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'sjl/tslime.vim'
    NeoBundle 'bling/vim-airline'
    NeoBundle 'lervag/vimtex'
    NeoBundleCheck

    " }}}
    " Basic settings {{{
    let $VIM = expand('~/.vim/')
    set nocompatible
    set shell=/bin/zsh
    let mapleader=" "
    set ls=2
    set mouse=a
    set iskeyword+=.
    set iskeyword+=:
    set hidden
    
    syntax on
    filetype plugin indent on
    filetype plugin on
    set splitright
    set splitbelow
    set title
    set relativenumber
    set incsearch
    "set hlsearch
    set backspace=indent,eol,start
    nno j gj
    nno k gk

    ino jj <Esc>
    ino jk <Esc>

    " Set how invisible characters are displayed
set listchars=tab:▸\ ,eol:¬,trail:\ ,extends:>,precedes:<

    if executable('ag')
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--nocolor --nogroup -S'
        let g:unite_source_grep_recursive_opt=''
        let g:unite_source_rec_async_command='ag --nocolor --nogroup --skip-vcs-ignores --hidden -g ""'
    endif

    let g:unite_source_history_yank_enable = 1
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_force_overwrite_completefunc = 1

    nnoremap <silent><Leader>f :Unite -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><Leader>fs :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><Leader>l :Unite -resume -buffer-name=recent -start-insert file_mru<CR>
    nnoremap <silent><Leader>bf :Unite -resume buffer -start-insert<CR>
    nnoremap <silent><Leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
    nnoremap <silent><leader>er :Unite ref/erlang -default-action=split -start-insert<cr>
    nnoremap <silent><leader>ag :Unite -buffer-name=search grep:.<cr>
    nnoremap <silent><leader>sm :Unite -quick-match -auto-preview buffer<cr>

    nno <leader>K :<C-u>Unite ref/erlang
                \ -vertical -default-action=split<CR>

    let g:gist_open_browser_after_post = 1

    let g:erlang_tags_ignore = '_rel'

    let g:ref_use_vimproc = 1
    let g:ref_open = 'split'
    let g:ref_cache_dir = expand($TMP . '/vim_ref_cache/')

    let g:unite_source_rec_async_command='ag --nocolor --nogroup --skip-vcs-ignores --hidden -g ""'

    "tslime
    vmap <C-c><C-c> <Plug>SendSelectionToTmux
    nmap <C-c><C-c> <Plug>NormalModeSendToTmux
    nmap <C-c>r <Plug>SetTmuxVars

    map <F11>  <Esc>:!ctags -R .<CR>

    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h

    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>
    map <Leader>. <esc>:sh<CR>
    map <Leader>lo <esc>:lopen<CR>

    nnoremap <leader>ve :e $MYVIMRC<CR>
    nnoremap <leader>ze :e ~/.zshrc<CR>
    nnoremap <leader>re :reg<CR>
    nnoremap <Leader>e :Ex<CR>
    nnoremap <Leader>x :Bd<CR>
    nnoremap <Leader>q <esc>:q<CR>
    nnoremap <leader>gg :Gist -p<cr>
    nnoremap <leader>ggl :Gist -l<cr>
    nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
    nnoremap <Leader>sc :%s/\<<C-r><C-w>\>/gc
    nnoremap <Leader>sh :VimShell<CR>
    nnoremap <S-Tab> :bprevious!<CR>
    nnoremap <silent><Leader>w :w<CR>
    nnoremap <silent><Leader>wq :wq<CR>

    " center when finding next word
     nnoremap n nzz
     nnoremap N Nzz
     nnoremap * *zz
     nnoremap # #zz
     nnoremap g* g*zz
     nnoremap g# g#zz
     nnoremap <C-]> <C-]>zz
     nnoremap <C-O> <C-O>zz
     nnoremap <C-I> <C-I>zz

    set number
    autocmd! bufwritepost .vimrc source %
    " Color settings
    "set t_Co=256

    colors hybrid
    set background=light
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
        nnoremap [q :cprevious<CR>
        " }}}
    " }}}

    " Language-specific settings {{{
    " Python {{{
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    let g:pymode = 1
    let g:pymode_virtualenv = 1
    let g:pymode_trim_whitespaces = 1
    let g:pymode_motion = 1
    let g:pymode_folding = 1
    let g:pyflakes_use_quickfix = 0
    let g:pymode_rope = 0
    " }}}
" Erlang {{{
        let g:syntastic_erlang_checkers=['syntaxerl']
        autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab
        let g:erlang_folding = 1
        let g:erlang_use_conceal = 0
        map <silent> <C-F9> :w<CR>:!rebar eunit skip_deps=true<CR>
        inore <C-Space> <C-X><C-O>

        "" make gf work
        set sua+=.erl
        set sua+=.hrl
        let erlang_path=substitute(system("which erl"), "/bin/erl", "/lib/**/src/", "")
        "exe ":set path+="."src/,deps/**/src/,apps/**/src/,**/include/," . erlang_path

        "  jump to a module when there's no <cword> around
        function! GoToFile()
            call inputsave()
            let f = input('File/Module: ')
            call inputrestore()
            exec "find " . f
        endfunction         
        nore <C-g> :call GoToFile()<CR>
    " }}}
    " GOLANG {{{
    filetype off
    set runtimepath+=$GOROOT/misc/vim
    syntax on
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    au FileType go map <leader>r :!go run %<CR>
    au FileType go map <leader>t :!go test %<CR>
    filetyp plugin on
    inore <C-Space> <C-X><C-O>
    " }}}
    " }}}

    " Sessions {{{
    map <Leader>ss :SessionSave<CR>
    map <Leader>so :SessionOpen<CR>
    let g:session_directory = $VIM . 'sessions/'
    let g:session_command_aliases = 1
    let g:session_autosave = 'prompt'
    let g:session_default_to_last = 0
    "}}}
    " Lua {{{
    map <Leader>u :! lua % <CR>
    let lua_complete_omni = 1
    " }}}
    " Clojure {{{
    "nmap <buffer> K <Plug>FireplaceK
    nnoremap <leader>cv :Eval<CR>
    vnoremap <leader>cv :Eval<CR>
    " }}}

    " Dispatch {{{
    autocmd FileType lua let b:dispatch = 'make test-lua'
    nnoremap <F9> :Dispatch make test-lua<CR>
    " }}}

    " Fugitive and GIT {{{
    no <leader>gd :Gdiff<cr>
    nno <leader>gst :Gstatus<CR><C-W>15+
    nno <leader>gw :Gwrite<cr>
    nno <leader>gps :Git push<cr>
    nno <leader>gpl :Git pull<cr>
    nno <leader>gf :Gil fetch<cr>
    nno <leader>gfre :!git fetch origin
    nno <leader>gb :Gblame<cr>
    nno <leader>gco :Gcheckout<cr>
    nno <leader>gc :Gcommit<cr>
    nno <leader>gm :Gmove<cr>
    nno <leader>gr :Gremove<cr>
    nno <leader>gre :!git remote 

    nnoremap <Tab> :bnext!<CR>
    " }}}
" }}}
