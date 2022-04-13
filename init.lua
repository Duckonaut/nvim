ConfigMode = "rich" -- changes the config to suit either a full nerdfont/truecolor setup, or a simple 8 color tty ('rich' or 'simple')

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.scl = "yes"
vim.opt.guifont = "Hack:h10"
vim.opt.expandtab = true

if ConfigMode == "rich" then
	vim.opt.termguicolors = true
	vim.o.background = "dark"
	vim.opt.clipboard = "unnamedplus"
	vim.cmd("colorscheme onedarker")
end

require("plugins")
require("mappings")
require("lsp")
require("plugin-config")
