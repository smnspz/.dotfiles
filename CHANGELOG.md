# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
