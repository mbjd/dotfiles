" General stuff
set undofile                   " Save undo's after file closes
set undodir=$HOME/.vim/undo    " where to save undo histories
set keywordprg=ggl             " Pressing K googles the word under the cursor
set clipboard=unnamed          " Yank/paste with system clipboard
set clipboard=unnamedplus
set lazyredraw                 " Maybe these will make it faster?
set wildmode=list:longest,full " Display all command options on <tab>
set backspace=indent,eol,start
set showcmd                    " Show the command being typed at the bottom
set scrolloff=5
set relativenumber number
syntax on

set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set autoindent

set directory=$HOME/.vim/swp//
set backupdir=$HOME/.vim/backups//

" Keep history when closing vim
set undofile
set undodir=$HOME/.vim/undo

" Make crontab work
autocmd BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd BufEnter /tmp/crontab.* setl backupcopy=yes

" Increment/decrement numbers with +/-
nnoremap - <C-x>
nnoremap + <C-a>

set number
set numberwidth=4
set ruler

" leader = ,
let mapleader=','

" Rejustify paragraph without jumping to its end
nnoremap <leader>f :set textwidth=75<CR>m`gqip``

" Auto-indent file without moving cursor
nnoremap <leader>i m`gg=G``

" Rejustify paragraph, write, and make
nnoremap <leader>M m`gqip``:w<CR>:make<CR>
" Write and make
nnoremap <leader>m :w<CR>:make<CR>

" Save/quit with leader instead of :
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>x :x<CR>

" Easier folding
nnoremap <leader>c zf%
nnoremap <leader>a za

nnoremap <leader>t :tabe<CR>:Explore<CR>

nnoremap <leader>e :Explore<CR>

" Reload this file
nnoremap <leader>r :source ~/.vimrc<CR>

" Use whole WORDs when opening URLs with gx.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" Remap j/k to move by lines on the screen instead of lines in the file when
" wrapping, but only when not prefixed with a count (so j moves to the next
" screen line, while 2j moves by two file lines)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <buffer> <silent> $ g$

nnoremap gf <C-W>gf

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Clear trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" SEARCH
set hlsearch
set incsearch      " Search again at each new character
set ignorecase     " case insensitive...
set smartcase      " ...but only when the search term is lowercase

" Clear search by pressing space
nnoremap <silent> <Space> :nohlsearch<CR>

" Make yank behave like delete and change
nnoremap Y y$

" Use Q to execute default register
nnoremap Q @q

nnoremap J gT
nnoremap K gt

" Swap two characters like emacs
nnoremap <C-T> Xp

language en_US.UTF-8

" " Some syntax options
" autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
" let g:tex_flavor='latex'

" Textwidth of half a terminal window for prose heavy files
autocmd BufNewFile,BufReadPost *.tex,*.md,*.markdown,*.txt set textwidth=75

" " Don't conceal anything, not even in .tex files
" filetype plugin on
" set conceallevel=0
" let g:tex_conceal = ""

" Because if it's fish stuff won't work
set shell=/bin/bash

let s:uname = substitute(system('uname'), "\n", "", "")

if s:uname == "Darwin"
	" COLOR SCHEME
	syntax on
	set background=dark

	" let g:sierra_Twilight = 1
	let g:sierra_Midnight = 1
	" let g:sierra_Pitch = 1
	colorscheme sierra
	set cursorline

	set guioptions=gmiM
	set linespace=3
	set guifont=Input\ Mono:h13

	set mouse=
elseif s:uname == "Linux"

	" https://github.com/roosta/vim-srcery
	colorscheme srcery

	set guioptions=""
	set linespace=1
	set cursorline
	set guifont=DejaVu\ Sans\ Mono\ Bold\ 12
endif

" Highlight different kinds of whitespace with symbols
set list
set listchars=extends:…,precedes:…,tab:›\ ,nbsp:·

" Set the colors after setting a color scheme, otherwise they're overridden
highlight NonText ctermfg=239 guifg=#4e4e4e
highlight SpecialKey ctermfg=239 guifg=#4e4e4e

" Get some plugins
filetype plugin on

call plug#begin('~/.vim/plugged')

Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('dag/vim-fish')
Plug('vim-scripts/netrw.vim')
Plug('tpope/vim-commentary')

call plug#end()

autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4
