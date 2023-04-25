set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/pluginrc
source ~/.vim/bindingsrc


set spell spelllang=en_us,pl
set termguicolors
set number relativenumber
set mouse=a


" For faster hjkl-ing around and stuff
set ttimeoutlen=50


" Style and formatting 
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
