vnoremap <C-c> "+y
map <C-v> "+p

" set insert mode cursor to i-beam
let &t_SI = "\e[6 q"
" reset cursor shape to block 
let &t_EI = "\e[2 q"
" The time in milliseconds that is waited for a key code or mapped key
" sequence to complete.
set ttimeoutlen=50

" Basics
syntax on " enable syntax
set scrolloff=5 " have the prompt 5 lines above the file ends when scrolling
set encoding=utf-8 
set noswapfile

" split tabs at the bottom and on the right
set splitbelow splitright

" ctrl+n autocompletion
set wildmode=longest,list,full

" Enable line numbers and relative numbers
set number relativenumber

" Enable line wrapping
set wrap

" Some settings from "The Hitchhiker's guide to Python"
au FileType python set textwidth=79  " break lines longer than 79
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
autocmd BufWritePost *.py call Flake8()

" Show matching brackets
set showmatch

" Highlight search results
set hlsearch

" Enable incremental searching
set incsearch

" Enable smart case searching
set smartcase

" Enable the use of the backspace key
set backspace=indent,eol,start

" Enable the use of the mouse in all modes
set mouse=a

" Enable the use of the clipboard
"set clipboard=unnamedplus

" Enable the use of the leader key
let mapleader = ","

" Enable the use of the plugin manager
" This line should be at the bottom of your .vimrc file
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'machakann/vim-highlightedyank'
call plug#end()
