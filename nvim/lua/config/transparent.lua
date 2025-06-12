vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd([[
    hi Normal guibg=none ctermbg=none
    hi NormalNC guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
    hi SpecialKey guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi SignColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
    "Transparent neotree background
    hi NeoTreeNormal guibg=none ctermbg=none
    hi NeoTreeNormalNC guibg=none ctermbg=none
    "Transparent Telescope background
    hi TelescopeNormal guibg=none ctermbg=none
    hi TelescopeMatching guibg=none ctermbg=none
    hi TelescopeSelection guibg=none ctermbg=none
    "Transparent Mason background
    hi MasonNormal guibg=none ctermbg=none
    "Transparent Lazy background
    hi LazyNormal guibg=none ctermbg=none
   ]])
	end,
})
