ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates autojump)

export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for powerline-zsh theme
function _update_ps1()
{
  export PROMPT="$(python2 ~/powerline-zsh.py $?)"
}
precmd()
{
  _update_ps1
}

# convenient key bindings
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[begin' beginning-of-line
bindkey '^[end' end-of-line

# golang
export GOPATH=~/Projects/rowanoulton/go
export PATH=$PATH:$GOPATH/bin

# from http://items.sjbach.com/319/configuring-vim-right
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
