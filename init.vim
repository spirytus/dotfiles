let $VIM        = expand('~/.config/nvim/')
let $TMP        = expand($VIM . 'tmp/')
let $BUNDLES    = expand($VIM . 'site/')
if !isdirectory($TMP)
  call mkdir($TMP, "p")
endif

set shell=/bin/zsh

call plug#begin($BUNDLES)
Plug 'rbgrouleff/bclose.vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir', {'for': ['eelixir', 'elixir']}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit', {'branch': 'master'}
Plug 'terryma/vim-multiple-cursors'
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

autocmd! bufwritepost init.vim source %
autocmd! bufwritepost ~/.config/nvim/init.vim source %
let mapleader=" "
" Disable backup files {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden "prevent do not save last change..
nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>ez :e! ~/.zshrc<CR>
nnoremap <leader>et :e! ~/.tmux.conf<CR>
nnoremap <leader>. :terminal<CR>
nno <leader>gb :Gblame<cr>
set clipboard=unnamed
ino jj <Esc>
set relativenumber
set number
set nohlsearch
set splitright
set splitbelow
nnoremap <Tab><Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>
nnoremap <leader>w :w<CR>
"ino <leader><leader> :w<CR>
" center when finding next word
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

nmap <c-j> <C-w><C-j>
nmap <c-k> <C-w><C-k>
nmap <c-l> <C-w><C-l>
nmap <c-h> <C-w><Left>
nnoremap <leader>bd :Bclose<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vsp<CR>
"nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>sc :%s/\<<C-r><C-w>\>/gc
nno j gj
nno k gk
nnoremap <C-]> <C-]>zz
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz
autocmd BufWritePre * :%s/\s\+$//e
let test#strategy = 'tslime'
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
nnoremap <leader>m :Magit<CR>

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'default_opts',
\ ['--follow', '--nocolor', '--nogroup', '--smart-case', '--hidden'])

call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '-g', ''])

highlight deniteMatched guibg=None
highlight deniteMatchedChar guibg=None
nnoremap <leader>ag :Denite grep<CR>
nnoremap <leader>l :Denite file_old<CR>
nnoremap <leader>f :Denite file_rec<CR>
nnoremap <leader>bf :Denite buffer<CR>
let g:deoplete#enable_at_startup = 1
  autocmd User VimagitUpdateFile
    \ if ( exists("*gitgutter#process_buffer") ) |
    \   call gitgutter#process_buffer(bufnr(g:magit_last_updated_buffer), 0) |
    \ endif
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
call denite#custom#map(
	      \ 'insert',
	      \ '<Down>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
	      \)
	call denite#custom#map(
	      \ 'insert',
	      \ '<Up>',
	      \ '<denite:move_to_previous_line>',
	      \ 'noremap'
	      \)

	call denite#custom#map(
	      \ 'insert',
	      \ '<C-V>',
	      \ '<denite:do_action:vsplit>',
	      \ 'noremap'
	      \)
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-S>',
	      \ '<denite:do_action:split>',
	      \ 'noremap'
	      \)
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-P>',
	      \ '<denite:do_action:preview>',
	      \ 'noremap'
	      \)
