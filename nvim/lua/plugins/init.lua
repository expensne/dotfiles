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
      local leap = require "leap"

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
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    lazy = false, -- load at startup
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
    opts = {
      strategies = {
        chat = {
          headers = {
            context = "Current file: ${file.name} (${filetype})\n",
          },
          -- roles = {
          --   ---The header name for the LLM's messages
          --   ---@type string|fun(adapter: CodeCompanion.Adapter): string
          --   llm = function(adapter)
          --     return "󰚩  (" .. adapter.formatted_name .. ")"
          --   end,
          --
          --   ---The header name for your messages
          --   ---@type string
          --   user = " ",
          -- },
        },
      },

      display = {
        chat = {
          show_agent_name = true,
          separator = "─",
          show_context = true,
          show_header_separator = false,
          show_settings = false,
          show_token_count = true,
          show_tools_processing = true,
          start_in_insert_mode = false,
          window = {
            width = 0.3,
          },
        },
      },

      edit = {
        diff = {
          enabled = true,
          algorithm = "patience",
        },
      },

      ask = { use_selection = true },

      chat = {
        save_session = true,
        load_session = true,
      },
    },
  },
}
