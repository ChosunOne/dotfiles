return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      require('catppuccin').setup {
        flavor = 'mocha',
        no_italic = true,
        term_colors = true,
        transparent_background = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        color_overrides = {
          mocha = {
            -- basically shift all the neutral tones down three colors
            base = '#11111b',
            mantle = '#11111b',
            crust = '#11111b',
            surface0 = '#181825',
            surface1 = '#1e1e2e',
            surface2 = '#313244',
            overlay0 = '#45475a',
            overlay1 = '#585b70',
            overlay2 = '#6c7086',
            subtext0 = '#7f849c',
            subtext1 = '#9399b2',
            text = '#a6adc8',
          },
        },
        integrations = {
          cmp = true,
          telescope = {
            enabled = true,
          },
          gitsigns = true,
          treesitter = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
