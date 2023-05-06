set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/pluginrc
source ~/.vim/bindingrc

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

set autoread
set scrolloff=5 " scroll w/ 5 lines above cursor
set splitbelow splitright " split tabs at the bottom and on the right
set wildmode=longest,list,full " ctrl+n autocompletion
set hlsearch
set incsearch
set smartcase
