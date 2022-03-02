-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

if ConfigMode == "rich" then
	vim.g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "",
			staged = "S",
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "U",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
		},
	}
else
	vim.g.nvim_tree_icons = {
		default = "f ",
		symlink = "fs",
		git = { -- ignored, we don't use it in simple ConfigMode
			unstaged = "",
			staged = "",
			unmerged = "",
			renamed = "",
			deleted = "",
			untracked = "",
			ignored = "",
		},
		folder = {
			default = "D ",
			open = "Do",
			empty = "d",
			empty_open = "do",
			symlink = "ds",
		},
	}
end

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local diagnostics_enable = true
local file_icons_enable = 0
local diagnostic_icons = {
	hint = "! ",
	info = "I ",
	warning = "W ",
	error = "E ",
}
local git_icons_enable = false

if ConfigMode == "rich" then
	diagnostics_enable = true
	file_icons_enable = 1
	diagnostic_icons = {
		hint = " ",
		info = " ",
		warning = " ",
		error = " ",
	}

	git_icons_enable = true
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = diagnostics_enable,
		icons = diagnostic_icons,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = git_icons_enable,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = false,
		relativenumber = false,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = file_icons_enable,
		folders = file_icons_enable,
		files = file_icons_enable,
		folder_arrows = file_icons_enable,
		tree_width = 30,
	},
})
