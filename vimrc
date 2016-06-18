" General stuff
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set keywordprg=ggl          " Pressing K googles the word under the cursor
set clipboard=unnamed       " Yank/paste with system clipboard
set lazyredraw              " Maybe these will make it faster?
set ttyfast
set wildmode=list:longest,full " Display all command options on <tab>
set backspace=indent,eol,start
set showcmd                 " Show the command being typed at the bottom
set autochdir               " working directory = location of opened file
set scrolloff=5
set autoread
set tabstop=4

" Increment/decrement numbers with +/-
nnoremap - <C-x>
nnoremap + <C-a>

set number
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

" Clear search on esc
nnoremap <silent> <esc> :noh<cr><esc>

" Some split options
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Use whole WORDs when opening URLs with gx.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" Save swap files in one place
set directory^=$HOME/.vim/swp//


" In normal mode, use the arrow keys for indentation
nmap <right> >>
nmap <left> <<

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
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>:set nospell<CR>

" Map n to nzz and N to Nzz to center the next/prev search result, but only if it's not in the
" screen. Taken from https://redd.it/4jy1mh
function! s:nice_next(cmd)
	let view = winsaveview()
	execute "normal! " . a:cmd
	if view.topline != winsaveview().topline
	normal! zz
	endif
endfunction
nnoremap <silent> n :call <SID>nice_next('n')<cr>
nnoremap <silent> N :call <SID>nice_next('N')<cr>

" Some syntax options
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
let g:tex_flavor='latex'

" Don't conceal anything, not even in .tex files
filetype plugin on
set conceallevel=0
let g:tex_conceal = ""

" COLOR SCHEME
syntax on
let g:sierra_Twilight = 1
" let g:sierra_Midnight = 1
" let g:sierra_Pitch = 1
colorscheme sierra
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

" Highlight different kinds of whitespace with symbols
" Set the colors after setting a color scheme, otherwise they're overridden
set list
set listchars=eol:¬,extends:…,precedes:…,tab:‣\ ,trail:·,nbsp:~

highlight NonText ctermfg=239 guifg=#4e4e4e
highlight SpecialKey ctermfg=239 guifg=#4e4e4e

" Pathogen plugin manager
execute pathogen#infect()
