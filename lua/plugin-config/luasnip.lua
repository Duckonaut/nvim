local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

luasnip.config.setup({
    delete_check_events = "InsertLeave",
})
