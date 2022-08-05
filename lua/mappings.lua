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

-- leader mappings
map(normal_mode, "<leader>e", ":NvimTreeToggle<CR>", opts)
map(normal_mode, "<leader>T", ":lua require'lsp_extensions'.inlay_hints()<CR>", opts)
map(normal_mode, "<leader>f", ":lua vim.lsp.buf.formatting_sync()<CR>", opts)
map(normal_mode, "<leader>-", ":split<CR><C-w><C-w>", opts)
map(normal_mode, "<leader>|", ":vsplit<CR><C-w><C-w>", opts)

-- rust mappings
map(normal_mode, "<leader>ri", ":lua require('rust-tools.inlay_hints').set_inlay_hints()<CR>", opts)

-- Mason
map(normal_mode, "<leader>Mi", ":MasonInstall ", opts)
map(normal_mode, "<leader>Mu", ":MasonUninstall ", opts)
map(normal_mode, "<leader>MI", ":Mason<CR>", opts)
map(normal_mode, "<leader>Ml", ":masonLog<CR>", opts)

-- LSP
map(insert_mode, "<C-.>", "<cmd>Telescope quickfix<CR>", opts)

map(normal_mode, "<leader>li", ":LspInfo<CR>", opts)
map(normal_mode, "<leader>lx", ":LspStop<CR>", opts)
map(normal_mode, "<leader>ls", ":LspStart<CR>", opts)

map(normal_mode, "<leader>lgd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map(normal_mode, "<leader>lgD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map(normal_mode, "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map(normal_mode, "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map(normal_mode, "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map(normal_mode, "<leader>lH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map(normal_mode, "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map(normal_mode, "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map(normal_mode, "<leader>lf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map(normal_mode, "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
map(normal_mode, "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
--map(normal_mode, "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Telescope
map(normal_mode, "<leader>to", ":Telescope<CR>", opts)
map(normal_mode, "<leader>td", ":Telescope diagnostics<CR>", opts)
map(normal_mode, "<leader>tq", ":Telescope quickfix<CR>", opts)
map(normal_mode, "<leader>tf", ":Telescope find_files<CR>", opts)
map(normal_mode, "<leader>tc", ":Telescope lsp_code_actions<CR>", opts)
map(normal_mode, "<leader>tl", ":Telescope live_grep<CR>", opts)

-- Telescope git
map(normal_mode, "<leader>tgs", ":Telescope git_status<CR>", opts)
map(normal_mode, "<leader>tgc", ":Telescope git_commits<CR>", opts)
map(normal_mode, "<leader>tgb", ":Telescope git_branches<CR>", opts)

-- Symbols outline
map(normal_mode, "<leader>s", ":SymbolsOutline<CR>", opts)
