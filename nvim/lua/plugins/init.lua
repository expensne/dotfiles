return {
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     integrations = {
  --       gitsigns = true,
  --       nvimtree = false,
  --       treesitter = false,
  --     },
  --   }
  -- },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },
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
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = require "configs.tree",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    config = true, -- uses default setup()
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
    url = "https://codeberg.org/andyg/leap.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.leap"
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
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
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { focus = true },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = require "configs.neoscroll",
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
