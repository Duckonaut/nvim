local status_ok, mason, mason_lspconfig, lspconfig, handlers

status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
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

local basic_servers = {
    "gdscript",
}

local extra_configured_servers = {
    "jsonls",
    "sumneko_lua",
    "pyright",
    "clangd",
    "hls",
    "wgsl_analyzer",
    "omnisharp",
}

handlers.setup()
mason.setup()
mason_lspconfig.setup({
    ensure_installed = extra_configured_servers,
})

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

for _, server in ipairs(basic_servers) do
    lspconfig[server].setup(opts)
end

for _, lsp in ipairs(extra_configured_servers) do
    local req_status, config = pcall(require, "lsp.settings." .. lsp)
    if req_status then
        lspconfig[lsp].setup(vim.tbl_deep_extend("force", opts, config))
    else
        lspconfig[lsp].setup(opts)
    end
end

local rust_analyzer_opts = require("lsp.settings.rust-analyzer")
opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)

local codelldb = require('mason-registry').get_package("codelldb"):get_install_path()
local extension_path = codelldb .. '/extension/'
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
