require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n", "Y", "y$")
map("n", "<leader>d", "_d", { desc = "Delete without yank" })
map("v", "<leader>d", "_d", { desc = "Delete without yank" })
map("n", "<leader>D", "_D", { desc = "Delete to end of line without yank" })
map("v", "<leader>D", "_D", { desc = "Delete to end of line without yank" })
map("v", "<leader>p", "_dP", { desc = "Paste without yank" })

-- Format code on <leader>=
map("n", "<leader>=", function()
  vim.lsp.buf.format()
end, { desc = "Format Code" })

-- Copilot
map("i", "<C-l>", function()
  return vim.fn["copilot#Accept"]("")
end, { expr = true, silent = true, desc = "Copilot Accept" })

-- Next / previous suggestion (optional)
map("i", "<C-]>", 'copilot#Next()', { expr = true, silent = true, desc = "Copilot Next" })
map("i", "<C-[>", 'copilot#Previous()', { expr = true, silent = true, desc = "Copilot Prev" })

-- Make it more like IntelliJ
map({ "n", "t" }, "<C-p>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })


