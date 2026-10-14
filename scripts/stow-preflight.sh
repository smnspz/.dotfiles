#!/usr/bin/env sh
# stow-preflight.sh — find (and optionally clear) paths that block `stow`.
#
#   sh scripts/stow-preflight.sh report   # dry run, list conflicts (default)
#   sh scripts/stow-preflight.sh apply    # back up real files / re-link orphans
#
# Environment:
#   PACKAGES  space-separated package list (default: ghostty nvim tmux git)
#   REPO      dotfiles root (default: parent of this script's dir)
#   CONFIG    target root   (default: $XDG_CONFIG_HOME or ~/.config)

set -u

REPO="${REPO:-$(cd "$(dirname "$0")/.." && pwd)}"
CONFIG="${CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}}"
PACKAGES="${PACKAGES:-ghostty nvim tmux git}"
MODE="${1:-report}"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

found=0
for pkg in $PACKAGES; do
    [ -d "$REPO/$pkg" ] || continue

    # Let stow itself report which target paths are in the way.
    conflicts=$(stow -n -v -d "$REPO" --target "$CONFIG/$pkg" "$pkg" 2>&1 |
        sed -n -e 's/.*existing target is not owned by stow: //p' \
               -e 's/.*existing target is neither a link nor a directory: //p')

    for name in $conflicts; do
        dest="$CONFIG/$pkg/$name"
        found=$((found + 1))

        if [ -L "$dest" ] && [ "$dest" -ef "$REPO/$pkg/$name" ]; then
            # Points at the repo already — just not in a form stow recognises.
            echo "re-link (orphan symlink): $dest"
            [ "$MODE" = apply ] && rm -f "$dest"
        else
            # A real file (or foreign symlink) occupies the path — preserve it.
            echo "conflict:   $dest"
            if [ "$MODE" = apply ]; then
                mkdir -p "$BACKUP/$pkg/$(dirname "$name")"
                mv "$dest" "$BACKUP/$pkg/$name"
                echo "            backed up -> $BACKUP/$pkg/$name"
            fi
        fi
    done
done

[ "$found" -eq 0 ] && echo "no conflicts — safe to link"
exit 0
