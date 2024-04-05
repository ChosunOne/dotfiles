return {
  {
    'L3MON4D3/LuaSnip',
    build = (function()
      -- Build Step is needed for regex support in snippets.
      -- This step is not supported in many windows environments.
      -- Remove the below condition to re-enable on windows.
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      -- `friendly-snippets` contains a variety of premade snippets.
      --    See the README about individual language/framework/plugin snippets:
      --    https://github.com/rafamadriz/friendly-snippets
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
    config = function()
      -- See `:help luasnip-config-options`
      local luasnip = require 'luasnip'
      luasnip.config.setup {
        keep_roots = true,
        link_roots = true,
        link_children = true,
        update_events = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
        -- See https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#ext_opts for how to use this section
        ext_opts = {
          active = {
            virt_text = { { '<-', 'Error' } },
          },
        },
      }

      -- Set luasnip expansion keymap
      -- I like to think of j as moving "down" the options
      vim.keymap.set({ 'i', 's' }, '<C-j>', function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })

      -- and k as moving "up" the options
      vim.keymap.set({ 'i', 's' }, '<C-k>', function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })

      -- s is for showing a list of options when choices are possible
      vim.keymap.set('i', '<C-s>', function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end)

      -- reload snippets
      vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/custom/plugins/luasnip.lua<CR>')
    end,
  },
}
