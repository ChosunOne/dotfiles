return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          async = true,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      -- NOTE: see :help conform-formatters for adding options here
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'autopep8', 'isort', 'autoflake', 'black', 'ruff_format' },
        go = { 'gofmt' },
        rust = { 'rustfmt' },
        markdown = { 'mdformat' },
        yaml = { 'yamlfmt' },
        javascript = { 'prettierd' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { 'prettierd', 'prettier' } },
      },
    },
  },
}
