local opts = {
  view = {
    -- side = "right",
    width = function()
      return math.floor(vim.o.columns * 0.25)
    end,
  },
}

return opts
