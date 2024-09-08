local status, luasnip = pcall(require, "luasnip")
if not status then
    return
end

luasnip.config.setup({
    delete_check_events = "InsertLeave",
})

local unlinkgrp = vim.api.nvim_create_augroup(
    'UnlinkSnippetOnModeChange',
    { clear = true }
)

vim.api.nvim_create_autocmd('ModeChanged', {
    group = unlinkgrp,
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving the insert mode',
    callback = function(evt)
        if luasnip.session
            and luasnip.session.current_nodes[evt.buf]
            and not luasnip.session.jump_active
        then
            luasnip.unlink_current()
        end
    end,
})
