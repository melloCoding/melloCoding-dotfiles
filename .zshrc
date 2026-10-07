# Add nvim to path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# setup the config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# autostart tmux
ZSH_TMUX_AUTOSTART=true
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

