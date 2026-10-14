# Dotfiles management — thin wrapper around GNU Stow.
# Run `make` or `make help` for the target list.

SHELL    := /bin/sh
REPO     := $(CURDIR)
PACKAGES := ghostty nvim tmux git .zsh

.DEFAULT_GOAL := help
.PHONY: help doctor check link relink unlink adopt tmux-plugins

help: ## show this help
	@printf 'Usage: make <target>\n\nTargets:\n'
	@grep -hE '^[a-zA-Z0-9_.-]+:.*## ' $(MAKEFILE_LIST) \
		| awk 'BEGIN{FS=":.*## "}{printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

doctor: ## check installed tool versions against required minimums
	@sh scripts/check-versions.sh $(PACKAGES)

check: ## dry run: list paths that would block stow (changes nothing)
	@REPO="$(REPO)" PACKAGES="$(PACKAGES)" sh scripts/stow-preflight.sh report

link: doctor check ## verify versions + back up/relink conflicts, then stow every package
	@REPO="$(REPO)" sh scripts/stow-preflight.sh apply
	@REPO="$(REPO)" sh scripts/stow.sh link $(PACKAGES)
	@echo "linked: $(PACKAGES)"

relink: ## re-stow all packages (pick up added/removed files)
	@REPO="$(REPO)" sh scripts/stow.sh relink $(PACKAGES)
	@echo "relinked: $(PACKAGES)"

unlink: ## remove all stow-managed symlinks
	@REPO="$(REPO)" sh scripts/stow.sh unlink $(PACKAGES)
	@echo "unlinked: $(PACKAGES)"

adopt: ## pull existing real files INTO the repo (machine wins), then show diff
	@REPO="$(REPO)" sh scripts/stow.sh adopt $(PACKAGES)
	@git -C "$(REPO)" --no-pager diff --stat

link-%: ## stow a single package, e.g. `make link-nvim`
	@sh scripts/check-versions.sh "$*"
	@REPO="$(REPO)" sh scripts/stow.sh link "$*"

unlink-%: ## unstow a single package, e.g. `make unlink-nvim`
	@REPO="$(REPO)" sh scripts/stow.sh unlink "$*"

tmux-plugins: ## bootstrap TPM (tmux plugin manager) into tmux/plugins
	@mkdir -p "$(REPO)/tmux/plugins"
	@[ -d "$(REPO)/tmux/plugins/tpm" ] || \
		git clone --depth=1 https://github.com/tmux-plugins/tpm "$(REPO)/tmux/plugins/tpm"
	@echo "TPM ready — start tmux and press prefix + I to install plugins"
