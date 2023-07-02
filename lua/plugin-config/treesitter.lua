local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.hezen = {
    install_info = {
        url = "~/repos/tree-sitter-hezen", -- local path or git repo
        files = { "src/parser.c" },
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "hezen", -- if filetype does not match the parser name
}

parser_configs.brakion = {
    install_info = {
        url = "~/repos/tree-sitter-brakion", -- local path or git repo
        files = { "src/parser.c" },
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "brakion", -- if filetype does not match the parser name
}

parser_configs.weave = {
    install_info = {
        url = "~/repos/tree-sitter-weave", -- local path or git repo
        files = { "src/parser.c" },
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "weave", -- if filetype does not match the parser name
}

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
        },
    },
})
