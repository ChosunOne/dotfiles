local M = {}

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      }
    }
  },
  filters = {
    git_ignored = false,
    dotfiles = false
  }
}

M.telescope = {
  extensions_list = { "fzf" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- shell
    "bash",
    "elvish",

    -- build
    "cmake",
    "dockerfile",
    "make",
    "meson",
    "ninja",
    "starlark",

    -- web dev
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "graphql",

    -- backend
    "python",
    "rust",
    "cpp",
    "c_sharp",
    "c",
    "go",
    "haskell",
    "java",
    "solidity",

    -- gpu
    "cuda",
    "glsl",
    "wgsl",

    -- config
    "toml",
    "yaml",
    "terraform",
    "ini",

    -- serialization & network protocols
    "capnp",
    "proto",
    "http",

    -- source control
    "gitignore",
    "gitcommit",
    "gitattributes",
    "diff",
    "git_rebase",
    "git_config",

    -- documentation
    "latex",
    "markdown",
    "comment",

    -- tools
    "gpg",
    "regex",

    -- data
    "csv",
  }
}

return M
