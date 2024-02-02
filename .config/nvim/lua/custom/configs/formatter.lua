local M = {}

M.filetype = {
  ["*"] = {
    require("formatter.filetypes.any").remove_trailing_whitespace
  }
}

M.filetype.javascript = {
  require("formatter.filetypes.javascript").prettier
}

M.filetype.typescript = {
  require("formatter.filetypes.typescript").prettier
}

M.filetype.yaml = {
  require("formatter.filetypes.yaml").yamlfmt
}

M.filetype.python = {
  require("formatter.filetypes.python").autoflake
}

M.filetype.markdown = {
  require("formatter.filetypes.markdown").mdformat
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
