require("plugin-config.cmp")
require("plugin-config.dashboard")
require("plugin-config.lualine")
require("plugin-config.nvim-tree")
require("plugin-config.telescope")
require("plugin-config.whichkey")
require("plugin-config.null-ls")
require("plugin-config.notify")

if ConfigMode == 'rich' then
	require("plugin-config.web-devicons")
end
