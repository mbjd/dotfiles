" General stuff
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set keywordprg=ggl          " Pressing K googles the word under the cursor
set clipboard=unnamed       " Yank/paste with system clipboard
set lazyredraw              " Maybe these will make it faster?
set ttyfast
set wildmode=list:longest,full " Display all command options on <tab>
set backspace=indent,eol,start
set showcmd                 " Show the command being typed at the bottom
set scrolloff=5
" set autochdir               " working directory = location of opened file
" set autoread
set shiftwidth=4
set tabstop=4
" set directory^=$HOME/.vim/swp//

" Increment/decrement numbers with +/-
nnoremap - <C-x>
nnoremap + <C-a>

set number
set numberwidth=4
set relativenumber
set ruler
set cursorline

set guioptions=gmiM
set linespace=4
set guifont=Input\ Mono:h15

" leader = ,
let mapleader=","

" Rejustify paragraph without jumping to its end
nnoremap <leader>f m`gqip``

" Auto-indent file without moving cursor
nnoremap <leader>i m`gg=G``

" Rejustify paragraph, write, and make
nnoremap <leader>M m`gqip``:w<CR>:make<CR>
" Write and make
nnoremap <leader>m :w<CR>:make<CR>

" Save/quit with leader instead of :
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :q!<CR>

" Easier tab handling
nnoremap <leader>t :tabe<CR>

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

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.tex set textwidth=98

" Clear trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" SEARCH
set hlsearch       " Highlight all search results
set incsearch      " Search again at each new character
set ignorecase     " case insensitive...
set smartcase      " ...but only when the search term is lowercase

" Clear search by pressing space
nnoremap <silent> <Space> :nohlsearch<CR>

" " Some syntax options
" autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
" let g:tex_flavor='latex'

" " Don't conceal anything, not even in .tex files
" filetype plugin on
" set conceallevel=0
" let g:tex_conceal = ""

" " COLOR SCHEME
syntax on
set background=dark

let g:sierra_Twilight = 1
" let g:sierra_Midnight = 1
" let g:sierra_Pitch = 1
colorscheme sierra

" Highlight different kinds of whitespace with symbols
set list
set listchars=extends:…,precedes:…,tab:›\ ,nbsp:·

" Set the colors after setting a color scheme, otherwise they're overridden
highlight NonText ctermfg=239 guifg=#4e4e4e
highlight SpecialKey ctermfg=239 guifg=#4e4e4e

" Because vim assumes bash for interfacing with the shell
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" Get some plugins
call plug#begin('~/.vim/plugged')

Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')

call plug#end()
