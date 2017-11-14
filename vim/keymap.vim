" Leader
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Normal Mode
" Buffers
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <silent> <leader>q :Bdelete<CR>

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
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" Plugin-specific
autocmd FileType go nmap <buffer> <leader>T :GoTest -v<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF <C-R>= FindRootDirectory()<CR><CR>
