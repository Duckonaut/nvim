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

function G_lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua G_lazygit_toggle()<CR>", { noremap = true, silent = true })

local shell = "zsh"
if vim.fn.has("win32") == 1 then
  local in_msys = vim.fn.getcwd():find("msys64") ~= nil
  if in_msys then
    shell = "bash"
    vim.cmd("set shellcmdflag=-s")
  else
    shell = "powershell"
    vim.cmd("set shell=powershell")
    vim.cmd("set shellcmdflag=-NoProfile\\ -NoLogo\\ -Command")
  end
end

local standard = Terminal:new({
  cmd = shell,
  direction = "float",
  float_opts = {
    border = "single",
  },
  -- function to run on opening the terminal
  on_open = function()
    vim.cmd("startinsert!")
  end,
})

function G_standard_toggle()
  standard:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua G_standard_toggle()<CR>", { noremap = true, silent = true })

-- setup standard term toggle from terminal
vim.api.nvim_set_keymap("t", "<leader>tt", "<C-\\><C-n><cmd>lua G_standard_toggle()<CR>", { noremap = true, silent = true })
