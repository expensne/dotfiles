require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n", "Y", "y$")
map("n", "<leader>d", "_d", { desc = "Delete without yank" })
map("v", "<leader>d", "_d", { desc = "Delete without yank" })
map("n", "<leader>D", "_D", { desc = "Delete to end of line without yank" })
map("v", "<leader>D", "_D", { desc = "Delete to end of line without yank" })
-- map("v", "<leader>p", "_dP", { desc = "Paste without yank" })
map("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Go back/forward
map("n", "gb", "<C-o>", { desc = "Go back" })
map("n", "gf", "<C-i>", { desc = "Go forward" })

-- Splitting
map({ "n", "v" }, "<leader>v", "<C-w>v", { desc = "Split Vertically" })
map({ "n", "v" }, "<leader>h", "<C-w>s", { desc = "Split Horizontally" })
map({ "n", "v" }, "<leader>q", "<C-w>c", { desc = "Close Current Split" })

-- Terminal
map("n", "<leader>H", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>V", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- Copilot
map({ "n", "i" }, "<C-m>", function()
  local status = vim.fn["copilot#Enabled"]()
  if status == 1 then
    vim.cmd "Copilot disable"
  else
    vim.cmd "Copilot setup"
    vim.cmd "Copilot enable"
  end
end, { desc = "Toggle Copilot" })

-- Suggestions
-- map("i", "<C-l>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
map("i", "<leader><Tab>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

map("i", "<C-]>", "copilot#Next()", { expr = true, silent = true, desc = "Copilot Next" })
map("i", "<C-[>", "copilot#Previous()", { expr = true, silent = true, desc = "Copilot Prev" })

-- Make it more like IntelliJ
map({ "n", "t" }, "<C-p>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
