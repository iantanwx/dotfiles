" plugin/operator.vim
"
" vim-operator-user operators
"

if !dko#IsPlugged('vim-operator-user') | finish | endif

let s:cpo_save = &cpoptions
set cpoptions&vim

" ============================================================================

if dko#IsPlugged('operator-camelize.vim')
  silent! unmap <Leader>c
  map <special> <Leader>c <Plug>(operator-camelize-toggle)
endif

" ============================================================================

let &cpoptions = s:cpo_save
unlet s:cpo_save
