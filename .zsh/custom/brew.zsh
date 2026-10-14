if [ -x "/opt/homebrew/bin/brew" ]; then # checks if homebrew is installed
	path+=("/opt/homebrew/bin")
else
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
