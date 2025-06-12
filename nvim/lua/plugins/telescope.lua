return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")

			-- setup flutter
			require("telescope").load_extension("flutter")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]inder [R]esume" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind recent files ('.' for repeat)" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]inder existing [B]uffers" })
			vim.keymap.set("n", "<leader>fh", function()
				local opts = require("telescope.themes").get_ivy({})
				return builtin.help_tags(opts)
			end)
			vim.keymap.set("n", "<leader>fc", function()
				return builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next, -- go to the next preview
						["<C-k>"] = actions.move_selection_previous, -- go to the previous preview
					},
				},

				require("telescope").load_extension("ui-select"),
			})
		end,
	},
}
