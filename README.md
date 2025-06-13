# Dotfiles

Personal configuration files for development environment setup and customization.

## Overview

This repository contains my personal dotfiles and configuration settings for various tools and applications. The setup uses GNU Stow for symlink management, making it easy to deploy and maintain configurations across different systems.

## Prerequisites

- GNU Stow
- Git

Install GNU Stow on your system:

```bash
# macOS
brew install stow

# Ubuntu/Debian
sudo apt install stow

# Arch Linux
sudo pacman -S stow

# CentOS/RHEL/Fedora
sudo yum install stow  # or dnf install stow
```

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/smnspz/.dotfiles ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Clean existing configurations** (if they exist)

   Remove any existing configuration directories you want to replace:

   ```bash
   rm -rf ~/.zsh
   # Add other directories as needed, e.g.:
   # rm -rf ~/.vim
   # rm -rf ~/.config/nvim
   ```

3. **Create and stow configurations**

   For each configuration package, create the directory and stow it:

   ```bash
   # Example with .zsh configuration
   mkdir ~/.zsh
   stow --target ~/.zsh .zsh

   # For other configurations, adjust paths accordingly:
   # stow --target ~/.vim .vim
   # stow --target ~/.config/nvim nvim
   ```

4. **Set up environment variables**

   Copy the example environment file and add your sensitive variables:

   ```bash
   cp .env.example .env
   ```

   Edit `.env` and add your personal environment variables:

   ```bash
   # Example variables (customize as needed)
   export GITHUB_TOKEN="your_token_here"
   export API_KEY="your_api_key_here"
   # Add other sensitive variables...
   ```

## Usage

### Adding New Configurations

1. Create a new directory for your configuration
2. Add your config files to the directory
3. Use stow to create symlinks:
   ```bash
   stow --target /path/to/destination new-config-directory
   ```

### Updating Configurations

Simply edit the files in your dotfiles repository. Changes will be reflected immediately since stow creates symlinks.

### Removing Configurations

To unstow (remove symlinks) for a configuration:

```bash
stow --delete --target /path/to/destination config-directory
```

## Structure

```
.dotfiles/
├── .zsh/                 # Zsh configuration
│   ├── .zshrc
│   └── ...
├── .vim/                 # Vim configuration
│   ├── .vimrc
│   └── ...
├── .env.example          # Example environment variables
├── .gitignore           # Ignore sensitive files
└── README.md            # This file
```

## Important Notes

- **Environment Variables**: The `.env` file is ignored by git to prevent committing sensitive information. Always use `.env.example` as a template.
- **Backup**: Consider backing up your existing configurations before installation.
- **Customization**: These are personal configurations - review and modify them to suit your preferences before use.

## Troubleshooting

### Stow Conflicts

If stow reports conflicts, you may have existing files that need to be moved or removed:

```bash
# Move existing files to backup
mv ~/.zshrc ~/.zshrc.backup

# Then retry stowing
stow --target ~/.zsh .zsh
```

### Permission Issues

Ensure you have write permissions to the target directories:

```bash
# Check permissions
ls -la ~/

# Fix if needed
chmod 755 ~/
```

## Contributing

This is a personal dotfiles repository, but feel free to fork it and adapt it for your own use. If you find bugs or have suggestions for improvements, please open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
