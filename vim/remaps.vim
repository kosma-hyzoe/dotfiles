let g:mapleader = ","

" Ctrl remaps

" Comfy copy, paste, cut and select all
vnoremap <c-c> "+y
map <c-v> "+p
inoremap <c-v> <esc>"+pa
vnoremap <c-x> "+d
nnoremap <c-a> <Nop>
map <c-a> ggVG

" Use Ctrl+i for visual mode
nnoremap <c-i> <c-v>

nnoremap <c-e> ge


" Leader remaps

nnoremap <leader>nh :nohl<CR>
nnoremap <leader>sn :set number!<CR>
nnoremap <leader>sr :set relativenumber!<CR>

" Search word/WORD
nnoremap <leader>nw viw"ty/<c-r>t<CR>
nnoremap <leader>nW viW"ty/<c-r>t<CR>

" Source vimrc
noremap <leader>sv :source $MYVIMRC<CR>

" Show diff
nnoremap <leader>sd :w !diff % -<CR>

" Close buffer
nmap <leader>cb :bp<bar>sp<bar>bn<bar>bd<CR>

" Quick search
nmap Q :%s//g<Left><Left><CR>

" Perform dot commands over visual blocks
vnoremap . :normal .<CR>

" Recent additions

" Move selection up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Center cursor while searching and scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap { {zz
nnoremap } }zz

" Center cursor while searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Center cursor while joining lines
nnoremap J mzJ`z

nnoremap <leader>ex :Ex<CR>
nnoremap <leader>cx :!chmod +x %<CR>

" Replace word that the cursor is on
nnoremap <leader>rw :%s/\<\<<C-r><C-w>\>/\<C-r><C-w>/gI<Left><Left><Left>

" Change indent witdth, use tabs for t8
nnoremap <leader>t2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>
nnoremap <leader>t4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>
nnoremap <leader>t8 :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab<CR>
