" Colour Scheme
syntax on
let g:onedark_termcolors=16
colorscheme onedark

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

" FZF
let g:fzf_command_prefix = 'FZF'
let g:fzf_layout = { 'down': 16 }
let g:fzf_buffers_jump = 1

" NERDTree 
autocmd StdinReadPre * let s:std_in=1
" Close everything if only nerdtree is left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

let NERDTreeShowHidden = 1

" Neomake
" Call neomake when a file is written to
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_go_enabled_makers = ['go', 'gometalinter']

call neomake#configure#automake('w')

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
set completeopt+=noinsert

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snip"]

" Go-specific
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
set updatetime=100 " this sets go type info to show almost instantaneously
autocmd FileType go nmap <buffer> <leader>t :GoTest -v<CR>

" TS/JS-specific
let g:deoplete#sources#ternjs#filetypes = [
								\ 'js',
								\ 'jsx'
								\ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"Syntax:JavaScript/TypeScript
autocmd FileType javascript JsPreTmpl html
autocmd FileType typescript JsPreTmpl html
