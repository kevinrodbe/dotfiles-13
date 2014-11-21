set nocompatible

call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
colorscheme molokai

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" from http://items.sjbach.com/319/configuring-vim-right
set hidden
set history=1000
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ruler

" from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set modelines=0
set encoding=utf-8
set autoindent
set showmode
set showcmd
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set incsearch
set showmatch
set hlsearch
" Map <leader> key to , instead of \
let mapleader = ","
" Force me to learn HJKL instead of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" makes j and k work the way you expect instead of working in some archaic
" “movement by file line instead of screen line” fashion.
nnoremap j gj
nnoremap k gk
" Strip trailing whitespace from file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Open .vimrc quickly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Alternate exit from insert mode
inoremap jj <ESC>

" status bar configuration
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" plugins

" ctrl:p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>o :CtrlP<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
