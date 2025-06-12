-- Left column and similar settings
vim.opt.number = true         -- display line numbers
vim.opt.relativenumber = true -- display relative line numbers
vim.opt.numberwidth = 2       -- set width of line number column
vim.opt.signcolumn = "yes"    -- always show sign column
vim.opt.wrap = false          -- display lines as single line
vim.opt.scrolloff = 10        -- number of lines to keep above/below cursor
vim.opt.sidescrolloff = 8     -- number of columns to keep to the left/right of cursor

-- Tab spacing/behavior
vim.opt.expandtab = true   -- convert tab to spaces
vim.opt.shiftwidth = 4     -- number of spaces inserted for each indentation level
vim.opt.tabstop = 4
vim.opt.softtabstop = 4    -- number of spaces inserted for <Tab> key
vim.opt.smartindent = true -- enable smart indentation

-- General Behaviors
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false            -- disable swap files
vim.opt.clipboard = "unnamedplus" -- enalbe system clipboard access
vim.opt.conceallevel = 0          -- show concealed  characters in markdown files
vim.opt.fileencoding = "utf-8"    -- set file encoding
vim.opt.mouse = "a"               -- enable mouse support
vim.opt.showmode = false          -- hide mode display
vim.opt.splitbelow = true
vim.opt.termguicolors = true
-- vim.opt.timeoutlen = 100 -- set timeout for mapped sequences
vim.opt.undofile = true     -- enable persistent undo
vim.opt.updatetime = 100    -- set faster completion
vim.opt.writebackup = false -- prevent editing of files being edited elsewhere
vim.opt.cursorline = true

-- Searching Behavior
vim.opt.hlsearch = true   -- highlight all matches in search
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true

-- Diagnostics
vim.diagnostic.config({ virtual_text = true })
