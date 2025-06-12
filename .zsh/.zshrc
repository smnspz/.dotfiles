source $ZDOTDIR/custom/check-antidote.zsh
source $ZDOTDIR/custom/init-antidote.zsh
source $ZDOTDIR/custom/aliases.zsh
source $ZDOTDIR/custom/nvm.zsh
source $ZDOTDIR/custom/fzf.zsh
source $ZDOTDIR/custom/brew.zsh
source $ZDOTDIR/custom/asdf.zsh
source $ZDOTDIR/custom/android.zsh
source $ZDOTDIR/custom/flutter.zsh

autoload -U promptinit; promptinit
prompt pure

. ~/.asdf/plugins/java/set-java-home.zsh


# pnpm
export PNPM_HOME="/Users/rosani/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/rosani/.bun/_bun" ] && source "/Users/rosani/.bun/_bun"
