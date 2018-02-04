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

" Lists
let g:lt_location_list_toggle_map = '<leader><leader>l'
let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

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
" nnoremap <leader>j <Plug>(easymotion-j)
" nnoremap <leader>k <Plug>(easymotion-k)
" nnoremap <leader>h <Plug>(easymotion-linebackward)

" Filetype-specific
" Go
autocmd FileType go nmap <buffer> <leader>T :GoTest -v<CR>
autocmd FileType go nnoremap <silent> <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nnoremap <leader>dd :DlvDebug<CR>
autocmd FileType go nnoremap <leader>dt :DlvTest<CR>

" TypeScript/JavaScript
autocmd FileType typescript,typescript.tsx nnoremap <silent> <leader>gd :TSDef<CR>
autocmd FileType typescript,typescript.tsx nnoremap <silent> <leader>gh :TSDefPreview<CR>
autocmd FileType typescript,typescript.tsx,javascript nmap <silent> <leader>d <Plug>(jsdoc)

" Rust
autocmd FileType rust nnoremap <leader>gd <Plug>(rust-def)
autocmd FileType rust nnoremap <leader>gh <Plug>(rust-def-split)

nnoremap <C-n> :NERDTreeToggle <C-r>=FindRootDirectory()<CR><CR>
nnoremap <silent> <C-p> :FZFFiles <C-r>=FindRootDirectory()<CR><CR>
nnoremap <C-b> :FZFBuffers <CR>
nnoremap <C-a> :FZFAg <CR>
