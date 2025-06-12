export ZDOTDIR=$HOME/.zsh
export XDG_CONFIG_HOME=$HOME/.config
export BAT_THEME="Monokai Extended"
export VISUAL=nvim
export EDITOR="$VISUAL"
export LESSHISTFILE=-
export GOOGLE_APPLICATION_CREDENTIALS=/Users/rosani/Dev/work/service-account.json
export ***REMOVED***
export ANDROID_SDK=/Users/rosani/Library/Android/sdk
export ANDROID_HOME=/Users/rosani/Library/Android/sdk
export PATH="$PATH":"$HOME/.pub-cache/bin"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rosani/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rosani/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rosani/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rosani/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
