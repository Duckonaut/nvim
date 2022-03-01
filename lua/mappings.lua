local insert_mode = "i"
local normal_mode = "n"
local term_mode = "t"
local visual_mode = "v"
local visual_block_mode = "x"
local command_mode = "c"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--map(normal_mode, '<leader>', ':WhichKey<CR>')
map(normal_mode, '<C-h>', '<C-w>h', opts)
map(normal_mode, '<C-j>', '<C-w>j', opts)
map(normal_mode, '<C-k>', '<C-w>k', opts)
map(normal_mode, '<C-l>', '<C-w>l', opts)

map(normal_mode, "<leader>e", ":NvimTreeToggle<CR>", opts)
map(normal_mode, "<leader>T", ":lua require'lsp_extensions'.inlay_hints()<CR>", opts)

map(normal_mode, '<C-Up>', ':resize -2<CR>', opts)
map(normal_mode, '<C-Down>', ':resize +2<CR>', opts)
map(normal_mode, '<C-Left>', ':vertical resize -2<CR>', opts)
map(normal_mode, '<C-Right>', ':vertical resize +2<CR>', opts)

map(visual_mode, "<", "<gv", opts)
map(visual_mode, ">", ">gv", opts)

map(term_mode, "<C-h>", "<C-\\><C-N><C-W>h", term_opts)
map(term_mode, "<C-j>", "<C-\\><C-N><C-W>j", term_opts)
map(term_mode, "<C-k>", "<C-\\><C-N><C-W>k", term_opts)
map(term_mode, "<C-l>", "<C-\\><C-N><C-W>l", term_opts)

