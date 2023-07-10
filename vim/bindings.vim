" ctrl bindings, mostly comfy non-vim defaults
vnoremap <c-c> "+y
map <c-v> "+p
inoremap <c-v> <esc>"+pa
"" ctrl+shift+v pastes before cursor
map <c-s-v> "+P
inoremap <c-s-v> <esc>"+Pa
vnoremap <c-x> "+d
nnoremap <leader>x <c-x>
nnoremap <c-a> <Nop>
map <c-a> ggVG
nmap <c-d> :q<CR>
" vim surround
nmap <c-s> ysiw
nmap <c-s-s> ysiW
"" remap VISUAL BLOCK mode to ctrl+i
nnoremap <c-i> <c-v>
nnoremap <leader>cv <c-v>
"" use ctrl+e for `ge`
nnoremap <c-e> ge

" leader bindings
let mapleader = ","
noremap <leader>sv :source $MYVIMRC<CR>
noremap <leader>nh :nohl<CR>
noremap <leader>cv <c-v>
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
"" perform dot commands over visual blocks:
vnoremap . :normal .<CR>

