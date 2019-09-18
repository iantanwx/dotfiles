" Lightline configuration
let g:lightline = {
  \   'colorscheme': 'material_vim',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_expand': {
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_type': {
  \     'buffers': 'tabsel',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.tabline =  {
  \ 'left': [['buffers']],
  \ 'right': [['close']]
\ }
set showtabline=2
set guioptions-=e

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-rooter
" we don't want rooter changing directories automatically
let g:rooter_manual_only = 1

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
let g:neomake_error_sign   = {'text': '⚠', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_go_enabled_makers = ['golint']
let g:neomake_open_list = 0

call neomake#configure#automake({
\ 'BufWinEnter': {'delay': 0},
\ 'BufWritePost': {'delay': 0},
\ })

" Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

" UltiSnips
let g:UltiSnipsRemoveSelectModeMappings=1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snip"]

" Neoterm
let g:neoterm_size=winheight(0)/3 " constrain height of terminal window to 33%
let g:neoterm_fixedsize=1

" Go-specific
function! GoTestCurrentFile()
  silent GoTest
endfunction

let g:go_code_completion_enabled = 0
let g:go_echo_go_info = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:delve_backend = "native"

" automatically run tests for related package
augroup golang
  set noshowmode
  autocmd!
  autocmd BufWritePost *.go call GoTestCurrentFile()
augroup END

" Rust-specific
" augroup rust
"   set hidden
"   let g:racer_cmd = "~/.cargo/bin/racer"
"   let g:racer_experimental_completer = 1
" augroup END

" Python-specific
let g:python_highlight_all = 1
let g:autopep8_on_save = 0

" Markdown-specific
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
