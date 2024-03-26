return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        -- shells
        'bash',
        'elvish',
        'fish',
        -- build systems
        'cmake',
        'dockerfile',
        'make',
        'meson',
        -- programming languages
        'c',
        'cpp',
        'python',
        'rust',
        'lua',
        'cuda',
        'gleam',
        'go',
        'java',
        'solidity',
        'zig',
        -- markup languages
        'html',
        'markdown',
        'css',
        'ini',
        -- vim
        'vim',
        'vimdoc',
        -- config
        'toml',
        -- other
        'capnp',
        'csv',
        'tsv',
        'git_config',
        'git_rebase',
        'gitignore',
        'http',
        'jq',
        'json',
        'latex',
        'luadoc',
        'regex',
        'sql',
        'ssh_config',
        'tmux',
        'wgsl',
        'xml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      -- Textobjects settings
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'Select around a function' },
            ['if'] = { query = '@function.inner', desc = 'Select inside a function' },
            ['ac'] = { query = '@class.outer', desc = 'Select around a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inside a class' },
            ['ab'] = { query = '@block.outer', desc = 'Select around a block' },
            ['ib'] = { query = '@block.inner', desc = 'Select inside a block' },
            ['a='] = { query = '@assignment.outer', desc = 'Select around an assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inside an assignment' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select around a parameter' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inside a parameter' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['gj'] = { query = '@function.outer', desc = 'Go to next function start' },
            [']m'] = { query = '@function.outer', desc = 'Next method start' },
            [']]'] = { query = '@class.outer', desc = 'Next class start' },
            [']b'] = { query = '@block.outer', desc = 'Next block start' },
            [']a'] = { query = '@parameter.inner', desc = 'Next parameter' },
          },
          goto_next_end = {
            ['gJ'] = { query = '@function.outer', desc = 'Go to next function end' },
            [']M'] = { query = '@function.outer', desc = 'Next method end' },
            [']['] = { query = '@class.outer', desc = 'Next class end' },
            [']B'] = { query = '@block.outer', desc = 'Next block end' },
            [']A'] = { query = '@parameter.inner', desc = 'Next parameter' },
          },
          goto_previous_start = {
            ['gk'] = { query = '@function.outer', desc = 'Go to previous function start' },
            ['[m'] = { query = '@function.outer', desc = 'Previous method start' },
            ['[['] = { query = '@class.outer', desc = 'Previous class start' },
            ['[b'] = { query = '@block.outer', desc = 'Previous block start' },
            ['[a'] = { query = '@parameter.inner', desc = 'Previous parameter' },
          },
          goto_previous_end = {
            ['gK'] = { query = '@function.outer', desc = 'Go to previous function end' },
            ['[M'] = { query = '@function.outer', desc = 'Previous method end' },
            ['[]'] = { query = '@class.outer', desc = 'Previous class end' },
            ['[B'] = { query = '@block.outer', desc = 'Previous block end' },
            ['[A'] = { query = '@parameter.inner', desc = 'Previous parameter' },
          },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ['<leader>df'] = { query = '@function.outer', desc = 'Peek function definition' },
            ['<leader>dF'] = { query = '@class.outer', desc = 'Peek class definition' },
          },
        },
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    end,
  },
}
