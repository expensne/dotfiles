return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
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
      local leap = require("leap")

      -- Clear any existing mappings set by leap or others if needed
      -- vim.keymap.del({ "n", "x", "o" }, "gs")

      -- Manual mappings: only s / S, no gs
      vim.keymap.set({ "n", "x", "o" }, "s", function()
        leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
      end, { desc = "Leap forward" })

      vim.keymap.set({ "n", "x", "o" }, "S", function()
        leap.leap { target_windows = { vim.api.nvim_get_current_win() }, backward = true }
      end, { desc = "Leap backward" })
    end,
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- optional tweaks
      vim.g.copilot_no_tab_map = true    -- don't use <Tab>
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_node_command = "node" -- make sure node is used
    end,
  },
}
