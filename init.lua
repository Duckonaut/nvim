local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

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
vim.opt.list = true
vim.opt.listchars = "tab:➜ ,lead:·,trail:·"
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

require("plugins")

if is_bootstrap then
    print("Bootstrapping complete. Restart when plugins are installed.")
    require("packer").sync()

    return
end

require("mappings")
require("lsp")
require("plugin-config")

vim.cmd("colorscheme fenchurch")

vim.cmd([[
    autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
    autocmd! BufNewFile,BufRead *.gd set noexpandtab
]])
