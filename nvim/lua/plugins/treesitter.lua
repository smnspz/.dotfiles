return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts_config = require("nvim-treesitter.configs")
		ts_config.setup({
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"java",
				"javascript",
				"typescript",
				"html",
				"json",
				"tsx",
				"markdown",
				"markdown_inline",
				"gitignore",
			},
			-- make sure highlighting is enabled
			highlight = { enable = true },
		})
	end,
}
