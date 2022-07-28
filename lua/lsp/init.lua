local status, lspconfig = pcall(require, 'lspconfig')
if not status then return end

require('lsp.lsp-installer')
local handlers = require('lsp.handlers')
handlers.setup()

lspconfig.gdscript.setup {
    capabilities = handlers.capabilities,
}
