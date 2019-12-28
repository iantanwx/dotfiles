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
nnoremap <silent> <leader>th :Tclose<CR>
nnoremap <silent> <leader>tk :Tkill<CR>

nnoremap <silent> <leader>tf :TREPLSendFile<CR>
nnoremap <silent> <leader>tl :TREPLSendLine<CR>
vnoremap <silent> <leader>ts :TREPLSendSelection<CR>

" Lists
let g:lt_location_list_toggle_map = '<leader><leader>l'
let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

" vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>

" reset search
nnoremap <Esc> :noh<CR>

" Insert Mode
inoremap jj <Esc>

" COC

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Accept currently selected completion candidate with <CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close preview window once completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Go to *
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Unimpaired-style diagnostic message navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Filetype-specific
" Go
autocmd FileType go nnoremap <silent> <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nnoremap <leader>dd :DlvDebug<CR>
autocmd FileType go nnoremap <leader>dt :DlvTest<CR>

" TypeScript/JavaScript
autocmd FileType typescript,typescript.tsx,javascript nmap <silent> <leader>d <Plug>(jsdoc)

" Rust
autocmd FileType rust nnoremap <leader>gd <Plug>(rust-def)
autocmd FileType rust nnoremap <leader>gh <Plug>(rust-def-split)

nnoremap <C-n> :NERDTreeToggle <C-r>=FindRootDirectory()<CR><CR>
nnoremap <silent> <C-p> :FZFFiles <C-r>=FindRootDirectory()<CR><CR>
nnoremap <C-b> :FZFBuffers <CR>
nnoremap <C-a> :FZFAg <CR>

" Python
autocmd FileType python nnoremap <leader>p :call Autopep8()<CR>
