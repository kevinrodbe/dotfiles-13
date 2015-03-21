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
nnoremap <leader><space> :noh<cr>
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
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" Open .vimrc quickly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Alternate exit from insert mode
inoremap jj <ESC>

" from http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
" Alt+J to insert empty new line below
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" Alt+K to insert empty new line above
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" from http://robots.thoughtbot.com/vim-spell-checking
" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell
" Enable spellchecking for git commit messages
autocmd FileType gitcommit setlocal spell

" from @pda - https://github.com/pda/dotvim/blob/master/vimrc
" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" status bar configuration
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" plugins

" ctrl:p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>o :CtrlP<CR>
set wildignore+=**_site/**

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" let g:airline_section_b = '%{fugitive#statusline()}'

" vim-go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

" YouCompleteMe
set completeopt-=preview " Make sure vim preview window never shows up as per https://github.com/Valloric/YouCompleteMe#i-get-a-weird-window-at-the-top-of-my-file-when-i-use-the-semantic-engine
