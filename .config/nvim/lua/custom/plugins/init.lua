return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = nil,
      zindex = 20,
      on_attach = nil,
    },
  },
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
  },
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup {}
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'folke/twilight.nvim',
    opts = {
      dimming = {
        alpha = 0.25,
        color = { 'Normal', '#ffffff' },
        term_bg = '#000000',
        inactive = false,
      },
      context = 10,
      treesitter = true,
      expand = {
        'function',
        'method',
        'table',
        'if_statement',
      },
      exclude = {},
    },
  },
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
