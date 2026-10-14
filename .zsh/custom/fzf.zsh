[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! "$PATH" == */opt/zerobrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/zerobrew/opt/fzf/bin"
fi

source "/opt/zerobrew/opt/fzf/shell/completion.zsh"
source "/opt/zerobrew/opt/fzf/shell/key-bindings.zsh"
