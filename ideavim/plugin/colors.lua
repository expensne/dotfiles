local status, tokyonight = pcall(require, 'tokyonight')
if not status then return end

tokyonight.setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

