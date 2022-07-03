set backspace=2         " backspace in insert mode works like normal editor

syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting

set number relativenumber
set nu rnu

colorscheme monokai     " colorscheme desert
set nobackup            " get rid of anoying ~file
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set clipboard+=unnamedplus

lua require('plugins')
lua require('config.bindings')

