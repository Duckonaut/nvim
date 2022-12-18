local telescope = require("telescope")

local prompt_prefix = " "
local selection_caret = " "
local border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
local color_devicons = false

telescope.setup({
    defaults = {
        prompt_prefix = prompt_prefix,
        selection_caret = selection_caret,
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
                -- ["<C-n>"] = actions.move_selection_next,
                -- ["<C-p>"] = actions.move_selection_previous,
                -- ["<C-c>"] = actions.close,
                -- ["<C-j>"] = actions.cycle_history_next,
                -- ["<C-k>"] = actions.cycle_history_prev,
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
                -- ["<C-n>"] = actions.move_selection_next,
                -- ["<C-p>"] = actions.move_selection_previous,
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
        file_ignore_patterns = {},
        path_display = { shorten = 5 },
        winblend = 0,
        border = true,
        borderchars = border_chars,
        color_devicons = color_devicons,
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
})
