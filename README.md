# Dotfiles

Personal configuration managed with [GNU Stow](https://www.gnu.org/software/stow/)
plus a small `Makefile` wrapper.

Each top-level directory is a **Stow package** whose contents map, file for file,
into `~/.config/<package>/`:

| Package   | Target              | Contents                                |
|-----------|---------------------|-----------------------------------------|
| `ghostty` | `~/.config/ghostty` | Ghostty terminal config                 |
| `nvim`    | `~/.config/nvim`    | Neovim (kickstart-based, `vim.pack`)    |
| `tmux`    | `~/.config/tmux`    | tmux config (+ vendored plugins)        |
| `git`     | `~/.config/git`     | Git config and per-host variants        |

## Prerequisites

- GNU Stow — `brew install stow`, `apt install stow`, `pacman -S stow`
- Git and `make` (macOS: `xcode-select --install`)
- A font for the Ghostty config: **Iosevka Term**, available at
  [typeof.net/Iosevka](https://typeof.net/Iosevka/)

Each package requires a minimum tool version, checked by `make doctor` (and
automatically as the first step of `make link`):

| Package   | Minimum | Required for                              |
|-----------|---------|-------------------------------------------|
| `nvim`    | 0.12.0  | `vim.pack`, incremental selection         |
| `tmux`    | 3.2     | `extended-keys` option; catppuccin        |
| `git`     | 2.37    | `push.autoSetupRemote`                    |
| `ghostty` | 1.0.0   | config keys used                          |

## Install

```bash
git clone git@github.com:smnspz/.dotfiles.git ~/dev/repos/.dotfiles
cd ~/dev/repos/.dotfiles
make link
```

`make link` is idempotent. It first runs a **preflight** that backs up any real
file sitting where a package wants to place one (and re-points orphaned
symlinks), so it never clobbers your data. Use `make check` to preview only.

Then:

```bash
make tmux-plugins   # clone TPM; afterwards press prefix + I inside tmux
```

## Targets

`make` or `make help`:

| Target                        | What it does                                     |
|-------------------------------|--------------------------------------------------|
| `doctor`                      | Check installed tool versions vs. minimums        |
| `check`                       | Dry run — list paths that would block Stow       |
| `link`                        | Verify versions + preflight, then stow all       |
| `relink`                      | Re-stow all (pick up added/removed files)        |
| `unlink`                      | Remove all Stow-managed symlinks                 |
| `adopt`                       | Pull existing real files into the repo + diff    |
| `link-<pkg>` / `unlink-<pkg>` | Act on a single package (e.g. `link-nvim`)       |
| `tmux-plugins`                | Bootstrap TPM into `tmux/plugins`                |

## How Stow works here

- **Stow** creates a symlink at each target path pointing back into the repo.
  Nothing is copied — editing either side edits the same file.
- **Unstow** (`make unlink`) removes those symlinks; the repo is untouched.
- Stow links **individual files**, so after adding or deleting a file inside a
  package run `make relink` — otherwise the change won't appear in the target.
- If a target path already exists and isn't a symlink Stow owns, Stow aborts.
  `make check` lists these; `make link` backs them up automatically under
  `~/.dotfiles-backup/<timestamp>/`.

## Environment variables

Secrets live in `~/.env`, which is **not** part of this repo. `.env.example`
shows the expected shape.

## Structure

```
.dotfiles/
├── Makefile
├── scripts/
│   └── stow-preflight.sh    # conflict detection / backup
├── ghostty/
│   └── config
├── nvim/
│   ├── init.lua
│   ├── lua/                 # kickstart + custom plugins
│   ├── doc/
│   └── nvim-pack-lock.json
├── tmux/
│   ├── tmux.conf
│   └── plugins/             # gitignored; managed by TPM
├── git/
│   └── config
├── .env.example
└── README.md
```

## Troubleshooting

**A package won't link / reports conflicts** — run `make check` to see the
offending paths, then `make link` to back them up and retry.

**A file doesn't show up in the target** — Stow links individual files; run
`make relink`.

**"existing target is not owned by stow" for a link that clearly points at the
repo** — the symlink was created outside Stow (e.g. an old absolute path with
different casing). `make check`/`make link` detect these and re-point them.

## License

MIT.
