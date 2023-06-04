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
cabbrev w!! !sudo -S tee %

" appearance, style and formatting
set textwidth=80
set scrolloff=5
set splitbelow splitright
set nowrap

set colorcolumn=81
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi clear SpellBad
hi clear SpellLocal
hi clear SpellCap
hi SpellBad cterm=underline

" interface
set mouse=a
set smartcase
set number relativenumber

" syntax, lsp, spellcheck etc.
set tabstop=4
set shiftwidth=4
set expandtab
set spell spelllang=en_us,pl
set wildmode=longest,list,full
set ignorecase
