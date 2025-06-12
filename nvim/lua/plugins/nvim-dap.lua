return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")

		local ui = require("dapui")

		ui.setup()

		-- toggle breakpoint
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		-- close debugging ui
		vim.keymap.set("n", "<leader>dc", dap.close, { desc = "[D]ebug [C]lose" })

		vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debug Step Into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug Step Over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug Step Out" })
		vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debug Step Back" })
		vim.keymap.set("n", "<F12>", dap.restart, { desc = "Debug Restart" })

		-- handle ui open / close automatically
		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
