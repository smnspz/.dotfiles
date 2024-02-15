if [ -x "/opt/homebrew/bin/asdf" ]; then 
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
else
	brew install asdf
fi
