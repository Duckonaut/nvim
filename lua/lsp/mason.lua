local status_ok, mason, mason_lspconfig, handlers

status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

status_ok, handlers = pcall(require, "lsp.handlers")
if not status_ok then
    return
end

local external_servers = {
    "gdscript",
    "zls",
}

mason_lspconfig.setup({
    automatic_enable = false,
})

handlers.setup()
mason.setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

for _, server in ipairs(external_servers) do
    vim.lsp.enable(server)
    local req_status, config = pcall(require, "lsp.settings." .. server)
    if req_status then
        local full_config = vim.tbl_deep_extend("force", opts, config)
        vim.lsp.config(server, full_config)
    else
        vim.lsp.config(server, opts)
    end
end

for _, lsp in ipairs(mason_lspconfig.get_installed_servers()) do
    vim.lsp.enable(lsp)
    local req_status, config = pcall(require, "lsp.settings." .. lsp)
    if req_status then
        local full_config = vim.tbl_deep_extend("force", opts, config)
        vim.lsp.config(lsp, full_config)
    else
        vim.lsp.config(lsp, opts)
    end
end
