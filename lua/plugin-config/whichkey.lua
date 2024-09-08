local whichkey = require("which-key")

local maps = {
    ["|"] = "Create a side-by-side split",
    ["-"] = "Create top-bottom split",
    e = "Open NvimTree",
    s = "Open Symbols Outline",
    T = "Show inlay hints",
    f = "Format file using LSP",
    r = {
        name = "Rust tools",
        c = "Rust code action menu",
        i = "Inlay hints",
    },
    M = {
        name = "Mason",
        i = "Install",
        I = "Install Info",
        u = "Uninstall",
        l = "Log",
    },
    l = {
        name = "LSP",
        i = "Info",
        x = "Stop",
        s = "Start",
        h = "Hover",
        H = "Signature Help",
        r = "Rename",
        c = "Code action",
        f = "Open Float",
        g = {
            name = "Go to...",
            d = "Declaration",
            D = "Definition",
            i = "Implementation",
            r = "References"
        }
    },
    t = {
        name = "Telescope",
        o = "Open",
        d = "Diagnostics",
        q = "Quickfix",
        f = "Find file",
        c = "Code actions",
        l = "Live Grep",
        g = {
            name = "Git",
            s = "Status",
            c = "Commits",
            b = "Branches",
        },
    },
}

local bakedmaps = {}

local function bake(m, prefix)
    for key, value in pairs(m) do
        if type(value) == "table" then
            bake(value, prefix .. key)
        else
            table.insert(bakedmaps, { prefix .. key, desc = value })
        end
    end
end

bake(maps, "<leader>")

whichkey.add(bakedmaps)
