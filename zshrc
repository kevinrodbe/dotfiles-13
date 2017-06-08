ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git brew gem rbates autojump zsh-autosuggestions)

# For Homebrew
export PATH="/usr/local/bin:$PATH"

# For node globals
export PATH=~/.npm-global/bin:$PATH

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# for powerline-zsh theme
# powerline-daemon -q
. $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# convenient key bindings
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[begin' beginning-of-line
bindkey '^[end' end-of-line

# shortcut to list N most recently edited files
function listMostRecent()
{
    # take first parameter passed as number of results desired, default is 10
    local max=${1:-10}

    # generate results
    ls -lthGA | head -$max
}

# shortcut to copy my phonenumber to clipboard
# store phone numbers in files named for their respective countries inside ~/.phone
function copyPhoneNumber()
{
    # take first parameter passed as country code (eg nz) otherwise default to de
    local country=${1:-usa}

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

# shortcut to open a Github code search in chrome
function searchGithubCode()
{
    open -a "/Applications/Google Chrome.app" "https://github.com/search?type=Code&utf8=✓&q=${1}"
}

# shortcut for easily compressing PDFs with ghostscript
# from https://github.com/omgmog/omgmog.github.com/blob/master/_posts/2014-03-28-compressing-pdf-from-your-mac-or-linux-terminal-with-ghostscript.md
function compresspdf()
{
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}

# shortcut to rename .JPG extensions to lowercase .jpg (in current directory)
# from http://stackoverflow.com/questions/7450818/rename-all-files-in-directory-from-filename-h-to-filename-half
function fixJpegExtensions()
{
    for file in *.JPG
    do
        mv "${file}" "${file/.JPG/.jpg}"
    done
}

# aliases
# @todo: extract these to their own file perhaps
alias jk='jekyll'
alias pingg='prettyping google.co.nz'
alias phone='copyPhoneNumber'
alias f='findAndHighlightFilename'
alias sg='searchGithubCode'
alias fixjpegs='fixJpegExtensions'
alias lss='listMostRecent'
alias l='ls -lGAh'
alias agt='ag -G \.*txt'
alias agh='ag -G \.*hbs'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Requires the following:
# - brew install youtube-dl
# - brew install ffmpeg
alias mp3='youtube-dl'

# List 10 most recently changed local branches
# Useful if you are swapping a lot and forgot which branch you wanted to return to
alias latest="git branch --sort=committerdate | tail -n 10 -r"

# Remove limit on zsh history
# as per https://github.com/bamos/zsh-history-analysis
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# Opt out of Homebrew analytics (sorry)
# Ref: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Slack-specific config
source ~/.slackrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Deadzone: Things that I don't use at the moment

# ... and Powerline
# export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Node version manager
# - @note: This slows shell startup quite a bit
# export NVM_DIR="/Users/rowanoulton/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# for Homebrew installed rbenv
# - @note: Also slows shell startup quite a bit
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Go
# export GOPATH=~/Projects/go
# export PATH=$PATH:$GOPATH/bin
