require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    study = "~/notes/study",
                    home = "~/notes/home",
                }
            }
        },
        ["core.norg.concealer"] = {},
    }
})
