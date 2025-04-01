return {
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewfile *.lean' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },

    opts = {
      lsp = {},
      mappings = true,
    },
  },
}
