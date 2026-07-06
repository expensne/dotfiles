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
    "meanderingprogrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      heading = {
        -- only highlight the heading text width, not the full line
        width = "block",
        -- remove sign column indicators
        sign = false,
        -- solid (non-transparent) heading backgrounds; adjust hex to taste
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },
      -- tone down code block background
      code = {
        sign = false,
        width = "block",
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      -- Fix translucent/washed-out headings with solid, muted backgrounds.
      -- These override whatever the colorscheme sets.
      local hl = vim.api.nvim_set_hl
      hl(0, "RenderMarkdownH1Bg", { bg = "#3b2a2a", bold = true })
      hl(0, "RenderMarkdownH2Bg", { bg = "#2a3b2a", bold = true })
      hl(0, "RenderMarkdownH3Bg", { bg = "#2a2a3b", bold = true })
      hl(0, "RenderMarkdownH4Bg", { bg = "#3b3b2a" })
      hl(0, "RenderMarkdownH5Bg", { bg = "#2a3b3b" })
      hl(0, "RenderMarkdownH6Bg", { bg = "#3b2a3b" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
  },
  {
    "kevalin/mermaid.nvim",
    ft = { "mermaid" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require "configs.mermaid",
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
