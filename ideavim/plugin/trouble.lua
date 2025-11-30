local status, trouble = pcall(require, 'trouble')
if not status then return end

trouble.setup({
  use_diagnostic_signs = true,
})

-- Keymaps for Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
