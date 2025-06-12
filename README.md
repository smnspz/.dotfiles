# Dotfiles

## How to install

Remove directory if it exists, example:

```bash
rm -rf .zsh
```

Then create a new empty config directory and stow it

```bash
cd /path/to/.dotfiles
mkdir .zsh
stow --target /path/to/config/.zsh .zsh
```

Remember to stow copy the .env.example file too, and add the sensitive environment variables not committed to VCS
