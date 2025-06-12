local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    change_detection = {
        -- don't notify us every time a change is made to the configuration
        notify = false
    },
    checker = {
        enabled = true,
        notify = false
    }
}

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.transparent")
require("lazy").setup("plugins", opts)
