" Automatically open NERDTree on init
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map key to toggle
nnoremap <C-n> :NERDTreeToggle<CR>
