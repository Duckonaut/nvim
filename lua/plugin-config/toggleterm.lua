local toggleterm = require("toggleterm")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "single",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "jk", "<C-\\><C-n>", { noremap = true })
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

local standard = Terminal:new({
  cmd = "zsh",
  direction = "float",
  float_opts = {
    border = "single",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
  end,
})

function _standard_toggle()
  standard:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _standard_toggle()<CR>", { noremap = true, silent = true })

-- setup standard term toggle from terminal
vim.api.nvim_set_keymap("t", "<leader>tt", "<C-\\><C-n><cmd>lua _standard_toggle()<CR>", { noremap = true, silent = true })
