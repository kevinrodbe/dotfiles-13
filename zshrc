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
  export PROMPT="$(~/Projects/rowanoulton/dotfiles/vendor/powerline-zsh/powerline-zsh.py $?)"
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

# aliases
# @todo: extract these to their own file perhaps
alias jk='jekyll'
