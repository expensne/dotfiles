local status, telescope = pcall(require, 'telescope')
if not status then return end

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            'node_modules',
            '.env',
            '.venv',
            '__pycache__',
            '.next',
            '.git',
            'dist',
            'build',
            'target',
            'package%-lock%.json',
            '.ruff',
            '.ruff_cache',
            '.idea',
            '.vscode'
        },
    },
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
