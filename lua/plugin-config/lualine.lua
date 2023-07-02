local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local icons_enabled = false
local component_separators = { left = "", right = "" }
local section_separators = { left = "", right = "" }

local colors = require("fenchurch.palette")

local fenchurch_theme = {
    normal = {
        a = { fg = colors.bg, bg = colors.vivid_blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.bg, bg = colors.bg },
    },

    insert = { a = { fg = colors.bg, bg = colors.green } },
    visual = { a = { fg = colors.bg, bg = colors.magenta } },
    replace = { a = { fg = colors.bg, bg = colors.red } },
    terminal = { a = { fg = colors.bg, bg = colors.fg } },
    command = { a = { fg = colors.bg, bg = colors.blue } },

    inactive = {
        a = { fg = colors.white, bg = colors.bg },
        b = { fg = colors.white, bg = colors.bg },
        c = { fg = colors.bg, bg = colors.bg },
    },
}

require('lualine').setup {
    options = {
        theme = fenchurch_theme,
        icons_enabled = icons_enabled,
        component_separators = component_separators,
        section_separators = section_separators,
    },
    sections = {
        lualine_a = {
            { 'mode', right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
