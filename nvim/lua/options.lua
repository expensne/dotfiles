require "nvchad.options"

local o = vim.o
o.relativenumber = true
o.scrolloff = 6
o.cursorline = true
o.splitright = true
o.splitbelow = true
o.timeoutlen = 280
o.wrap = false
o.undofile = true
o.undodir = vim.fn.stdpath "state" .. "/undo"
