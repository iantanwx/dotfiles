" Colour Scheme
syntax on

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_terminal_italics = 1
colorscheme onedark

command! -nargs=1 Silent
\   execute <q-args>
\ | execute 'redraw!'

" Airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#neomake#enabled = 1

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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
let g:neomake_open_list = 2

call neomake#configure#automake('w', 500)

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " close preview window after completion
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

" TS/JS-specific
let g:deoplete#sources#ternjs#filetypes = [
								\ 'js',
								\ 'jsx'
								\ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:nvim_typescript#type_info_on_hold = 1
