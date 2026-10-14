vim.pack.add { 'linux-cultist/venv-selector.nvim' }

require('venv-selector').setup {
  settings = {
    options = {
      notify_user_on_venv_activation = true,
    },
  },
}

vim.keymap.set('n', '<leader>cv', '<cmd>VenvSelect<cr>', { desc = '[C]hange Python [V]env' })
