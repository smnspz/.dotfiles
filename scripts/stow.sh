#!/usr/bin/env sh
# stow.sh <link|relink|unlink|adopt> [pkg ...] — apply a Stow action to each
# package, mapping package -> target (and bootstrapping ~/.zshenv for zsh).
set -u

REPO="${REPO:-$(cd "$(dirname "$0")/.." && pwd)}"
# shellcheck source=scripts/lib.sh
. "$REPO/scripts/lib.sh"

ACTION="${1:-}"
[ -n "$ACTION" ] && shift
PKGS="${*:-$(default_packages)}"

case "$ACTION" in
    link|relink|unlink|adopt) ;;
    *) echo "usage: stow.sh <link|relink|unlink|adopt> [pkg ...]" >&2; exit 2 ;;
esac

for p in $PKGS; do
    t=$(stow_target "$p")
    case "$ACTION" in
        link)   mkdir -p "$t"; stow -d "$REPO" --target "$t" "$p" ;;
        relink) stow -R -d "$REPO" --target "$t" "$p" ;;
        unlink) stow -D -d "$REPO" --target "$t" "$p" ;;
        adopt)  mkdir -p "$t"; stow --adopt -d "$REPO" --target "$t" "$p" ;;
    esac
done

# zsh needs ~/.zshenv so it can set ZDOTDIR before reading $ZDOTDIR/.zshrc.
if [ "$ACTION" = link ]; then
    case " $PKGS " in
        *" .zsh "*)
            if [ ! -e "$HOME/.zshenv" ] && [ ! -L "$HOME/.zshenv" ]; then
                ln -s "$HOME/.zsh/.zshenv" "$HOME/.zshenv"
                echo "linked: ~/.zshenv -> ~/.zsh/.zshenv"
            fi
            ;;
    esac
fi
