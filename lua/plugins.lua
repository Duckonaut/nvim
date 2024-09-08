return {
    { "neovim/nvim-lspconfig" },        -- allows for configuration of the LSP system
    {
        "nvim-lua/lsp_extensions.nvim", -- adds extra features to some languages using LSPP
        config = function()
            require("lsp_extensions")   -- just starts lsp_extensions so it's really ok here
        end,
    },
    { "hood/popui.nvim" },         -- list selection UI
    { "simrat39/rust-tools.nvim" },
    { "williamboman/mason.nvim" }, -- new LSP server installer
    { "williamboman/mason-lspconfig.nvim" },
    { "github/copilot.vim" },
    {
        "nvim-telescope/telescope.nvim", -- anything-finder with a nice UI
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-fzf-native.nvim" }, -- fast backend for telescope
    {
        "hrsh7th/nvim-cmp",                         -- completion menu
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",     -- cmp LSP source
            "hrsh7th/cmp-buffer",       -- cmp raw text source
            "hrsh7th/cmp-path",         -- cmp filesystem source
            "hrsh7th/cmp-cmdline",      -- cmp shell command source
            "saadparwaiz1/cmp_luasnip", -- cmp snippet source
        },
    },

    { "rcarriga/nvim-notify" },            -- pretty notifications

    { "windwp/nvim-autopairs" },           -- automatic parentheses and braces pairs
    { "nvim-treesitter/nvim-treesitter" }, -- greater syntax highlighting
    { "nvim-treesitter/playground" },      -- treesitter playground
    { "kyazdani42/nvim-tree.lua" },        -- file explorer
    {
        "folke/which-key.nvim",            -- for when you don't know a key combination
        opts = {
            delay = function(ctx)
                return ctx.plugin and 0 or 400
            end,
        }
    },
    { "numToStr/Comment.nvim" },         -- comment out sections of code in a ton of languages
    { "nvim-lualine/lualine.nvim" },     -- status bar at the bottom
    { "mfussenegger/nvim-dap" },         -- debugger
    { "rcarriga/nvim-dap-ui" },          -- debugger UI
    { "mfussenegger/nvim-lint" },        -- linter
    { "mhartington/formatter.nvim" },    -- formatter
    { "b0o/schemastore.nvim" },          -- json schema store for autocompletion in common json formats
    { "AlphaTechnolog/onedarker.nvim" },
    { "kyazdani42/nvim-web-devicons", }, -- cool pretty icons
    { "simrat39/symbols-outline.nvim" },
    { "jiaoshijie/undotree" },
    { "j-hui/fidget.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "gpanders/editorconfig.nvim" },
    { 'RaafatTurki/hex.nvim',         opts = {} },
    { "elkowar/yuck.vim" },
    { "akinsho/toggleterm.nvim" },

    { "Duckonaut/fenchurch" },
    { "Duckonaut/fog_of_war.nvim",    opts = {} },
}
