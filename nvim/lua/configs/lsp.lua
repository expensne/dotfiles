require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "jsonls",
  -- Python
  "pyright",
  "ruff",
  "mypy",
  -- Java / Spring
  "jdtls",
}

vim.lsp.enable(servers)
