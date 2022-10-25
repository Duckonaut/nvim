local status_ok, mason, lspconfig, handlers

status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

status_ok, handlers = pcall(require, "lsp.handlers")
if not status_ok then
    return
end

handlers.setup()
mason.setup()

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

lspconfig.gdscript.setup(opts)

local jsonls_opts = require("lsp.settings.jsonls")
opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(jsonls_opts)

local sumneko_lua_opts = require("lsp.settings.sumneko_lua")
opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
lspconfig.sumneko_lua.setup(sumneko_lua_opts)

local pyright_opts = require("lsp.settings.pyright")
opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup(pyright_opts)

local clangd_opts = require("lsp.settings.clangd")
opts = vim.tbl_deep_extend("force", clangd_opts, opts)
lspconfig.clangd.setup(clangd_opts)

local hls_opts = require("lsp.settings.hls")
opts = vim.tbl_deep_extend("force", hls_opts, opts)
lspconfig.hls.setup(hls_opts)

local wgsl_analyzer_opts = require("lsp.settings.wgsl-analyzer")
opts = vim.tbl_deep_extend("force", wgsl_analyzer_opts, opts)
lspconfig.wgsl_analyzer.setup(wgsl_analyzer_opts)

local omnisharp_opts = require("lsp.settings.omnisharp")
opts = vim.tbl_deep_extend("force", omnisharp_opts, opts)
lspconfig.omnisharp.setup(omnisharp_opts)

local rust_analyzer_opts = require("lsp.settings.rust-analyzer")
opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)

--local codelldb = mason.get_package("codelldb")
--print("codelldb", codelldb)
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

require("rust-tools").setup {
    server = rust_analyzer_opts,
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = " ",
            other_hints_prefix = " ",
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
}
