" init.vim
" Neovim init (in place of vimrc)
let g:nvim_dir = fnamemodify(resolve(expand('$MYVIMRC')), ':p:h')

" ============================================================================
" :terminal emulator
" ============================================================================

" tnoremap <Esc>  <C-\><C-n>

let g:terminal_scrollback_buffer_size = 100000

" ============================================================================
" Python setup
" Skips if python is not installed in a pyenv virtualenv
" ============================================================================

" ----------------------------------------------------------------------------
" Python 2
" ----------------------------------------------------------------------------

let s:pyenv_python2 = glob(expand('$PYENV_ROOT/versions/neovim2/bin/python'))
if !empty(s:pyenv_python2)
  " CheckHealth and docs are inconsistent
  let g:python_host_prog  = s:pyenv_python2
else
  let g:loaded_python_provider = 1
endif

" ----------------------------------------------------------------------------
" Python 3
" ----------------------------------------------------------------------------

let s:pyenv_python3 = glob(expand('$PYENV_ROOT/versions/neovim3/bin/python'))
if !empty(s:pyenv_python3)
  let g:python3_host_prog = s:pyenv_python3
else
  let g:loaded_python3_provider = 1
endif

" =============================================================================

execute 'source ' . g:nvim_dir . '/vimrc'
execute 'source ' . g:nvim_dir . '/plugins.vim'
execute 'source ' . g:nvim_dir . '/keymap.vim'
