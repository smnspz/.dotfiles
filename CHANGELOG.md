# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/smnspz/.dotfiles/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/smnspz/.dotfiles/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smnspz/.dotfiles/releases/tag/v0.1.0
