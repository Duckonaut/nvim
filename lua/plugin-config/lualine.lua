local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local icons_enabled = false
local component_separators = { left = "", right = "" }
local section_separators = { left = "", right = "" }

if ConfigMode == "rich" then
	--icons_enabled = true
	--component_separators = { left = "", right = "" }
	--section_separators = { left = "", right = "" }
end

lualine.setup({
	options = {
		icons_enabled = icons_enabled,
		component_separators = component_separators,
		section_separators = section_separators,
	},
})
