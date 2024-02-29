local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
})

local on_attach_ruff = function(client, bufnr)
  if client.name == "ruff_lsp" then
    client.server_capabilities.hoverProvider = false
  end
end

lspconfig.ruff_lsp.setup({
  on_attach = on_attach_ruff,
  capabilities = capabilities,
  filetypes = {"python"}
})

lspconfig.clangd.setup({
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml"}
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"dockerfile"}
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml.docker-compose"}
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"}
})

lspconfig.terraformls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"terraform, terraform-vars"}
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"go", "gomod", "gowork", "gotmpl"}
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"sh"}
})

lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"vim"}
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html"}
})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"markdown", "markdown.mdx"}
})

lspconfig.helm_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"helm"}
})

lspconfig.leanls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"lean"}
})
