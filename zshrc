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

# shortcut to copy my phonenumber to clipboard
# store phone numbers in files named for their respective countries inside ~/.phone
function copyPhoneNumber()
{
    # take first parameter passed as country code (eg nz) otherwise default to de
    local country=${1:-de}

    # check if file for relevant phone number exists
    if [ ! -f ~/.phone/$country ]; then
        echo "Phone number not found, add it by creating ~/.phone/$country"
        return
    fi

    # copy phone number to clipboard
    cat ~/.phone/$country | pbcopy
}

# shortcut to open a compare window between the current branch and the 2.0 master branch for Sidestage
function openSidestageV2Comparison()
{
    # get the name of the current branch
    currentBranch=$(git symbolic-ref HEAD | cut -d'/' -f3)

    # open a chrome window and direct to a Github comparison of 2.0 and the current branch
    open -a "/Applications/Google Chrome.app" "https://github.com/SidestageHQ/sidestage/compare/2.0...$currentBranch"
}

# aliases
# @todo: extract these to their own file perhaps
alias jk='jekyll'
alias pingg='ping google.de'
alias phone='copyPhoneNumber'
alias spr='openSidestageV2Comparison'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
