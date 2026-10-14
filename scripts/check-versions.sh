#!/usr/bin/env sh
# check-versions.sh [pkg ...] — verify installed tool versions meet the
# minimums required by the corresponding dotfiles package.
#
#   sh scripts/check-versions.sh            # check every package
#   sh scripts/check-versions.sh nvim tmux  # check only these
#
# Exits non-zero if any required tool is missing or too old.

set -u

min_of() {
    case "$1" in
        ghostty) echo 1.0.0 ;;   # keys used (background-blur, window-padding-*, …)
        nvim)    echo 0.12.0 ;;  # vim.pack, treesitter incremental selection
        tmux)    echo 3.2 ;;     # extended-keys option; catppuccin
        git)     echo 2.37 ;;    # push.autoSetupRemote
        zsh)     echo 5.0 ;;     # path+=() array append; antidote
    esac
}

version_of() {
    case "$1" in
        ghostty) report="ghostty +version" ;;
        nvim)    report="nvim --version" ;;
        tmux)    report="tmux -V" ;;
        git)     report="git --version" ;;
        zsh)     report="zsh --version" ;;
        *)       return 0 ;;
    esac
    # shellcheck disable=SC2086
    $report 2>/dev/null | head -1 | grep -oE '[0-9]+(\.[0-9]+)+' | head -1
}

version_ge() { # version_ge HAVE NEED
    awk -v a="$1" -v b="$2" 'BEGIN {
        na = split(a, x, "."); nb = split(b, y, ".");
        n = (na > nb ? na : nb);
        for (i = 1; i <= n; i++) {
            ai = x[i] + 0; bi = y[i] + 0;
            if (ai > bi) exit 0;
            if (ai < bi) exit 1;
        }
        exit 0
    }'
}

PKGS="${*:-ghostty nvim tmux git zsh}"
rc=0
for p in $PKGS; do
    [ "$p" = ".zsh" ] && p=zsh   # package name -> tool name
    min=$(min_of "$p")
    [ -n "$min" ] || continue

    if ! command -v "$p" >/dev/null 2>&1; then
        printf 'ERROR  %-8s not installed                    (need >= %s)\n' "$p" "$min"
        rc=1
        continue
    fi

    have=$(version_of "$p")
    if [ -z "$have" ]; then
        printf 'ERROR  %-8s could not detect version         (need >= %s)\n' "$p" "$min"
        rc=1
    elif version_ge "$have" "$min"; then
        printf 'ok     %-8s %-9s                      (need >= %s)\n' "$p" "$have" "$min"
    else
        printf 'ERROR  %-8s %-9s is too old           (need >= %s)\n' "$p" "$have" "$min"
        rc=1
    fi
done

exit $rc
