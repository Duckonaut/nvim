-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
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

vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = require("plugins"),
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "fenchurch" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("mappings")
require("lsp")
require("plugin-config")

vim.cmd("colorscheme fenchurch")

vim.cmd([[
    autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
    autocmd! BufNewFile,BufRead *.gd setlocal noexpandtab
    autocmd! BufNewFile,BufRead *.ts,*.tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd! BufNewFile,BufRead *.js,*.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd! BufNewFile,BufRead *.luax,*.html,*.css,*.scss,*.json,*.yml,*.yaml,*.md,*.markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2
]])

-- zen mode
vim.cmd([[
    function! ZenMode()
        if !exists('g:zen_mode')
            let g:zen_mode = 0
        endif
        if g:zen_mode == 0
            setlocal nolist
            setlocal nonumber
            lua require('lualine').hide()
            g:zen_mode = 1
        else
            setlocal list
            setlocal number
            lua require('lualine').hide({unhide=true})
            g:zen_mode = 0
        endif
    endfunction
    command! ZenMode call ZenMode()
]])
