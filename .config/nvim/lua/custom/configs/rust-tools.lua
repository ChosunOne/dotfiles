local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local options = {
  server = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
          extraArgs = {
            "--",
            "-Wclippy::correctness",
            "-Wclippy::perf",
            "-Wclippy::complexity",
            "-Wclippy::style",
            "--cap-lints=warn",
            "-Aclippy::pedantic",
            "-Wclippy::suspicious",
          },
        }
      }
    },
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

return options
