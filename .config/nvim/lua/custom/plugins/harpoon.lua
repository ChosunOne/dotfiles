return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Harpoon setup
      ---@type Harpoon
      local harpoon = require 'harpoon'
      harpoon:setup {}

      vim.keymap.set('n', '<leader>h', function()
        harpoon:list():append()
      end, { desc = 'Harpoon file' })

      vim.keymap.set('n', '<leader>H', function()
        harpoon:list():remove()
      end, { desc = 'Unharpoon file' })

      vim.keymap.set('n', '<leader>C', function()
        harpoon:list():clear()
      end, { desc = 'Clear harpoon list' })

      -- Harpoon telescope setup
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },
}
