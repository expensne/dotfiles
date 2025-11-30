local status, mason = pcall(require, 'mason')
if not status then return end

mason.setup()

local mason_lsp = require('mason-lspconfig')
mason_lsp.setup({
    ensure_installed = {
        'pyright',
    	'lemminx',
        'jsonls',
        'lua_ls'
    },
    automatic_installation = true,  -- optional, installiert LSPs auch, wenn du nur lspconfig.setup() aufrufst
    handlers = {
    function(server_name)
        require('lspconfig')[server_name].setup({})
    end,
    },
})
