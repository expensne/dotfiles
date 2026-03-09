require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "jsonls",
  -- Py
  "pyright",
  "ruff",
  "mypy",
}

vim.lsp.enable(servers)
