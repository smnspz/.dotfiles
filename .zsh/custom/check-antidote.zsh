antidote_path="$HOME/.zsh/.antidote"

# Check if Antidote is already installed
if [ ! -d "$antidote_path" ]; then
    # Antidote is not installed, so let's clone it
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_path"
fi
