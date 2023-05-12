set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/pluginrc
source ~/.vim/bindingrc

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" deletes all trailing whitespace and newlines at end of file on
" save and resets cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" save file as sudo on files that require root permission
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" basics
set number
set mouse=a

set spell spelllang=en_us,pl
set termguicolors
set nowrap

" for faster hjkl-ing around
set ttimeoutlen=50

" style and formatting
set colorcolumn=81
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set textwidth=80
set formatoptions=tcqj
set tabstop=4
set shiftwidth=4
set expandtab

set autoread
set scrolloff=5 " scroll w/ 5 lines above cursor
set splitbelow splitright " split tabs at the bottom and on the right
set wildmode=longest,list,full " ctrl+n autocompletion
set hlsearch
set incsearch
set smartcase
