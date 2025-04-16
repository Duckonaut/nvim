local M = {}

-- TODO: backfill this to template
M.setup = function()
    local sign_map = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '',
    }
    local config = {
        -- enable virtual text
        virtual_text = {
            prefix = function(diagnostic)
                if sign_map[diagnostic.severity] == nil then
                    return ""
                else
                    return sign_map[diagnostic.severity]
                end
            end,
            spacing = 1,
        },
        virtual_lines = {
            current_line = true,
        },
        signs = {
            text = sign_map,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec2(
            [[
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            { output = false }
        )
    end
end

M.on_attach = function(client)
    lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
