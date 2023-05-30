set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/pluginrc
source ~/.vim/bindingrc

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" deletes all trailing whitespaces on save and resets cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" save file as sudo on files that require root permission
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" for faster hjkl-ing around
set ttimeoutlen=50

" style and formatting
set textwidth=80
set formatoptions=tcqj

set tabstop=4
set shiftwidth=4
set expandtab

set colorcolumn=81
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi SpellBad gui=underline

" misc
set mouse=a
set scrolloff=5
set splitbelow splitright
set number
set autoread

set spell spelllang=en_us,pl
set wildmode=longest,list,full
set termguicolors
set nowrap
set hlsearch
set incsearch
set smartcase
