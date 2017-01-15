set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8
let mapleader = "\\"
set backspace=2
set hidden

" from vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" syntax and color
syntax on

set relativenumber 
set number
set t_Co=256

" Indent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'                   " Add, remove, and change surrounding characters in pairs
Plug 'racer-rust/vim-racer'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'                     " code snippets
Plug 'marijnh/tern_for_vim'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'lyokha/vim-xkbswitch'
Plug 'junegunn/vim-peekaboo'
Plug 'vimwiki/vimwiki'
call plug#end()


" syntax check
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['standard']
let NERDTreeShowHidden=1 


au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

map <F2> :NERDTreeToggle<CR>

set splitbelow
set splitright

" split
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" CtrlP
let g:ctrlp_map = '<c-~>'
map <C-p> :FZF<CR>
map <C-a> :CtrlPBuffer<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_vious_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" keyboard switcher
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib' 
let g:XkbSwitchEnabled = 1

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

autocmd FileType wiki source ~/.vim-scripts/wiki.vim

" racer
let g:racer_cmd = "/Users/zekaizheng/.cargo/bin/racer"
let $RUST_SRC_PATH="/Users/zekaizheng/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
let g:racer_experimental_completer = 1
