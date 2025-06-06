
# 履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=30001
SAVEHIST=30001
setopt append_history
setopt hist_ignore_dups
setopt share_history

# Zsh オプション
setopt autocd
setopt correct
setopt interactivecomments
setopt IGNOREEOF
setopt no_flow_control

export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export TERM=xterm-256color