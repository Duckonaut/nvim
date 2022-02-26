vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.smarttab = true
vim.opt.softtabstop=4
vim.opt.mouse= 'a'
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'


require('plugins')
require('mappings')
require('cmp-settings')
require('lsp')
require('nvimtree')
require('dashboard')
require('lualine-settings')

vim.cmd('colorscheme onedarker')
