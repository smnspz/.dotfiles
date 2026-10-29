# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `nvim`: hardtime.nvim blocks repeated `hjkl`/arrow-key motions and suggests
  a better motion, with `:Hardtime` for the bad-habit report. Defaults apply,
  so the mouse is disabled and prompt-like buffers (Telescope, nvim-tree,
  quickfix) are exempt.
- `make tmux-plugins` now clones every plugin declared in `tmux/tmux.conf`,
  not just TPM, so a fresh machine is fully set up without pressing
  `prefix + I`. The plugin list is parsed from the config, keeping it the
  single source of truth.

### Changed

- `tmux`: one portable config for macOS and Linux, stowed to
  `~/.config/tmux/tmux.conf`. Copying uses OSC 52, so the macOS `pbcopy` and
  X11 `xsel` bindings are gone and no clipboard tool is required.
- `tmux`: panes get `tmux-256color` with true colour (falling back to
  `screen-256color` when the terminfo entry is missing), `focus-events` so
  nvim's autosave-on-blur fires, `extended-keys` for Shift+Enter, a
  50 000-line history, and `M-h`/`M-l` for windows instead of `C-S-h`/`C-S-l`.
- `tmux`: plugins load from `~/.config/tmux/plugins`, so the config no longer
  hardcodes the repo location. `vim-tmux-navigator` is dropped in favour of
  the `C-hjkl` passthrough, which also covers ssh/mosh panes.

### Fixed

- `tmux`: the copy-mode `n` binding was swallowing the `N` binding as its
  arguments; both are now separate lines.
- `tmux`: removed the duplicate `mode-keys` line, the double TPM run, the
  `source_plugins.sh` workaround, and the dead
  `@catppuccin_window_default_text` option.
- `tmux`: the window list no longer has a double indent (`basic` style already
  prepends a space).
- README: correct clone path (`~/dev/.dotfiles`), and tmux plugins are cloned
  by `make tmux-plugins` rather than vendored.

## [0.3.1] - 2026-10-25

### Added

- `nvim`: file type icons in `nvim-tree` come from `mini.icons`, which also
  serves plugins that expect `nvim-web-devicons`, so that plugin is not needed.
- `nvim`: a `rust_analyzer` language server for Rust. Mason's standalone build
  is preferred over the failing `rust-analyzer` shim in `~/.cargo/bin`.

### Changed

- `nvim`: the file explorer is now `nvim-tree` instead of
  `telescope-file-browser`. `<leader>e` toggles the tree on the current file,
  and opening a directory (e.g. `nvim .`) opens the tree.

## [0.3.0] - 2026-10-21

### Added

- `nvim`: modified file buffers are saved automatically on `FocusLost` and
  `BufLeave`, skipping unnamed, special and unmodified buffers.
- `nvim`: `nvim-autopairs` closes brackets and quotes as you type, and blink.cmp
  inserts brackets when a function or method completion is accepted.
- `nvim`: a `neocmake` language server for CMake build scripts, completing
  commands, variables and options and reading `CMakePresets.json`.
- `nvim`: JSON and JSONC buffers are validated against SchemaStore schemas via
  `jsonls`, with a `$schema` key in the document still taking precedence.

### Changed

- `nvim`: netrw is gone, replaced by `telescope-file-browser.nvim`. `<leader>e`
  opens the browser in the current file's directory with that file selected, and
  opening a directory (e.g. `nvim .`) opens the browser instead of a listing.

## [0.2.0] - 2026-10-17

### Added

- `nvim`: `<leader>ch` jumps between a C/C++ source file and its paired header
  through clangd's `textDocument/switchSourceHeader` extension, warning when no
  counterpart exists.

### Changed

- `nvim`: `<leader>h` now opens LSP hover documentation for the symbol under the
  cursor. It no longer prefixes a `Git [H]unk` keymap group.

## [0.1.1] - 2026-10-17

### Added

- `nvim`: treesitter parsers `doxygen` and `comment`, so Doxygen doc comments
  and `TODO`/`FIXME` keywords are highlighted inside comments.

### Changed

- `nvim`: `<leader>sf` lists only git-versioned files (`git_files`) instead of
  every file.
- `nvim`: netrw sorts listings by modification time (newest first), hides
  `.git`, and keeps `./` and `../` pinned to the bottom.

## [0.1.0] - 2026-10-17

### Added

- `VERSION` and this changelog, so the repo has a single version record.
- `nvim`: a `clangd` language server for C and C++. It prefers zerobrew's
  keg-only `llvm` build so the server matches the compiler projects build with,
  and falls back to `clangd` on `PATH` when `llvm` is absent. Configured with
  `--background-index`, `--query-driver` (so system headers resolve through the
  compiler named in `compile_commands.json`), and `-std=c++20` fallback flags.

### Changed

- `.zsh`: load `nvm` and its completion from the zerobrew prefix
  (`/opt/zerobrew/opt/nvm`) instead of Homebrew.

[Unreleased]: https://github.com/smnspz/.dotfiles/compare/v0.3.1...HEAD
[0.3.1]: https://github.com/smnspz/.dotfiles/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/smnspz/.dotfiles/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/smnspz/.dotfiles/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/smnspz/.dotfiles/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smnspz/.dotfiles/releases/tag/v0.1.0
