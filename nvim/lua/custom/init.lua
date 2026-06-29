-- Disable wrap
vim.opt.wrap = false

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

