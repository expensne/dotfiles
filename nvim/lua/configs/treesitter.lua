local opts = {
  ensure_installed = {
    -- VIM
    "lua",
    "vim",
    "vimdoc",
    -- General
    "json",
    "markdown",
    "bash",
    "yaml",
    -- Python
    "python",
    "toml",
    -- Java / Spring
    "java",
    "xml",
    "properties",
  },
  highlight = { enable = true },
  indent = { enable = true },
}

return opts
