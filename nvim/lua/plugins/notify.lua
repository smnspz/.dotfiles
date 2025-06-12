return {
	"rcarriga/nvim-notify",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.notify = require("notify")
		vim.cmd([[
            hi NotifyWARNBorder34 guibg=none ctermbg=none
            hi NotifyWARNBorder33 guibg=none ctermbg=none
            hi NotifyINFOborder27 guibg=none ctermbg=none
            hi NotifyTRACEBorder guibg=none ctermbg=none
            hi NotifyERRORBorder guibg=none ctermbg=none
            hi NotifyDEBUGBorder guibg=none ctermbg=none
            hi NotifyWARNBorder guibg=none ctermbg=none
            hi NotifyINFOBorder guibg=none ctermbg=none
            hi NotifyINFOBody guibg=none ctermbg=none
            hi NotifyTRACEBody guibg=none ctermbg=none
            hi NotifyERRORBody guibg=none ctermbg=none
            hi NotifyWARNBody guibg=none ctermbg=none
            hi NotifyDEBUGBody guibg=none ctermbg=none
        ]])
	end,
}
