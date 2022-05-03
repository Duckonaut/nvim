local packer = require("packer")

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])



packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function()
	use({ "wbthomason/packer.nvim" }) -- plugin manager
	use({ "neovim/nvim-lspconfig" }) -- allows for configuration of the LSP system
	use({
		"nvim-lua/lsp_extensions.nvim", -- adds extra features to some languages using LSPP
		config = function()
			require("lsp_extensions") -- just starts lsp_extensions so it's really ok here
		end,
	})
	use({ "github/copilot.vim" })
	use({ "simrat39/rust-tools.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- formatter
	use({ "williamboman/nvim-lsp-installer" }) -- super easy LSP server installer
	use({ "rcarriga/nvim-notify" }) -- pretty notifications
	use({
		"nvim-telescope/telescope.nvim", -- anything-finder with a nice UI
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim" }) -- fast backend for telescope

	use({
		"hrsh7th/nvim-cmp", -- completion menu
		requires = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	})
	use({ "hrsh7th/cmp-nvim-lsp" }) -- cmp LSP source
	use({ "hrsh7th/cmp-buffer" }) -- cmp raw text source
	use({ "hrsh7th/cmp-path" }) -- cmp filesystem source
	use({ "hrsh7th/cmp-cmdline" }) -- cmp shell command source
	use({ "saadparwaiz1/cmp_luasnip" }) -- cmp snippet source
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- snippet collection

	use({ "windwp/nvim-autopairs" }) -- automatic parentheses and braces pairs
	use({ "nvim-treesitter/nvim-treesitter", before = "neorg" }) -- greater syntax highlighting
	use({ "kyazdani42/nvim-tree.lua" }) -- file explorer
	use({ "folke/which-key.nvim" }) -- for when you don't know a key combination
	use({ "numToStr/Comment.nvim" }) -- comment out sections of code in a ton of languages
	use({ "nvim-lualine/lualine.nvim" }) -- status bar at the bottom
	use({ "akinsho/bufferline.nvim" }) -- buffer tabs at the top
	use({ "mfussenegger/nvim-dap" }) -- debugger
	use({ "Pocco81/DAPInstall.nvim" }) -- debugger installerr
--	use({ "ChristianChiarulli/dashboard-nvim" }) -- very nice looking start page
	use({ "b0o/schemastore.nvim" }) -- json schema store for autocompletion in common json formats
--  use({ "lunarvim/colorschemes" }) -- nice colorschemes for rich mode
    use({ "AlphaTechnolog/onedarker.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "drewtempelmeyer/palenight.vim" })
	use({ "kyazdani42/nvim-web-devicons", opt = true }) -- cool pretty icons
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
    use({ "tikhomirov/vim-glsl" })
    use({ "ARM9/arm-syntax-vim" })

    use ({
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim"
    })
end)
