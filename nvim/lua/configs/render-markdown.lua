local M = {}

M.opts = {
  heading = {
    -- only highlight the heading text width, not the full line
    width = "block",
    -- remove sign column indicators
    sign = false,
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
}

function M.config(_, opts)
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
end

return M
