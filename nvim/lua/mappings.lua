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
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP: Go to implementation" })

-- Splitting
map({ "n", "v" }, "<leader>v", "<C-w>v", { desc = "Split Vertically" })
map({ "n", "v" }, "<leader>s", "<C-w>s", { desc = "Split Horizontally" })
map({ "n", "v" }, "<leader>c", "<C-w>c", { desc = "Close Current Split" })

map("n", "<M-Up>", ":resize +10<CR>", { desc = "Increase height" })
map("n", "<M-Down>", ":resize -10<CR>", { desc = "Decrease height" })
map("n", "<M-Right>", ":vertical resize -10<CR>", { desc = "Decrease width" })
map("n", "<M-Left>", ":vertical resize +10<CR>", { desc = "Increase width" })

-- Terminal
map("n", "<leader>S", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>V", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

map({ "n", "t" }, "<leader>I", function()
  require("nvchad.term").toggle { pos = "float", id = "ftoggleTerm" }
end, { desc = "terminal toggleable floating term" })

-- Git
map("n", "<leader>gl", "<cmd>Gitsigns toggle_linehl<CR>", { desc = "Git: toggle line highlight" })
map("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Git: next hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Git: prev hunk" })

map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: Open" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: File history" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview: Current file history" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Diffview: Close" })

-- Copilot
map({ "n", "i" }, "<C-m>", function()
  local status = vim.fn["copilot#Enabled"]()
  if status == 1 then
    vim.cmd "Copilot disable"
  else
    -- vim.cmd "Copilot setup"
    vim.cmd "Copilot enable"
  end
end, { desc = "Toggle Copilot Completions" })

-- Suggestions
map("i", "<C-l>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
map("i", "<C-]>", "copilot#Next()", { expr = true, silent = true, desc = "Copilot Next" })
map("i", "<C-[>", "copilot#Previous()", { expr = true, silent = true, desc = "Copilot Prev" })

-- Chat (code companion)
map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "Code Companion Chat" })
map({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<CR>", { desc = "Code Companion Actions" })

-- Make it more like IntelliJ
map({ "n", "t" }, "<C-p>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
