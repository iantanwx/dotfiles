" Leader
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Normal Mode
" Buffers
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <silent> <leader>bq :Bdelete<CR>

" Neoterm
nnoremap <silent> <leader>to :Ttoggle<CR>
nnoremap <silent> <leader>th :call neoterm#close()<CR>
nnoremap <silent> <leader>tc :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>

" vim-fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>

" reset search
nnoremap <Esc> :noh<CR>

" Insert Mode
inoremap jj <Esc>

" Deoplete
inoremap <silent> <CR> <C-r>=<SID>cr_fn()<CR>
function! s:cr_fn()
  return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" Easymotion
" nnoremap <leader>l <Plug>(easymotion-lineforward)
" nnoremap <leader>j <Plug>(easymotion-)
" nnoremap <leader>k <Plug>(easymotion-k)
" nnoremap <leader>h <Plug>(easymotion-linebackward)

" Plugin-specific
autocmd FileType go nmap <buffer> <leader>T :GoTest -v<CR>
autocmd FileType go nnoremap <silent> <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nnoremap <leader>dd :DlvDebug<CR>
autocmd FileType go nnoremap <leader>dt :DlvTest<CR>
autocmd FileType typescript nnoremap <silent> <leader>gd :TSDef<CR>
autocmd FileType typescript.tsx nnoremap <silent> <leader>gd :TSDef<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF <C-R>= FindRootDirectory()<CR><CR>
