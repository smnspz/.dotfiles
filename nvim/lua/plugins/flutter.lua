return {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
        local flutter_tools = require("flutter-tools")
        flutter_tools.setup({
            decorations = {
                device = true,
                project_config = true,
            },
            --			debugger = {
            --				enabled = true,
            --			},
            widget_guides = {
                enabled = true,
            },
            dev_log = {
                enabled = true,
                notify_erros = true,
                open_cmd = "tabedit",
            },
        })
    end,
}
