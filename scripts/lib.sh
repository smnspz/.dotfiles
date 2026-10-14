# shellcheck shell=sh
# Shared helpers for the Stow wrapper scripts.

# Packages managed by this repo, in a stable order.
default_packages() {
    printf '%s\n' ghostty nvim tmux git .zsh
}

# Map a package name to the directory its contents are stowed into.
stow_target() {
    case "$1" in
        .zsh) printf '%s\n' "$HOME/.zsh" ;;
        *)    printf '%s\n' "${XDG_CONFIG_HOME:-$HOME/.config}/$1" ;;
    esac
}
