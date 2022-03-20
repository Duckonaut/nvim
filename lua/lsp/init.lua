local status, _ = pcall(require, 'lspconfig')
if not status then return end

require('lsp.lsp-installer')
require('lsp.handlers').setup()

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "rust_analyzer" then
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
        -- Only if standalone support is needed
        require("rust-tools").start_standalone_if_required()
    else
        server:setup(opts)
    end
end)
