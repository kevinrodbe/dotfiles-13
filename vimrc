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
set nowrap

" from http://stackoverflow.com/questions/1098159/vim-stop-existing-swap-file-warnings
" ಠ_ಠ
set shortmess+=A

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
set undodir=~/.vim/.undo//
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

" from http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" Change tab amount by filetype
autocmd FileType js setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 ts=2 sts=2 sw=2

" from @pda - https://github.com/pda/dotvim/blob/master/vimrc
" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" status bar configuration
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Map ctrl-z to undo
map <C-z> u

" plugins

" ctrl:p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
nnoremap <leader>o :CtrlP<CR>
set wildignore+=**_site/**
set wildignore+=**tmp/**
" http://superuser.com/questions/649714/can-i-get-the-vim-ctrlp-plugin-to-ignore-a-specific-folder-in-one-project
" let g:ctrlp_user_command = {
"             \ 'types': {
"             \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
"             \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"             \ },
"             \ 'fallback': 'find %s -type f'
"             \ }

" Switch CtrlP to use Ag (silver surfer) over grep (for speed)
" as per https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in place of ack
    let g:ackprg = 'ag --nogroup --nocolor --column'

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0
endif

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" let g:airline_section_b = '%{fugitive#statusline()}'

" vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" YouCompleteMe
set completeopt-=preview " Make sure vim preview window never shows up as per https://github.com/Valloric/YouCompleteMe#i-get-a-weird-window-at-the-top-of-my-file-when-i-use-the-semantic-engine

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']

" Lint JavaScript with ESLint
let g:syntastic_javascript_checkers = ['eslint']

" PHP Standard
let g:syntastic_php_checkers = ['php', 'phpcs']

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip
nmap ga <Plug>(EasyAlign)

" Enable system mouse scrolling
" as per http://superuser.com/questions/238362/enable-mouse-for-scrolling-only-in-vim-in-iterm-macosx
:set mouse=nicr

" Swap commands for "move cursor to start of non-whitespace" and "move cursor
" to start of line". I use the former much more regularly, and 0 is easier to
" type than ^
:nnoremap ^ 0
:nnoremap 0 ^

" Allow copying to system clipboard from Vim
" as per https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed

" Slack-specific commands
source $HOME/.slackvimrc
