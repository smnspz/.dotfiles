return {
	"smnspz/springboot-nvim",
	branch = "feature/ktsbuildgradle",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		local springboot_nvim = require("springboot-nvim")
		-- run spring boot project inside a vim terminal
		vim.keymap.set("n", "<leader>Jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })
		-- open the generate class ui to create a new class
		vim.keymap.set("n", "<leader>Jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
		-- open the generate interface ui to create an interface
		vim.keymap.set("n", "<leader>Ji", springboot_nvim.generate_interface, { desc = "[J]ava Create [I]nterface" })
		-- open the generate enum ui to create an enum
		vim.keymap.set("n", "<leader>Je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })

		springboot_nvim.setup({})
	end,
}
