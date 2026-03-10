return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lsp"
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "folke/which-key.nvim" },
    ft = "java",
  },
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.leap"
    end,
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_node_command = "node"
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    lazy = false, -- load at startup
    version = "v17.33.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = require "configs.codecompanion",
  },
}
