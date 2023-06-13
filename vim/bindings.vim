" ctrl bindings, mostly comfy non-vim defaults
vnoremap <c-c> "+y
map <c-v> "+p
inoremap <c-v> <esc>"+pa
"" ctrl+shift+v pastes before cursor
map <c-s-v> "+P
inoremap <c-s-v> <esc>"+Pa
vnoremap <c-x> "+d
nnoremap <leader>a <c-a>
nnoremap <leader>x <c-x>
map <c-a> <Nop>
nnoremap <c-a> ggVG
" vim surround
nmap <c-s> ysiw
nmap <c-d> ysiW
"" remap VISUAL BLOCK mode to ctrl+i
nnoremap <c-i> <c-v>
"" use ctrl+e for `ge`
nnoremap <c-e> ge

" leader bindings
let mapleader = ","
noremap <leader>sv :source $MYVIMRC<CR>
noremap <leader>nh :nohl<CR>
" search word and WORD
nnoremap <leader>sw viw"ty/<c-r>t<enter>
nnoremap <leader>sW viW"ty/<c-r>t<enter>
" toggle number and relative number
nnoremap <leader>n :set number!<CR>
nnoremap <leader>rn :set relativenumber!<CR>
" show changes
nnoremap <leader>sd :w !diff % -<CR>

" Other keys
"" Q for "quick replace all"
map Q :%s//g<Left><Left>
