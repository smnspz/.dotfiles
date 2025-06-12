return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		animate = {
			duration = { step = 15, total = 250 },
			easing = "linear",
		},
		animate_repeat = {
			delay = 100, -- delay in ms before using the repeat animation
			duration = { step = 5, total = 50 },
			easing = "linear",
		},
		dashboard = {
			preset = {
				pick = nil,
				keys = {
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						--						action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })",
						action = ":Explore " .. vim.fn.stdpath("config") .. "/lua/plugins",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			enabled = true,
			row = nil,
			col = nil,
			sections = {
				{
					section = "terminal",
					cmd = "$XDG_CONFIG_HOME/nvim/ansi/relaxdog",
					height = 30,
					indent = 6,
				},
				{
					pane = 2,
					{
						section = "keys",
						gap = 1,
						padding = 1,
					},
					{
						title = "Recent Files",
						section = "recent_files",
						padding = 5,
					},
				},
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.scroll.enable()
			end,
		})
	end,
}
