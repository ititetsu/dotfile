plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # zoxide
  fzf
)

# 補完
autoload -Uz compinit && compinit -u

# zoxide
eval "$(zoxide init zsh)"

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh
