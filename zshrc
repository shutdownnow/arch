autoload -U compinit promptinit
compinit
zstyle ':completion:*' menu select
setopt completealiases
setopt HIST_IGNORE_DUPS
promptinit

prompt walters

alias ls='ls --color=tty'
alias ll='ls -l --color=tty'
alias la='ls -A --color=tty'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
