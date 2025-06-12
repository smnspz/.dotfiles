return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = true } },
			signature = { enabled = true },
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},
		},
	},
	{
		"saghen/blink.pairs",
		version = "*",

		dependencies = "saghen/blink.download",

		opts = {
			mappings = {
				enabled = true,
				pairs = {},
			},
			highlights = {
				enabled = true,
				groups = {
					"BlinkPairsOrange",
					"BlinkPairsPurple",
					"BlinkPairsBlue",
				},
				matchparen = {
					enabled = true,
					group = "MatchParen",
				},
			},
			debug = false,
		},
	},
}
