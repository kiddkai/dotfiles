set backspace=2         " backspace in insert mode works like normal editor

syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set autoread            " auto reloads the file content

set number relativenumber
set nu rnu
set noequalalways


set nobackup            " get rid of anoying ~file
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set clipboard+=unnamedplus
set mouse=a

lua require('plugins')
lua require('config.bindings')

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
lua << EOF
require("catppuccin").setup()
EOF
colorscheme catppuccin

" vim-vsnip
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
