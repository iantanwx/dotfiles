command! -nargs=1 Silent
\   execute <q-args>
\ | execute 'redraw!'

" Airline
let g:airline_theme = 'material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#neomake#enabled = 1

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
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_go_enabled_makers = ['golint', 'govet', 'gometalinter']
let g:neomake_open_list = 0


call neomake#configure#automake({
\ 'BufWinEnter': {'delay': 0},
\ 'BufWritePost': {'delay': 0},
\ })

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
call deoplete#custom#source('_', 'converters', ['converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu', 'converter_auto_delimiter', 'converter_auto_paren'])

" Echodoc
let g:echodoc_enable_at_startup = 1

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
  " call neoterm#do('cd %:p:h && go test -v -timeout 30s')
  Silent GoTest
endfunction

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#source_importer = 1
let g:delve_backend = "native"
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=100 " this sets go type info to show almost instantaneously
" automatically run tests for related package
augroup golang
  autocmd!
  autocmd BufWritePost *.go call GoTestCurrentFile()
augroup END

" Rust-specific
augroup rust
  set hidden
  let g:racer_cmd = "~/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
augroup END

" OCaml-specific
" Merlin setup
if executable('ocp-index')
  let s:ocpindex = substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-index"
  execute "set rtp+=" . s:ocpindex . "/vim"
endif

autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', ''''''). "typerex/ocp-ident"

" TS/JS-specific
let g:deoplete#sources#ternjs#filetypes = [
								\ 'js',
								\ 'jsx'
								\ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:nvim_typescript#type_info_on_hold = 1
let g:jsdoc_enable_es6 = 1

" OCaml-specific
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Markdown-specific
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
