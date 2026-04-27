require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "jsonls",
  -- Angular/TS
  "angularls",
  "tsserver",
  -- Python
  "pyright",
  "ruff",
  "mypy",
  -- Java / Spring: jdtls is managed by nvim-jdtls via ftplugin/java.lua
}

vim.lsp.enable(servers)
