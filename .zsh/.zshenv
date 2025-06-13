if [ -f $HOME/.env ]; then
    export $(grep -v '^#' $HOME/.env | xargs) 
fi
export ZDOTDIR=$HOME/.zsh
export XDG_CONFIG_HOME=$HOME/.config
export BAT_THEME="Monokai Extended"
export VISUAL=nvim
export EDITOR="$VISUAL"
export LESSHISTFILE=-
export PATH="$PATH":"$HOME/.pub-cache/bin"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rosani/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rosani/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rosani/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rosani/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
