local leap = require "leap"

-- Manual mappings: only s / S, no gs
-- Make it feel more like Intellij's AceJump 

vim.keymap.set({ "n", "x", "o" }, "s", function()
  leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
end, { desc = "Leap" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
end, { desc = "Leap" })
