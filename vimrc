set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set tabstop=4 shiftwidth=4
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

" status bar configuration
set guifont=Monaco\ for\ Powerline:h13
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
