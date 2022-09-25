if vim.fn.has('unix') then
    return {
        cmd = { vim.env.HOME .. "/.local/share/nvim/mason/bin/omnisharp" },
    }
else
    return {}
end
