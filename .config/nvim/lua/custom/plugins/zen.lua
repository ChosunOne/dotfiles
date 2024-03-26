return {
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95,
        widht = 120,
        height = 1,
        options = {
          -- signcolumn = "no",       -- disable signcolumn
          -- number = false,          -- disable number column
          -- relativenumber = false,  -- disable relative numbers
          -- cursorline = false,      -- disable cursorline
          -- foldcolumn = "0",        -- disable field column
          -- list = false,            -- disable whitespace characters
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
    },
    config = function()
      local zen = require 'zen-mode'
      vim.keymap.set('n', '<leader>z', function()
        zen.toggle()
      end, { desc = 'Toggle Zen Mode' })
    end,
  },
}
