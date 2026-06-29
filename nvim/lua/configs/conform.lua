local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    xml = { "xmlformatter" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    xmlformatter = {
      command = "xmlformat",
      args = { "--indent", "4", "--encoding", "utf-8", "--selfclose", "--blank", "-" },
      stdin = true,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
