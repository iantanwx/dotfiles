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
" Use <Esc> to exit from the terminal buffer
autocmd FileType neoterm tnoremap <buffer> <Esc> <C-\><C-n>
nnoremap <silent> <leader>to :Ttoggle<CR>
nnoremap <silent> <leader>th :Tclose<CR>
nnoremap <silent> <leader>tk :Tkill<CR>

" Lists
let g:lt_location_list_toggle_map = '<leader><leader>l'
let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

" vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gv :GV<CR>

" reset search
nnoremap <Esc> :noh<CR>

" Insert Mode
inoremap jj <Esc>

" FS navigation
nnoremap <C-n> :NERDTreeToggle <C-r>=FindRootDirectory()<CR><CR>
nnoremap <silent> <C-p> :FZFFiles <C-r>=FindRootDirectory()<CR><CR>
nnoremap <C-b> :FZFBuffers <CR>
nnoremap <C-a> :FZFAg <CR>

" vim-surround
nmap <Leader>w( ysie)
nmap <Leader>w[ ysie]
nmap <Leader>w{ ysie}
nmap <Leader>w" ysie"
vmap <Leader>w( S)
vmap <Leader>w[ S]
vmap <Leader>w{ S}
vmap <Leader>w" S"

"" COC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Accept currently selected completion candidate with <CR>
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Go to *
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gR <Plug>(coc-refactor)
nmap <silent> <leader>gn <Plug>(coc-rename)

" Unimpaired-style diagnostic message navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go
autocmd FileType go nnoremap <silent> <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nnoremap <leader>dd :DlvDebug<CR>
autocmd FileType go nnoremap <leader>dt :DlvTest<CR>

" TypeScript/JavaScript
autocmd FileType typescript,typescript.tsx,javascript nmap <silent> <leader>d <Plug>(jsdoc)

" Clojure
nmap <S-Right> <Plug>(sexp_capture_next_element)<Plug>(sexp_indent)
nmap <S-Left> <Plug>(sexp_emit_tail_element)<Plug>(sexp_indent)
imap <S-Right> <C-O><Plug>(sexp_capture_next_element)<C-O><Plug>(sexp_indent)
imap <S-Left> <C-O><Plug>(sexp_emit_tail_element)<C-O><Plug>(sexp_indent)

nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>E :%Eval<CR>
nmap <Leader>R cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>
