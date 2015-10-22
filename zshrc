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

# shortcut to search for file by name in current directory and highlight the results
function findAndHighlightFilename()
{
    find . -iname "*${1}*" | grep ${1}
}

# shortcut to open a compare window between the current branch and the master branch for Sidestage
function openSidestageComparison()
{
    # get the name of the current branch
    currentBranch=$(git symbolic-ref HEAD | cut -d'/' -f3)

    # open a chrome window and direct to a Github comparison of master and the current branch
    open -a "/Applications/Google Chrome.app" "https://github.com/SidestageHQ/sidestage/compare/master...$currentBranch"
}

# shortcut to open a compare window between the current branch and the master branch for Hatch
function openHatchComparison()
{
    # get the name of the current branch
    currentBranch=$(git symbolic-ref HEAD | cut -d'/' -f3)

    # open a chrome window and direct to a Github comparison of master and the current branch
    open -a "/Applications/Google Chrome.app" "https://github.com/SidestageHQ/hatch/compare/master...$currentBranch"
}

# shortcut to open a Github code search in chrome
function searchGithubCode()
{
    open -a "/Applications/Google Chrome.app" "https://github.com/search?type=Code&utf8=✓&q=${1}"
}

# aliases
# @todo: extract these to their own file perhaps
alias jk='jekyll'
alias pingg='prettyping google.de'
alias phone='copyPhoneNumber'
alias spr='openSidestageComparison'
alias pr='openHatchComparison'
alias rack='ack --ruby'
alias f='findAndHighlightFilename'
alias sg='searchGithubCode'
alias mside='mysql -uroot sidestage_development'
alias db='mysql -uroot hatch_development'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Remove limit on zsh history
# as per https://github.com/bamos/zsh-history-analysis
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
