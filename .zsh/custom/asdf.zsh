if [ -x "/opt/zerobrew/bin/asdf" ]; then
	export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
	export PATH="$ASDF_DATA_DIR/shims:$PATH"
	fpath=("/opt/zerobrew/opt/asdf/share/zsh/site-functions" $fpath)
fi
