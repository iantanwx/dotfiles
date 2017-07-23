" plugin/colorscheme.vim

if !has('nvim') && has('termguicolors')
  set termguicolors
endif

syntax on
let g:onedark_termcolors=16
colorscheme onedark

