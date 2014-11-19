p() { cd ~/Projects/rowanoulton/$1; }
_p() { _files -W ~/Projects/rowanoulton -/; }
compdef _p p

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# autocorrect is more annoying than helpful
unsetopt correct_all

# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"
