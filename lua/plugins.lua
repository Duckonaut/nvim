local packer = require('packer')

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = "rounded" }
		end
	}
}

return packer.startup(function()
  use { 'wbthomason/packer.nvim'}
  use { 'neovim/nvim-lspconfig'}
  use { 'tamago324/nlsp-settings.nvim'}
  use { 'jose-elias-alvarez/null-ls.nvim'}
  use { 'williamboman/nvim-lsp-installer'}
  use { 'rcarriga/nvim-notify'}
  use { 'lunarvim/colorschemes' }
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = "  ",
          initial_mode = "insert",
        selection_strategy = "reset",
          sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.75,
          preview_cutoff = 120,
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        mappings = {
          i = {
--            ["<C-n>"] = actions.move_selection_next,
--            ["<C-p>"] = actions.move_selection_previous,
--            ["<C-c>"] = actions.close,
--            ["<C-j>"] = actions.cycle_history_next,
--            ["<C-k>"] = actions.cycle_history_prev,
--            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
--            ["<CR>"] = actions.select_default + actions.center,
          },
          n = {
--            ["<C-n>"] = actions.move_selection_next,
--            ["<C-p>"] = actions.move_selection_previous,
--            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
        file_ignore_patterns = {},
        path_display = { shorten = 5 },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        pickers = {
          find_files = {
            find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
          },
          live_grep = {
            --@usage don't include the filename in the search results
            only_sort_text = true,
          },
        },
      },
    }
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim'}

  use { 'hrsh7th/nvim-cmp',
        requires = {
          'L3MON4D3/LuaSnip',
          'rafamadriz/friendly-snippets'
        }
  } 
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { "rafamadriz/friendly-snippets" }
  use { 'windwp/nvim-autopairs' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'folke/which-key.nvim',
    config = function()
      require('which-key').setup(require('whichkey'))
    end
  }
  use { 'numToStr/Comment.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim' }
  use { 'mfussenegger/nvim-dap' }
  use { 'Pocco81/DAPInstall.nvim' }
  use { 'ChristianChiarulli/dashboard-nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'b0o/schemastore.nvim' }
end)
